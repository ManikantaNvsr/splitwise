package com.uprep;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginService {

	@Autowired
	LoginDAO loginDAO;

	public boolean isUserValid(String userName, String password) {
		if (userName.equalsIgnoreCase("bul") && password.equalsIgnoreCase("dummy")) {
			return true;
		}
		return false;
	}

	public boolean validateSignUpDetails(String userName, String password, String confirmPassword) {
		if (password.equals(confirmPassword)) {
			loginDAO.saveUser(userName, password, confirmPassword);
			return true;
		}
		return false;
	}

}
