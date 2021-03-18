package com.example.erecruit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {

	@GetMapping(value="/view/home")
	public String getHomePage() {
		return "home";
	}
	
	@GetMapping(value="/view/aboutUs")
	public String getAboutUsPage() {
		
		//System.out.println("we are inside the about us controller");
		return "aboutUs";
	}
}
