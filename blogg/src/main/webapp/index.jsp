<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*, java.sql.*" %>
<%
    Connection conn = com.blog.DBUtil.getConnection();
    List<Map<String, String>> posts = new ArrayList<>();
    try {
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM posts ORDER BY id DESC");
        while (rs.next()) {
            Map<String, String> post = new HashMap<>();
            post.put("id", rs.getString("id"));
            post.put("title", rs.getString("title"));
            posts.add(post);
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<html>
<head><title>Home - Blog</title></head>
<body>
    <h2>All Posts</h2>
    <a href="create">Create New Post</a>
    <hr/>
    <%
        for (Map<String, String> post : posts) {
    %>
        <h3><%= post.get("title") %></h3>
        <a href="view?id=<%= post.get("id") %>">View</a> |
        <a href="edit?id=<%= post.get("id") %>">Edit</a> |
        <a href="delete?id=<%= post.get("id") %>">Delete</a>
        <hr/>
    <%
        }
    %>
</body>
</html>
