package com.movebox.movieTime.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.movebox.movieTime.dao.MovieTimeDAO;
import com.movebox.movieTime.model.MovieTime;

@Service
public class MovieTimeBO {
	
	@Autowired
	private MovieTimeDAO movieTimeDAO;

	public List<MovieTime> getMovieTimeByMovieIdAndTheatherId(int movieId, int theatherId) {
		return movieTimeDAO.selectMovieTimeByMovieIdAndTheatherId(movieId, theatherId);
	}
}
