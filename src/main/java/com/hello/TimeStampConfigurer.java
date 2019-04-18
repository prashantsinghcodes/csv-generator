package com.hello;

import javax.sql.DataSource;

import org.springframework.cloud.task.configuration.DefaultTaskConfigurer;

public class TimeStampConfigurer extends DefaultTaskConfigurer{
	public TimeStampConfigurer(DataSource dataSource) {
		super(dataSource);
	}
}
