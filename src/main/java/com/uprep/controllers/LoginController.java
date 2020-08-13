package com.uprep.controllers;

import org.springframework.ui.Model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.Mapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.uprep.LoginService;

@Controller
public class LoginController {

	@Autowired
	LoginService loginService;

	@GetMapping("/")
	public String startApplication() {
		return "login";
	}

	/* @RequestMapping(path = "/login", method = RequestMethod.GET) */
	@GetMapping("/login")
	public String showLoginPage() {
		return "login";
	}

	@PostMapping("/login")
	public String handleLoginRequest(@RequestParam String email, @RequestParam String password, Model theModel) {

		// validate
		if (loginService.isUserValid(email, password).equalsIgnoreCase("valid")) {
			theModel.addAttribute("name", loginService.getUserName(email));
			return "welcome";
		} else {
			theModel.addAttribute("errorMessage", "Invalid Credentials");
			return "login";
		}

	}

	@GetMapping("/signUp")
	public String showSignUpPage() {
		return "signUp";
	}

	@PostMapping("/signUp")
	public String showSignUpRequest(@RequestParam String name, @RequestParam String password,
			@RequestParam String confirmPassword, @RequestParam String email, Model theModel) {

		String status = loginService.validateSignUpDetails(name, password, confirmPassword, email);

		if (status != null && status.equalsIgnoreCase("success")) {
			theModel.addAttribute("name", name);
			return "welcome";
		} else if (status != null && status.equalsIgnoreCase("passwordfail")) {
			theModel.addAttribute("errorMessage", "Password and Confirmed Password do not match.");
		} else if (status != null && status.equalsIgnoreCase("duplicate")) {
			theModel.addAttribute("errorMessage",
					"Please make sure the email " + email + " is not registered already.");
		} else {
			theModel.addAttribute("errorMessage", "Unable to sign up the user: " + name);
		}

		return "signUp";
	}

}
