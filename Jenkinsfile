def ciProject = 'yellowdog'
def testProject = 'yellowdog-test'
def devProject = 'yellowdog-dev'

pipeline {
  agent {
    kubernetes {
      label "maven-${env.BUILD_ID}"
      defaultContainer 'jenkins-slave-mvn'
      yaml """
apiVersion: v1
kind: Pod
metadata:
  labels:
    pod-template: jenkins-slave-mvn
spec:
  containers:
  - name: jenkins-slave-npm
    image: docker-registry.default.svc:5000/yellowdog/jenkins-slave-mvn
    tty: true
    env:
    - name: PATH
      value: "/bin:/usr/bin:/usr/local/bin:/sbin:/usr/sbin:/usr/local/sbin:/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.191.b12-0.el7_5.x86_64/bin"
    command:
    - cat
"""
    }
  }
  environment {
    PROJECT_NAME = 'human-review-backend'
    KUBERNETES_NAMESPACE = "${ciProject}"
  }
  stages {
    stage('Build, Quality, And Security') {
      parallel {
        stage('Build App') {
          steps {
            script {
              def pom = readMavenPom file: 'pom.xml'
              version = pom.version
              withSonarQubeEnv('sonarqube') {
                try {
                  sh 'mvn install sonar:sonar'
                } catch (error) {
                  publishHTML(target: [
                          reportDir            : 'target',
                          reportFiles          : 'dependency-check-report.html',
                          reportName           : 'OWASP Dependency Check Report',
                          keepAll              : true,
                          alwaysLinkToLastBuild: true,
                          allowMissing         : true
                  ])
                  publishHTML([
                          allowMissing         : true,
                          alwaysLinkToLastBuild: false,
                          keepAll              : true,
                          reportDir            : 'target/site/jacoco/',
                          reportFiles          : 'index.html',
                          reportName           : 'Jacoco Unit Test Report'
                  ])
                  zip dir: 'target/site/jacoco/',
                          glob: '',
                          zipFile: 'target/site/jacoco/jacoco-unit-tests.zip',
                          archive: false
//                  emailext to: 'kfrankli@redhat.com',
//                          attachmentsPattern: '**/*.zip',
//                          subject: "Pipeline Build ${currentBuild.fullDisplayName} Unit Test Reports",
//                          body: """Pipeline Build ${
//                            currentBuild.fullDisplayName
//                          } Unit Test Reports attached."""
                  throw error
                }
              }
              def qualitygate = waitForQualityGate()
              if (qualitygate.status != "OK") {
                error "Pipeline aborted due to quality gate failure: ${qualitygate.status}"
              }
            }
            publishHTML(target: [
                    reportDir            : 'target',
                    reportFiles          : 'dependency-check-report.html',
                    reportName           : 'OWASP Dependency Check Report',
                    keepAll              : true,
                    alwaysLinkToLastBuild: true,
                    allowMissing         : false
            ])
            publishHTML(target: [
                    reportDir            : 'target/site/jacoco/',
                    reportFiles          : 'index.html',
                    reportName           : 'Jacoco Unit Test Report',
                    allowMissing         : true,
                    alwaysLinkToLastBuild: false,
                    keepAll              : true
            ])
            sh "mkdir jacoco-tmp && cp -r target/site/jacoco jacoco-tmp && rm jacoco-tmp/jacoco/jacoco-resources/*.js"
            zip dir: 'target/site/jacoco/',
                    glob: '',
                    zipFile: 'jacoco-unit-test-report.zip',
                    archive: true
            zip dir: 'jacoco-tmp/jacoco/',
                    glob: '',
                    zipFile: 'jacoco-unit-test-report-no-js.zip',
                    archive: false
          }
        }
        stage('Ensure SonarQube Webhook is configured') {
          when {
            expression {
              withSonarQubeEnv('sonarqube') {
                def retVal = sh(returnStatus: true, script: "curl -k -u \"${SONAR_AUTH_TOKEN}:\" http://sonarqube.sonarqube.svc:9000/api/webhooks/list | grep Jenkins")
                echo "CURL COMMAND: ${retVal}"
                return (retVal > 0)
              }
            }
          }
          steps {
            withSonarQubeEnv('sonarqube') {
              sh "/usr/bin/curl -k -X POST -u \"${SONAR_AUTH_TOKEN}:\" -F \"name=Jenkins\" -F \"url=http://teams-yellowdog.cloudbees.svc:80/teams-yellowdog/sonarqube-webhook/\" http://sonarqube.sonarqube.svc:9000/api/webhooks/create"
            }
          }
        }
      }
    }
    stage('Create Image Builder') {
      when {
        expression {
          openshift.withCluster() {
            openshift.withProject("${ciProject}") {
              return !openshift.selector("bc", "human-review-backend").exists();
            }
          }
        }
      }
      steps {
        script {
          openshift.withCluster() {
            openshift.withProject("${ciProject}") {
              openshift.newBuild("--name=human-review-backend", "--image-stream=redhat-openjdk18-openshift:1.2", "--binary=true")
            }
          }
        }
      }
    }
    stage('Build Image') {
      steps {
        script {
          withEnv(['PATH=/bin:/usr/bin:/usr/local/bin:/sbin:/usr/sbin:/usr/local/sbin:$PATH']) {
            sh 'oc login --token=$(cat /run/secrets/kubernetes.io/serviceaccount/token) --insecure-skip-tls-verify=true https://openshift.default.svc:443'
            sh "oc project ${ciProject}"
            sh "oc start-build ${env.PROJECT_NAME} --from-file=target/human-review-backend-*.jar --wait"
          }
        }
      }
    }
    stage('Promote to TEST') {
      steps {
        script {
          sh "oc tag ${ciProject}/${env.PROJECT_NAME}:latest ${testProject}/${env.PROJECT_NAME}:latest"

          def buildUrl = env.BUILD_URL
          buildUrl = buildUrl.replaceAll(/\n*/, '')

//          emailext to: 'john.johnson@hq.dhs.gov,snayak@bcmcgroup.com,ncho@bcmcgroup.com,kfrankli@redhat.com',
//                  subject: "ACTION REQUIRED: Promote ${currentBuild.fullDisplayName} from TEST to DEMO?",
//                  body: """Successfully built and deployed ${currentBuild.fullDisplayName} to TEST, should this be promoted to DEMO?
//INPUT Required:
//${buildUrl}input/
//
//If the above link does not contain "promote" and "abort" buttons, someone else has already approved or aborted the promotion
//
//Please review the following before promoting:
// * OWASP Dependency Scanner Report:
//      ${buildUrl}/OWASP_20Dependency_20Check_20Report/
// * JaCoCo Unit Test Report:
//      ${buildUrl}/Jacoco_20Unit_20Test_20Report/
// * SonarQube reports:
//      https://sonarqube-sonarqube.apps.mgt.devsecops.gov/dashboard?id=gov.dhs.nppd%3Ahuman-review-backend"""
        }
      }
    }
    stage('Promote to DEMO') {
      input {
        message "Promote service to DEMO environment?"
        ok "PROMOTE"
      }
      steps {
        script {
          sh "oc tag ${ciProject}/${env.PROJECT_NAME}:latest ${devProject}/${env.PROJECT_NAME}:latest"
        }
      }
    }
  }
  post {
    failure {
      script {
        def buildUrl = env.BUILD_URL
        buildUrl = buildUrl.replaceAll(/\n*/, '')
//        emailext to: 'john.johnson@hq.dhs.gov,snayak@bcmcgroup.com,ncho@bcmcgroup.com,kfrankli@redhat.com',
//                subject: "Failed Pipeline: ${currentBuild.fullDisplayName}",
//                attachLog: true,
//                attachmentsPattern: 'target/dependency-check-report.html',
//                body: """BUILD FAILED ${buildUrl}
//
//Please see attached:
//      Build Log (build.log)
//      OWASP Dependency Scanner Report (dependency-check-report.html)
//
//SonarQube reports reside at:
//      https://sonarqube-sonarqube.apps.mgt.devsecops.gov/dashboard?id=gov.dhs.nppd%3Ahuman-review-backend"""
      }
    }
    success {
      script {
        def buildUrl = env.BUILD_URL
        buildUrl = buildUrl.replaceAll(/\n*/, '')
//        emailext to: 'john.johnson@hq.dhs.gov,snayak@bcmcgroup.com,ncho@bcmcgroup.com,kfrankli@redhat.com',
//                subject: "Successful Pipeline Build Reports: ${currentBuild.fullDisplayName}",
//                attachmentsPattern: 'target/dependency-check-report.html,jacoco-unit-test-report-no-js.zip',
//                body: """Build worked ${buildUrl}
//
//Please see attached:
//      OWASP Dependency Scanner Report (dependency-check-report.html)
//      JaCoCo Unit Test Report* (jacoco-unit-test-report-no-js.zip)
//Reports also available at:
//      OWASP Dependency Scanner Report:
//         ${buildUrl}/OWASP_20Dependency_20Check_20Report/
//      JaCoCo Unit Test Report:
//         ${buildUrl}/Jacoco_20Unit_20Test_20Report/
//      SonarQube reports reside at:
//         https://sonarqube-sonarqube.apps.mgt.devsecops.gov/dashboard?id=gov.dhs.nppd%3Ahuman-review-backend
//
//* The JaCoCo Unit Test Report has been modified slightly to remove all JavaScript report formatting files; as most email servers will not allow the transmission of Zip attachments container JavaScript (*.js) files. The unmodified JaCoCo report is available at:
//      ${buildUrl}/artifact/jacoco-unit-test-report.zip"""
      }
    }
  }
}
