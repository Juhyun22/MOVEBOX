package com.movebox.theather.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.movebox.theather.model.Theather;

@Repository
public interface TheatherDAO {

	public List<Theather> selectTheatherList();
}
