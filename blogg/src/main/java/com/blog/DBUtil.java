package com.blog;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtil {

    public static Connection getConnection() throws SQLException {
        // Update the URL with your database name (blogdb)
        String url = "jdbc:mysql://localhost:3306/blogdb";  // Updated to blogdb
        String username = "root";  // Replace with your MySQL username
        String password = "1234";  // Replace with your MySQL password

        try {
            return DriverManager.getConnection(url, username, password);
        } catch (SQLException e) {
            throw new SQLException("Error while connecting to database", e);
        }
    }
}
