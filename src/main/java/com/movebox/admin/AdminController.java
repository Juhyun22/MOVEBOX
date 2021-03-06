package com.movebox.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.movebox.admin.bo.AdminBO;
import com.movebox.event.model.Event;
import com.movebox.movie.model.Movie;
import com.movebox.theather.model.Theather;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private AdminBO adminBO;

	/**
	 * 영화관리 view
	 * @param model
	 * @return
	 */
	@RequestMapping("/movie_manage_view") 
	public String movieManageView(
			@RequestParam(value="prevId", required=false) Integer prevIdParam,
			@RequestParam(value="nextId", required=false) Integer nextIdParam,
			Model model) {
		
		List<Movie> movieList = adminBO.getMovieListByPrevIdAndNextId(prevIdParam, nextIdParam);
		
		int prevId = 0;
		int nextId = 0;
		if (CollectionUtils.isEmpty(movieList) == false) {  // movieList가 없는 경우, error 방지 
			prevId = movieList.get(0).getId();  // 리스트 중 가장 앞쪽(제일 큰값) id 
			nextId = movieList.get(movieList.size() - 1).getId();  // 리스트 중 가장 뒤쪽(제일 작은값) id 
		}
		
		// model add
		model.addAttribute("movieList", movieList);
		model.addAttribute("prevId", prevId);
		model.addAttribute("nextId", nextId);
		model.addAttribute("viewName", "admin/movie_list");
		return "template/admin_layout";
	}
	
	/**
	 * 영화 등록 view 
	 * @param model
	 * @return
	 */
	@RequestMapping("/movie_post_view")
	public String moviePostView(Model model) {
		model.addAttribute("viewName", "admin/movie_post");
		return "template/admin_layout";
	}
	
	/**
	 * 영화 수정, 삭제 view 
	 * @param model
	 * @return
	 */
	@RequestMapping("/movie_detail_view") 
	public String movieDetailView(
			@RequestParam("movieId") int movieId,
			Model model) {
		
		// get movieList by Id
		Movie movie = adminBO.getMovieById(movieId);
		
		model.addAttribute("viewName", "admin/movie_detail");
		model.addAttribute("movie", movie);
		return "template/admin_layout";
	}
	
	/**
	 * 극장 관리 view
	 * @param model
	 * @return
	 */
	@RequestMapping("/theather_manage_view")
	public String theatherManageView(
			Model model) {
		
		// get theatherList
		List<Theather> theatherList = adminBO.getTheatherList();
		
//		// get 
//		List<Admin> admin = adminBO.generateTheatherListAndMovieAndMovieTime(movieId, theatherId);
		
		model.addAttribute("viewName", "admin/theather_list");
		model.addAttribute("theatherList", theatherList);
		return "template/admin_layout";
	}
	
	/**
	 * 극장 추가 view 
	 * @param model
	 * @return
	 */
	@RequestMapping("/theather_post_view")
	public String theatherPostView(Model model) {
		model.addAttribute("viewName", "admin/theather_post");
		return "template/admin_layout";
	}
	
	/**
	 * 이벤트 관리 view 
	 * @param model
	 * @return
	 */
	@RequestMapping("/event_manage_view")
	public String eventManageView(Model model) {
		
		List<Event> eventList = adminBO.getEventList();
		
		model.addAttribute("viewName", "admin/event_list");
		model.addAttribute("eventList", eventList);
		return "template/admin_layout";
	}
	
	/**
	 * 이벤트 추가 view 
	 * @param model
	 * @return
	 */
	@RequestMapping("/event_post_view")
	public String eventPostView(Model model) {
		model.addAttribute("viewName", "admin/event_post");
		return "template/admin_layout";
	}
}
