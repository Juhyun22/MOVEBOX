package com.movebox.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.movebox.common.FileManagerService;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer{

	/*
	 * 웹의 이미지 주소와 실제 파일 경로를 Mapping해주는 설정 
	 */
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry
		.addResourceHandler("/images/**")  // http://localhost/images/image파일 이름/이미지이름
		.addResourceLocations("file:" + FileManagerService.FILE_UPLOAD_PATH);  // 실제 파일 저장 위치 // 확인 
	}
}