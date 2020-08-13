package com.uprep;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginService {

	@Autowired
	LoginDAO loginDAO;

	public String isUserValid(String email, String password) {
		return loginDAO.isUserValid(email, password);
	}

	public String validateSignUpDetails(String userName, String password, String confirmPassword, String email) {
		if (password.equals(confirmPassword)) {
			return loginDAO.saveUser(userName, password, email);
		} else {
			return "passwordfail";
		}
	}

	public String getUserName(String email) {
		return loginDAO.getUserName(email);
	}

}
