package com.movebox.movieTime.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.movebox.movieTime.model.MovieTime;

@Repository
public interface MovieTimeDAO {

	public List<MovieTime> selectMovieTimeByMovieIdAndTheatherId(
			@Param("movieId") int movieId, 
			@Param("theatherId") int theatherId);
}
