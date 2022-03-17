package com.movebox.movie.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.movebox.common.FileManagerService;
import com.movebox.movie.dao.MovieDAO;
import com.movebox.movie.model.Movie;

@Service
public class MovieBO {
	
	@Autowired
	private MovieDAO movieDAO;
	
	@Autowired
	private FileManagerService fileManager;

	public int insertMovie(String title, String director, String information, String openingDate,
			MultipartFile movieImgPath, int runningTime) {
		String imagePath = null;

		if (movieImgPath != null) { // 파일에 값이 있다면,
			// file manager service , input: MultipartFile, output: file path
			imagePath = fileManager.saveFile("movie_" + title, movieImgPath);
		}
		
		// insert DAO
		return movieDAO.insertMovie(title, director, information, openingDate, imagePath, runningTime);
	}
	
	public List<Movie> getMovie() {
		return movieDAO.selectMovie();
	}
}
