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
<head>
    <title>Home - Blog</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="container">
        <h2 class="title">All Posts</h2>
        <a class="btn create-btn" href="create">+ Create New Post</a>
        <hr/>

        <% for (Map<String, String> post : posts) { %>
            <div class="post-card">
                <h3><%= post.get("title") %></h3>
                <div class="actions">
                    <a class="btn view" href="view?id=<%= post.get("id") %>">View</a>
                    <a class="btn edit" href="edit?id=<%= post.get("id") %>">Edit</a>
                    <a class="btn delete" href="delete?id=<%= post.get("id") %>">Delete</a>
                </div>
            </div>
        <% } %>
    </div>
</body>
</html>
