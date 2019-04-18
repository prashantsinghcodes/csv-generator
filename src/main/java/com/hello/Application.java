package com.hello;

import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.task.configuration.EnableTask;
import com.hello.UserService;
import com.hello.TimeStampConfigurer;
import org.springframework.context.annotation.Bean;
import java.util.logging.Logger;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@SpringBootApplication
@EnableTask
public class Application {

	@Autowired
	private DataSource datasource;

	private static final Logger LOGGER = Logger.getLogger(Application.class.getName());

	@Bean
	public HelloWorldApplicationRunner helloWorldApplicationRunner() {
		return new HelloWorldApplicationRunner();
	}

	@Bean
	public TimeStampConfigurer timeStampTask() {
		return new TimeStampConfigurer(datasource);
	}

	@Bean
	public CsvWritten getCsvWrite() {
		return new CsvWritten();
	}

	@Component
	public static class CsvWritten implements CommandLineRunner {
		@Autowired
		private UserService userService;

		@Override
		public void run(String... strings) throws Exception {
			userService.csvWrite();
		}
	}

	@Component
	public static class HelloWorldApplicationRunner implements CommandLineRunner {

		@Override
		public void run(String... strings) throws Exception {
			System.out.println("Hello World!");
		}

	}

	public static void main(String[] args) {
		SpringApplication.run(Application.class, args);
	}
}
