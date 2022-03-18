package com.movebox.admin.bo;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.movebox.admin.model.Admin;
import com.movebox.movie.bo.MovieBO;
import com.movebox.movie.model.Movie;
import com.movebox.movieTime.bo.MovieTimeBO;
import com.movebox.movieTime.model.MovieTime;
import com.movebox.theather.bo.TheatherBO;
import com.movebox.theather.model.Theather;

@Service
public class AdminBO {
	
	@Autowired
	private MovieBO movieBO;
	
	@Autowired
	private TheatherBO theatherBO;
	
	@Autowired
	private MovieTimeBO movieTimeBO;
	
	private static final int MOVIE_POST_MAX_SIZE = 10;
	
	// 영화 by id 
	public Movie getMovieById(int id) {
		return movieBO.getMovieById(id);
	}
	
	// 영화 리스트 by prevId, nextId
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
	
	// 극장 리스트  
	public List<Theather> getTheatherList() {
		return theatherBO.getTheatherList();
	}
	
	// 영화, 극장에 따른 영화 시간 
	public List<MovieTime> getMovieTimeByMovieIdAndTheatherId(int movieId, int theatherId) {
		return movieTimeBO.getMovieTimeByMovieIdAndTheatherId(movieId, theatherId);
	}
	
	// 극장 리스트 + 영화 + 영화 시간 
	public List<Admin> generateTheatherListAndMovieAndMovieTime(int movieId, int theatherId) {
		List<Admin> resultList = new ArrayList<>();
		List<MovieTime> movieTimeList = getMovieTimeByMovieIdAndTheatherId(movieId, theatherId);
		
		for (MovieTime movieTime : movieTimeList) {
			Admin admin = new Admin();
			
			// 영화 시간 
			admin.setMovieTime(movieTime);
			
			// add
			resultList.add(admin);
		}
		
		return resultList;
	}
}
