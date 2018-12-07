package org.openapitools.datasource;

import java.util.HashMap;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.liquibase.LiquibaseProperties;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.core.env.Environment;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.orm.jpa.vendor.HibernateJpaVendorAdapter;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import liquibase.integration.spring.SpringLiquibase;

@Configuration
@EnableTransactionManagement
@EnableJpaRepositories(basePackages = {"org.openapitools.repository.auth"},
        entityManagerFactoryRef = "authEntityManager",
        transactionManagerRef = "authTransactionManager")
public class Auth_DataSource {
    
	@Autowired
    private Environment env;
   
    @Bean
    @Primary
    public LocalContainerEntityManagerFactoryBean authEntityManager() {
        LocalContainerEntityManagerFactoryBean em = new LocalContainerEntityManagerFactoryBean();
        em.setDataSource(authDatasource());
        em.setPackagesToScan(new String[]{"org.openapitools.model.auth"});
        em.setPersistenceUnitName("authEntityManager");
        HibernateJpaVendorAdapter vendorAdapter = new HibernateJpaVendorAdapter();
        em.setJpaVendorAdapter(vendorAdapter);
        HashMap<String, Object> properties = new HashMap<>();
        properties.put("hibernate.dialect",
                env.getProperty("spring.jooq.sql-dialect"));
        properties.put("hibernate.show-sql",
                env.getProperty("jdbc.show-sql"));
        em.setJpaPropertyMap(properties);
        return em;
    }

    @Primary
    @Bean
    public DataSource authDatasource() {

        DriverManagerDataSource dataSource
                = new DriverManagerDataSource();
        dataSource.setDriverClassName(
                env.getProperty("jdbc.driver-class-name"));
        dataSource.setUrl(env.getProperty("auth.datasource.url"));
        dataSource.setUsername(env.getProperty("auth.datasource.username"));
        dataSource.setPassword(env.getProperty("auth.datasource.password"));

        return dataSource;
    }

    @Primary
    @Bean
    public PlatformTransactionManager authTransactionManager() {

        JpaTransactionManager transactionManager
                = new JpaTransactionManager();
        transactionManager.setEntityManagerFactory(
                authEntityManager().getObject());
        return transactionManager;
    }
    
  
    @Bean
    public LiquibaseProperties authLiquibaseProperties() {
    	LiquibaseProperties liquibaseProps = new LiquibaseProperties();
    	liquibaseProps.setChangeLog(env.getProperty("auth.datasource.liquibase.change-log"));
    	return liquibaseProps;
    }

    @Bean
    public SpringLiquibase authLiquibase() {
        return springLiquibase(authDatasource(), authLiquibaseProperties());
    }
    
    private static SpringLiquibase springLiquibase(DataSource dataSource, LiquibaseProperties properties) {
        SpringLiquibase liquibase = new SpringLiquibase();
        liquibase.setDataSource(dataSource);
        liquibase.setChangeLog(properties.getChangeLog());
        liquibase.setContexts(properties.getContexts());
        liquibase.setDefaultSchema(properties.getDefaultSchema());
        liquibase.setDropFirst(properties.isDropFirst());
        liquibase.setShouldRun(properties.isEnabled());
        liquibase.setLabels(properties.getLabels());
        liquibase.setChangeLogParameters(properties.getParameters());
        liquibase.setRollbackFile(properties.getRollbackFile());
        return liquibase;
    }

}
