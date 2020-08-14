package com.uprep.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uprep.DAO.LoginDAO;
import com.uprep.DAO.TransactionDAO;
import com.uprep.resources.User;

@Service
public class TransactionService {
	
	@Autowired
	TransactionDAO transactionDAO;

	public String saveFriend(User user, String friendEmail) {
		boolean isemailRegistered = transactionDAO.isRegistered(friendEmail);
		user.setId(transactionDAO.getUserId(user.email));
		return isemailRegistered?transactionDAO.saveFriend(user, friendEmail, transactionDAO.getUserId(friendEmail)):"notregistered";
	}

}
