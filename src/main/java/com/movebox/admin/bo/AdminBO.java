package com.movebox.admin.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.movebox.movie.bo.MovieBO;
import com.movebox.movie.model.Movie;

@Service
public class AdminBO {
	
	@Autowired
	private MovieBO movieBO;
	
	public List<Movie> getMovieList() {
		return movieBO.getMovie();
	}
}
