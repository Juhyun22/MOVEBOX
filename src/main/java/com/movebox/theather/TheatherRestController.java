package com.movebox.theather;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.movebox.theather.bo.TheatherBO;
import com.movebox.theather.model.Theather;

@RestController
@RequestMapping("/theather")
public class TheatherRestController {
	
	@Autowired
	private TheatherBO theatherBO;

	@RequestMapping("/test")
	public List<Theather> theatherList() {
		return theatherBO.getTheatherList();
	}
}
