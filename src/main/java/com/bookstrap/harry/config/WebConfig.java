package com.bookstrap.harry.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/epubs/**")
//		.addResourceLocations("file:C:/SpringBoot/workspace/BookStrap/src/main/webapp/epub/1010490076.epub")
		.addResourceLocations("file:C:/epub/1010490076.epub")
		.setCachePeriod(0);
	}

	
	
}
