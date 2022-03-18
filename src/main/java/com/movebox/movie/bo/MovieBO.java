package com.movebox.movie.bo;

import java.io.IOException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.movebox.common.FileManagerService;
import com.movebox.movie.dao.MovieDAO;
import com.movebox.movie.model.Movie;

@Service
public class MovieBO {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private MovieDAO movieDAO;
	
	@Autowired
	private FileManagerService fileManager;

	public int insertMovie(String title, String director, String information, String openingDate,
			MultipartFile movieImgPath, int runningTime) {
		String imagePath = null;

		if (movieImgPath != null) { // 파일에 값이 있다면,
			// file manager service , input: MultipartFile, output: file path
			imagePath = fileManager.saveFile("movie_" + openingDate, movieImgPath);
		}
		
		// insert DAO
		return movieDAO.insertMovie(title, director, information, openingDate, imagePath, runningTime);
	}
	
	public Movie getMovieById(int id) {
		return movieDAO.selectMovieById(id);
	}
	
	public List<Movie> getMovieListByPrevIdAndNextId(String direction, Integer standardId, int limit) {
		return movieDAO.selectMovieListByPrevIdAndNextId(direction, standardId, limit);
	}
	
	public int updateMovie(int id, String title, String director, String information, String openingDate,
			MultipartFile movieImgPath, int runningTime) {
		
		// movieId에 해당하는 영화가 있는지 확인 
		Movie movie = getMovieById(id);
		if (movie == null) {  // 해당 영화가 존재하지 않음 
			logger.error("[update movie] 수정할 영화가 존재하지 않습니다.");
			return 0; // 없음을 리턴
		}
		
		// 파일 저장, 삭제 
		String imagePath = null;
		if (movieImgPath != null) {
			imagePath = fileManager.saveFile("movie_" + openingDate, movieImgPath);  // 파일 업로드 후 url path를 얻어낸다. 
			
			// 새로 업로드된 이미지가 성공하면 기존 이미지 삭제 (기존 이미지가 있을 때만)
			if (movie.getMovieImgPath() != null && imagePath != null) {
				// 기존 이미지 삭제 
				try {
					fileManager.deleteFile(movie.getMovieImgPath());
				} catch (IOException e) {
					logger.error("[delete file] 영화 파일 이미지 삭제에 실패했습니다. {}", movie.getId());
				}
			}
		}
		
		// db에서 update
		return movieDAO.updateMovieById(id, title, director, information, openingDate, imagePath, runningTime);
	}
}
