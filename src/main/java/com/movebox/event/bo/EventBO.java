package com.movebox.event.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.movebox.event.dao.EventDAO;
import com.movebox.event.model.Event;

@Service
public class EventBO {
	
	@Autowired
	private EventDAO eventDAO;

	public List<Event> getEventList() {
		return eventDAO.selectEventList();
	}
}
