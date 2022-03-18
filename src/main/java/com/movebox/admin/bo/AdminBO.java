package com.movebox.admin.bo;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.movebox.movie.bo.MovieBO;
import com.movebox.movie.model.Movie;

@Service
public class AdminBO {
	
	@Autowired
	private MovieBO movieBO;
	
	private static final int MOVIE_POST_MAX_SIZE = 10;
	
	public Movie getMovieById(int id) {
		return movieBO.getMovieById(id);
	}
	
	public List<Movie> getMovieListByPrevIdAndNextId(Integer prevId, Integer nextId) {
		String direction = null;
		Integer standardId = null;
		
		if (nextId != null) {  // 1) 다음 클릭 
			direction = "next";
			standardId = nextId;
			
			return movieBO.getMovieListByPrevIdAndNextId(direction, standardId, MOVIE_POST_MAX_SIZE);
		} else if (prevId != null) {  // 2) 이전 클릭 
			direction = "prev";
			standardId = prevId;
			
			// reverse
			List<Movie> movieList = movieBO.getMovieListByPrevIdAndNextId(direction, standardId, MOVIE_POST_MAX_SIZE);
			Collections.reverse(movieList);
			
			return movieList;
		}
		
		// 첫 페이지
		return movieBO.getMovieListByPrevIdAndNextId(direction, standardId, MOVIE_POST_MAX_SIZE);
	}
}
