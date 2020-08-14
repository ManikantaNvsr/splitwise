package com.uprep.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

import com.uprep.DAO.LoginDAO;
import com.uprep.resources.User;

@Service
public class LoginService {

	@Autowired
	LoginDAO loginDAO;

	public String isUserValid(String email, String password) {
		return loginDAO.isUserValid(email, password);
	}

	public String validateSignUpDetails(String userName, String password, String confirmPassword, String email) {
		if (!password.equals(confirmPassword)) {
			return "passwordfail";
		} else {
			return loginDAO.saveUser(userName, password, email);
		}
	}

	public String getUserName(String email) {
		return loginDAO.getUserName(email);
	}

}
