package com.movebox.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.movebox.admin.bo.AdminBO;
import com.movebox.movie.model.Movie;

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
	public String movieManage(Model model) {
		
		List<Movie> movieList = adminBO.getMovieList();
		
		model.addAttribute("movieList", movieList);
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
}
