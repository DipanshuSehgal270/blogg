package com.blog;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class CreatePostServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Forward the request to the JSP page for creating a post
        request.getRequestDispatcher("/pages/createpost.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Handling the form submission (you can process the post data here)
        String title = request.getParameter("title");
        String content = request.getParameter("content");

        // Example: Store post data in a database or process it (you can expand this)
        // For now, we just print it for simplicity
        System.out.println("Title: " + title);
        System.out.println("Content: " + content);

        // After processing, redirect back to the homepage or to a success page
        response.sendRedirect("index.jsp");
    }
}
