package com.movebox.admin.model;

import com.movebox.movie.model.Movie;
import com.movebox.movieTime.model.MovieTime;
import com.movebox.theather.model.Theather;

public class Admin {
	private Movie movie;
	private Theather theather;
	private MovieTime movieTime;

	public Movie getMovie() {
		return movie;
	}

	public void setMovie(Movie movie) {
		this.movie = movie;
	}

	public Theather getTheather() {
		return theather;
	}

	public void setTheather(Theather theather) {
		this.theather = theather;
	}

	public MovieTime getMovieTime() {
		return movieTime;
	}

	public void setMovieTime(MovieTime movieTime) {
		this.movieTime = movieTime;
	}

}

