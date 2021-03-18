package com.example.erecruit.controller;

//IMPORTS
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LogoutController {

	//to get the logout page (actually returning to the home page)
	@GetMapping(value="/view/logout")
	public ModelAndView getLogoutPage() {
			
		ModelAndView mv=new ModelAndView();
		
		if (LoginController.getUser()==null) {
			mv=LoginController.getLoggedIn();

		}
		else {
			mv.setViewName("Logout");	
			}
		return mv;
	}
}
