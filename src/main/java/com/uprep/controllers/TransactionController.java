package com.uprep.controllers;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.uprep.resources.User;
import com.uprep.service.TransactionService;

@Controller
public class TransactionController {

	@Autowired
	TransactionService transactionService;

	@Autowired
	User user;

	@GetMapping("/add-expense")
	public String showAddExpense(HttpServletRequest request) {
		/* System.out.println(request.getSession().getAttribute("email")); */
		return "expense";
	}

	@PostMapping("/add-expense")
	public String addExpense() {

		// add expense to the database

		// after adding expense to the database we need to redirect to the welcome page
		// so that we can show the updated dashboard.
		return "expense";
	}

	@GetMapping("/add-friend")
	public String addFriend() {
		return "addFriend";
	}

	@PostMapping("/add-friend")
	public String saveFriend(@RequestParam String friendEmail, HttpServletRequest request, Model theModel) {
		/* System.out.println("Here: " + user.getName()); */
		user.setEmail(request.getSession().getAttribute("email").toString());
		user.setName(request.getSession().getAttribute("name").toString());
		String status = transactionService.saveFriend(user, friendEmail);
		if (status != null && status.equalsIgnoreCase("saved")) {
			return "redirect:/welcome";
		} else {
			theModel.addAttribute("errorMessage", "Please make sure the email is registered.");
			return "/add-friend";
		}

	}

}
