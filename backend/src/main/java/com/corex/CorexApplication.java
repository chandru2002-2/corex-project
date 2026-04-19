package com.corex;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@EnableScheduling 
public class CorexApplication {

	public static void main(String[] args) {
		SpringApplication.run(CorexApplication.class, args);
	}

}
