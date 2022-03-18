package com.movebox.movieTime.model;

import java.sql.Time;
import java.util.Date;

public class MovieTime {
	private int id;
	private int movieId;
	private int theatherId;
	private int seats;
	private Time time;
	private Date createdAt;
	private Date updatedAt;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getMovieId() {
		return movieId;
	}

	public void setMovieId(int movieId) {
		this.movieId = movieId;
	}

	public int getTheatherId() {
		return theatherId;
	}

	public void setTheatherId(int theatherId) {
		this.theatherId = theatherId;
	}

	public int getSeats() {
		return seats;
	}

	public void setSeats(int seats) {
		this.seats = seats;
	}

	public Time getTime() {
		return time;
	}

	public void setTime(Time time) {
		this.time = time;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public Date getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}

}
