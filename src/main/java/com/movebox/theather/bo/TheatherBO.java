package com.movebox.theather.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.movebox.theather.dao.TheatherDAO;
import com.movebox.theather.model.Theather;

@Service
public class TheatherBO {
	
	@Autowired
	private TheatherDAO theatherDAO;
	
	public int insertTheather(String name, String address, String number) {
		return theatherDAO.insertTheather(name, address, number);
	}

	public List<Theather> getTheatherList() {
		return theatherDAO.selectTheatherList();
	}
	
	public int deleteTheaterById(int id) {
		return theatherDAO.deleteTheaterById(id);
	}
	
}
