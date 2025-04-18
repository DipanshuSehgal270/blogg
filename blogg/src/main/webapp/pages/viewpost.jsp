<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*, com.blog.DBUtil" %>
<%
    String postId = request.getParameter("id");
    String title = "", content = "";

    try (Connection conn = DBUtil.getConnection()) {
        PreparedStatement stmt = conn.prepareStatement("SELECT * FROM posts WHERE id = ?");
        stmt.setInt(1, Integer.parseInt(postId));
        ResultSet rs = stmt.executeQuery();
        if (rs.next()) {
            title = rs.getString("title");
            content = rs.getString("content");
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<html>
<head>
    <title>View Post</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="container">
        <h2 class="title"><%= title %></h2>
        <div class="post-content">
            <p><%= content %></p>
        </div>
        <a class="btn view" href="index.jsp">Back to Home</a>
    </div>
</body>
</html>
