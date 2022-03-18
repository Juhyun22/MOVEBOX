package com.movebox.theather;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.movebox.theather.bo.TheatherBO;
import com.movebox.theather.model.Theather;

@RestController
@RequestMapping("/theather")
public class TheatherRestController {
	
	@Autowired
	private TheatherBO theatherBO;

	/**
	 * for test
	 * @return
	 */
	@RequestMapping("/test")
	public List<Theather> theatherList() {
		return theatherBO.getTheatherList();
	}
	
	/**
	 * 극장 등록 기능
	 * @param name
	 * @param address
	 * @param number
	 * @param request
	 * @return
	 */
	@PostMapping("/post")
	public Map<String, Object> postTheather(
			@RequestParam("name") String name,
			@RequestParam("address") String address,
			@RequestParam("number") String number,
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
		
		// insert theather
		int row = theatherBO.insertTheather(name, address, number);
		
		if (row < 1) {
			result.put("result", "error");
			result.put("errorMessage", "극장이 등록되지 않았습니다. 다시 시도해 주세요.");
		}
		
		return result;
	}
	
	/**
	 * 극장 삭제 기능 
	 * @param movieId
	 * @param request
	 * @return
	 */
	@DeleteMapping("/delete")
	public Map<String, Object> deleteTheather(
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
		
		// delete theather
		int row = theatherBO.deleteTheaterById(movieId);
		
		if (row < 1) {
			result.put("result", "error");
			result.put("errormessage", "극장이 삭제되지 않았습니다. 다시 시도해 주세요.");
		}
		
		return result;
	}
}
