<%@ page import="com.blog.BlogPost" %>
<%@ page import="com.blog.BlogPostDAO" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <title>View Post</title>
</head>
<body>
    <%
        int postId = Integer.parseInt(request.getParameter("id"));
        BlogPost post = BlogPostDAO.getPostById(postId);
        if (post != null) {
    %>
        <h1><%= post.getTitle() %></h1>
        <p><%= post.getContent() %></p>
        <br/>
        <a href="index.jsp">← Back to Home</a>
    <%
        } else {
    %>
        <p>Post not found!</p>
        <a href="index.jsp">← Back to Home</a>
    <%
        }
    %>
</body>
</html>
