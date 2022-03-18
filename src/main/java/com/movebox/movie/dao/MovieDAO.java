package com.movebox.movie.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.movebox.movie.model.Movie;

@Repository
public interface MovieDAO {

	public int insertMovie(
			@Param("title") String title, 
			@Param("director") String director, 
			@Param("information") String information, 
			@Param("openingDate") String openingDate,
			@Param("movieImgPath") String movieImgPath, 
			@Param("runningTime") int runningTime);
	
	public Movie selectMovieById(int id);
	
	public List<Movie> selectMovieListByPrevIdAndNextId(
			@Param("direction") String direction, 
			@Param("standardId") Integer standardId, 
			@Param("limit") int limit);
	
	public int updateMovieById(
			@Param("id") int id, 
			@Param("title") String title, 
			@Param("director") String director, 
			@Param("information") String information, 
			@Param("openingDate") String openingDate,
			@Param("movieImgPath") String movieImgPath, 
			@Param("runningTime") int runningTime);
	
	public int deleteMovieById(int id);
	
}
