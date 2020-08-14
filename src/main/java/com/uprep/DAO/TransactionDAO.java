package com.uprep.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.uprep.resources.DBConnection;
import com.uprep.resources.User;

@Repository
public class TransactionDAO {

	@Autowired
	public DBConnection dbConnection;

	public String saveFriend(User user, String friendEmail, int friendUserId) {
		String status = "notsaved";

		try (Connection conn = dbConnection.getConnection()) {
			PreparedStatement preparedStatement = conn.prepareStatement("insert into friends values(?,?,?,?)");
			preparedStatement.setInt(1, user.id);
			preparedStatement.setString(2, user.email);
			preparedStatement.setInt(3, friendUserId);
			preparedStatement.setString(4, friendEmail);
			preparedStatement.execute();

			System.out.println("Relation Inserted");

			status = "saved";

		} catch (SQLException e) {

			e.printStackTrace();
		}

		return status;

	}

	public boolean isRegistered(String friendEmail) {
		boolean isRegistered = false;

		ResultSet result = null;

		try (Connection conn = dbConnection.getConnection();
				PreparedStatement preparedStatement = conn
						.prepareStatement("select count(*) from users where email=?")) {

			preparedStatement.setString(1, friendEmail);

			result = preparedStatement.executeQuery();

			if (result.next() && result.getInt(1) > 0) {
				isRegistered = true;
				System.out.println("User is already Registered");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (result != null) {
				try {
					result.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}

		return isRegistered;

	}

	public int getUserId(String email) {

		ResultSet result = null;

		try (Connection conn = dbConnection.getConnection();
				PreparedStatement preparedStatement = conn.prepareStatement("select id from users where email=?")) {

			preparedStatement.setString(1, email);

			result = preparedStatement.executeQuery();

			if (result.next()) {
				return result.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (result != null) {
				try {
					result.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}

		return 0;

	}

}
