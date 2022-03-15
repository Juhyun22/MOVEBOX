package com.movebox;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MoveboxController {

	@RequestMapping("/movebox")
	public String moveboxView(Model model) {
		model.addAttribute("viewName", "movebox/movebox");
		return "template/layout";
	}
}
