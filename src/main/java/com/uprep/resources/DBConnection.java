package com.uprep.resources;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import org.springframework.stereotype.Component;

@Component
public class DBConnection {

    public Connection getConnection() {
        Connection conn = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/splitwise", "splitwiseuser",
                    "splitwiseuser");
        } catch (Exception e) {
            e.printStackTrace();
        }

        return conn;

    }

}
