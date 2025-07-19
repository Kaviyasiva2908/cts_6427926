package com.cognizant.spring_learn;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

@SpringBootApplication
public class SpringLearnApplication1 {

    private static final Logger LOGGER = LoggerFactory.getLogger(SpringLearnApplication1.class);

    public static void main(String[] args) {
        SpringApplication.run(SpringLearnApplication1.class, args);
        displayCountry();
    }

    public static void displayCountry() {
        LOGGER.debug("START displayCountry()");
        ApplicationContext context = new ClassPathXmlApplicationContext("country.xml");
        Country country = (Country) context.getBean("country", Country.class);
        LOGGER.debug("Country : {}", country.toString());
        LOGGER.debug("END displayCountry()");
    }
}
