package com.movebox.theather.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.movebox.theather.model.Theather;

@Repository
public interface TheatherDAO {
	
	public int insertTheather(
			@Param("name") String name, 
			@Param("address") String address, 
			@Param("number") String number);

	public List<Theather> selectTheatherList();
	
	public int deleteTheaterById(int id);
}
