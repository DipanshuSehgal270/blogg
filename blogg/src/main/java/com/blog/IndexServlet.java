package com.blog;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class IndexServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Post> posts = new ArrayList<>();

        // Fetch posts from the database
        try (Connection conn = DBUtil.getConnection()) {
            String sql = "SELECT id, title, content FROM posts";
            try (Statement stmt = conn.createStatement(); ResultSet rs = stmt.executeQuery(sql)) {
                while (rs.next()) {
                    int id = rs.getInt("id");
                    String title = rs.getString("title");
                    String content = rs.getString("content");
                    posts.add(new Post(id, title, content));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // Set the posts as an attribute and forward to viewposts.jsp
        request.setAttribute("posts", posts);
        request.getRequestDispatcher("/pages/viewposts.jsp").forward(request, response);
    }
}
