def ciProject = 'labs-ci-cd'
def testProject = 'labs-test'
def devProject = 'labs-dev'
openshift.withCluster() {
    openshift.withProject() {
        ciProject = openshift.project()
        testProject = ciProject.replaceFirst(/^labs-ci-cd/, 'labs-test')
        devProject = ciProject.replaceFirst(/^labs-ci-cd/, 'labs-dev')
    }
}

pipeline {
    agent {
        label 'jenkins-slave-mvn'
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
                         withSonarQubeEnv('sonar') {
                           try {
                             sh 'mvn install sonar:sonar'
                           } catch (error) {
                             publishHTML(target: [
                               reportDir             : 'target',
                               reportFiles           : 'dependency-check-report.html',
                               reportName            : 'OWASP Dependency Check Report',
                               keepAll               : true,
                               alwaysLinkToLastBuild : true,
                               allowMissing          : true
                             ])
                             throw error
                           }


                         }
                         def qualitygate = waitForQualityGate()
                         if (qualitygate.status != "OK") {
                             error "Pipeline aborted due to quality gate failure: ${qualitygate.status}"
                         }
                      }
                      publishHTML(target: [
                          reportDir             : 'target',
                          reportFiles           : 'dependency-check-report.html',
                          reportName            : 'OWASP Dependency Check Report',
                          keepAll               : true,
                          alwaysLinkToLastBuild : true,
                          allowMissing          : false
                      ])
                  }
              }
              stage('Ensure SonarQube Webhook is configured') {
                  when {
                      expression {
                          withSonarQubeEnv('sonar') {
                              def retVal = sh(returnStatus: true, script: "curl -u \"${SONAR_AUTH_TOKEN}:\" http://sonarqube:9000/api/webhooks/list | grep Jenkins")
                              echo "CURL COMMAND: ${retVal}"
                              return (retVal > 0)
                          }
                      }
                  }
                  steps {
                      withSonarQubeEnv('sonar') {
                          sh "curl -X POST -u \"${SONAR_AUTH_TOKEN}:\" -F \"name=Jenkins\" -F \"url=http://jenkins/sonarqube-webhook/\" http://sonarqube:9000/api/webhooks/create"
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
              sh "rm -rf ocp && mkdir -p ocp/deployments"
              sh "pwd && ls -la target "
              sh "cp target/human-review-backend-*.jar ocp/deployments"
              script {
                 openshift.withCluster() {
                    openshift.withProject("${ciProject}") {
                       openshift.selector("bc", "human-review-backend").startBuild("--from-dir=./ocp","--follow", "--wait=true")
                    }
                 }
              }
           }
        }
        stage('Promote to TEST') {
            steps {
                script {
                    openshift.withCluster() {
                        openshift.withProject("${ciProject}") {
                            openshift.tag("human-review-backend:latest", "${testProject}/human-review-backend:latest")
                        }
                    }
                    emailext  to: 'kfrankli@redhat.com',
                    subject: "ACTION REQUIRED: Promoted ${currentBuild.fullDisplayName} to TEST",
                    body: """Successfully built and promoted ${currentBuild.fullDisplayName} to TEST: INPUT Required ${env.BUILD_URL}input/  If the page is empty, someone else has already approved or aborted the promotion"""
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
                  openshift.withCluster() {
                      openshift.withProject("${ciProject}") {
                          openshift.tag("human-review-backend:latest", "${devProject}/human-review-backend:latest")
                      }
                  }
              }
          }
        }
    }
    post {
      failure {
        emailext to: 'kfrankli@redhat.com',
        subject: "Failed Pipeline: ${currentBuild.fullDisplayName}",
        attachLog: true,
        attachmentsPattern: 'target/dependency-check-report.html',
        body: """BUILD FAILED ${env.BUILD_URL}

Please see attached:
    Build Log (build.log)
    OWASP Dependency Scanner Report (dependency-check-report.html)

SonarQube reports reside at:
    https://sonarqube-labs-ci-cd.apps.domino.rht-labs.com/dashboard?id=gov.dhs.nppd%3Ahuman-review-backend"""
      }
      success {
        emailext to: 'kfrankli@redhat.com',
        subject: "Successful Pipeline Build Reports: ${currentBuild.fullDisplayName}",
        attachmentsPattern: 'target/dependency-check-report.html',
        body: """Build worked ${env.BUILD_URL}
Please see attached:
    OWASP Dependency Scanner Report (dependency-check-report.html)

SonarQube reports reside at:
    https://sonarqube-labs-ci-cd.apps.domino.rht-labs.com/dashboard?id=gov.dhs.nppd%3Ahuman-review-backend"""
      }
    }
}
