package com.blog;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BlogPostDAO {

    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/blogdb";
    private static final String DB_USER = "root";       // change if needed
    private static final String DB_PASSWORD = "1234";   // change if needed

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // Load MySQL JDBC driver
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static void addPost(String title, String content) {
        String sql = "INSERT INTO posts (title, content) VALUES (?, ?)";
        try (Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASSWORD);
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, title);
            stmt.setString(2, content);
            stmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static List<BlogPost> getAllPosts() {
        List<BlogPost> posts = new ArrayList<>();
        String sql = "SELECT * FROM posts ORDER BY id DESC";

        try (Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASSWORD);
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                BlogPost post = new BlogPost();
                post.setId(rs.getInt("id"));
                post.setTitle(rs.getString("title"));
                post.setContent(rs.getString("content"));
                posts.add(post);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return posts;
    }

    public static BlogPost getPostById(int id) {
        String sql = "SELECT * FROM posts WHERE id = ?";
        BlogPost post = null;

        try (Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASSWORD);
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                post = new BlogPost();
                post.setId(rs.getInt("id"));
                post.setTitle(rs.getString("title"));
                post.setContent(rs.getString("content"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return post;
    }
}
