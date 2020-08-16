package com.uprep.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LoginDAO {

    @Autowired
    public DBConnection dbConnection;

    public String saveUser(String userName, String password, String email) {
        String status ;

        try (Connection conn = dbConnection.getConnection()) {
            PreparedStatement preparedStatement = conn
                    .prepareStatement("insert into users(name, password, email) values(?,?,?)");
            preparedStatement.setString(1, userName);
            preparedStatement.setString(2, password);
            preparedStatement.setString(3, email);

            preparedStatement.execute();

            System.out.println("User Saved");
            status = "success";

        } catch (SQLException e) {
            status = e.getMessage().contains("Duplicate entry") ? "duplicate" : "fail";
            e.printStackTrace();
        }

        return status;

    }

    public String isUserValid(String email, String password) {
        String status = "invalid";
        ResultSet result = null;

        try (Connection conn = dbConnection.getConnection();
             PreparedStatement preparedStatement = conn
                     .prepareStatement("select count(*) from users where email=? and password=?")) {

            preparedStatement.setString(1, email);
            preparedStatement.setString(2, password);

            result = preparedStatement.executeQuery();

            if (result.next() && result.getInt(1) > 0) {
                status = "valid";
                System.out.println("User Authenticated Succesfully");
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

        return status;

    }

    public String getUserName(String email) {
        ResultSet result;
        String name = "";

        try (Connection conn = dbConnection.getConnection()) {
            PreparedStatement preparedStatement = conn.prepareStatement("select name from users where email=?");
            preparedStatement.setString(1, email);
            result = preparedStatement.executeQuery();

            if (result.next()) {
                name = result.getString("name");
            }

        } catch (SQLException e) {

            e.printStackTrace();
        }

        return name;

    }

}
