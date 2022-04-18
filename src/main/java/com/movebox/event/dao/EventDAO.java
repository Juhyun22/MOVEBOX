package com.movebox.event.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.movebox.event.model.Event;

@Repository
public interface EventDAO {
	
	public List<Event> selectEventList();
}
