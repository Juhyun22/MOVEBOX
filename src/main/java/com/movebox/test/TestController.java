package com.movebox.test;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class TestController {
	
	@ResponseBody
	@RequestMapping("/test")
	public String hello() {
		return "Hello World!!";
	}
	
	@RequestMapping("/testing")
	public String jsptest() {
		return "test/test";
	}
}
