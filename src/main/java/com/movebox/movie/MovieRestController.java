package com.movebox.movie;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.movebox.movie.bo.MovieBO;

@RestController
@RequestMapping("/movie")
public class MovieRestController {
	
	@Autowired
	private MovieBO movieBO;

	/**
	 * 영화 저장 기능
	 * @param title
	 * @param director
	 * @param information
	 * @param openingDate
	 * @param movieImgPath
	 * @param runningTime
	 * @return
	 */
	@PostMapping("/post")
	public Map<String, Object> postMovie(
			@RequestParam("title") String title,
			@RequestParam("director") String director,
			@RequestParam("information") String information,
			@RequestParam("openingDate") String openingDate,
			@RequestParam("file") MultipartFile movieImgPath,
			@RequestParam("runningTime") int runningTime) {
		
		// insert DB
		int row = movieBO.insertMovie(title, director, information, openingDate, movieImgPath, runningTime);
		
		Map<String, Object> result = new HashMap<>();
		result.put("result", "success");
		
		if (row < 1) {
			result.put("result", "error");
			result.put("errorMessage", "영화 저장이 되지 않았습니다.");
		}
		
		return result;
	}
}
