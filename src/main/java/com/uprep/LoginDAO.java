package com.uprep;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LoginDAO {

	@Autowired
	public DBConnection dbConnection;

	public void saveUser(String userName, String password, String confirmPassword) {
		Connection conn = dbConnection.getConnection();

		try {
			PreparedStatement preparedStatement = conn.prepareStatement("insert into users(name, email) values(?,?)");
			preparedStatement.setString(1, userName);
			preparedStatement.setString(2, userName);

			preparedStatement.execute();

			System.out.println("Inserted");

		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

}
