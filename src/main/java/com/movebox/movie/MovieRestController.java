package com.movebox.movie;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
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
	 * 
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
			@RequestParam("runningTime") int runningTime,
			HttpServletRequest request) {

		Map<String, Object> result = new HashMap<>();
		result.put("result", "success");

		// 로그아웃 & 관리자인지 확인
		HttpSession session = request.getSession();
		Integer userId = (Integer) session.getAttribute("userId");

		if (userId == null) { // 로그인 안되어 있음
			result.put("result", "error");
			result.put("errorMessage", "로그인 후 사용가능합니다.");
			return result;
		} else if (userId != 1) { // 관리자가 아님
			result.put("result", "error");
			result.put("errorMessage", "관리자만 등록 가능합니다.");
			return result;
		}

		// insert DB
		int row = movieBO.insertMovie(title, director, information, openingDate, movieImgPath, runningTime);

		if (row < 1) {
			result.put("result", "error");
			result.put("errorMessage", "영화 저장이 되지 않았습니다.");
		}

		return result;
	}

	/**
	 * 영화 수정 기능
	 * @param movieId
	 * @param title
	 * @param director
	 * @param information
	 * @param openingDate
	 * @param movieImgPath
	 * @param runningTime
	 * @param request
	 * @return
	 */
	@PutMapping("/update")
	public Map<String, Object> updateMovie(
			@RequestParam("movieId") int movieId,
			@RequestParam("title") String title,
			@RequestParam("director") String director, 
			@RequestParam("information") String information,
			@RequestParam("openingDate") String openingDate, 
			@RequestParam("file") MultipartFile movieImgPath,
			@RequestParam("runningTime") int runningTime, 
			HttpServletRequest request) {
		
		Map<String, Object> result = new HashMap<>();
		result.put("result", "success");

		// 로그아웃 & 관리자인지 확인
		HttpSession session = request.getSession();
		Integer userId = (Integer) session.getAttribute("userId");

		if (userId == null) { // 로그인 안되어 있음
			result.put("result", "error");
			result.put("errorMessage", "로그인 후 사용가능합니다.");
			return result;
		} else if (userId != 1) { // 관리자가 아님
			result.put("result", "error");
			result.put("errorMessage", "관리자만 등록 가능합니다.");
			return result;
		}

		// update BO
		int row = movieBO.updateMovie(movieId, title, director, information, openingDate, movieImgPath, runningTime);
		
		if (row < 1) {
			result.put("result", "error");
			result.put("errorMessage", "영화 수정이 되지 않았습니다.");
		}
		
		return result;
	}
	
	/**
	 * 영화 삭제 기능 
	 * @param movieId
	 * @param request
	 * @return
	 */
	@DeleteMapping("/delete")
	public Map<String, Object> deleteMovie(
			@RequestParam("movieId") int movieId,
			HttpServletRequest request) {
		 
		Map<String, Object> result = new HashMap<>();
		result.put("result", "success");
		
		// 로그아웃 & 관리자인지 확인
		HttpSession session = request.getSession();
		Integer userId = (Integer) session.getAttribute("userId");
		
		if (userId == null) { // 로그인 안되어 있음
			result.put("result", "error");
			result.put("errorMessage", "로그인 후 사용가능합니다.");
			return result;
		} else if (userId != 1) { // 관리자가 아님
			result.put("result", "error");
			result.put("errorMessage", "관리자만 등록 가능합니다.");
			return result;
		}
		
		// delete BO
		int row = movieBO.deleteMovieById(movieId);
		
		if (row < 1) {
			result.put("result", "error");
			result.put("errorMessage", "삭제가 되지 않았습니다.");
		}
		
		return result;
	}
}
