package com.blog;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class CreatePostServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Forward the request to the JSP page for creating a post
        request.getRequestDispatcher("/pages/createpost.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Handling the form submission (get form data)
        String title = request.getParameter("title");
        String content = request.getParameter("content");

        // Insert into the database
        try (Connection conn = DBUtil.getConnection()) {
            String sql = "INSERT INTO posts (title, content) VALUES (?, ?)";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, title);
                stmt.setString(2, content);
                stmt.executeUpdate();  // Execute the insert query
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Optionally, set an error attribute and forward to the form
            request.setAttribute("error", "Failed to save post to the database.");
            request.getRequestDispatcher("/pages/createpost.jsp").forward(request, response);
            return;
        }

        // After inserting, redirect back to the homepage
        response.sendRedirect("index.jsp");
    }
}
