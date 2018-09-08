package com.fixy.service.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowire;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.lookup.JndiDataSourceLookup;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.config.JtaTransactionManagerFactoryBean;

@Configuration
@EnableTransactionManagement
@PropertySource("classpath:db.properties")

public class PersistenceConfig {
	@Autowired
	private Environment env;

	@Bean
	public DataSource dataSource() {
		JndiDataSourceLookup jndiDataSourceLookup = null;
		DataSource dataSource = null;
		jndiDataSourceLookup = new JndiDataSourceLookup();
		dataSource = jndiDataSourceLookup.getDataSource(env.getProperty("fixyDataSourceName"));
		System.out.println("datasource :" + dataSource);
		return dataSource;
	}

	@Bean
	public JtaTransactionManagerFactoryBean jtaTransaction() {
		return new JtaTransactionManagerFactoryBean();
	}

	@Bean(autowire = Autowire.BY_TYPE)
	public JdbcTemplate jdbcTemplate() {
		JdbcTemplate jdbcTemplate = null;
		jdbcTemplate = new JdbcTemplate();
		return jdbcTemplate;
	}
}
