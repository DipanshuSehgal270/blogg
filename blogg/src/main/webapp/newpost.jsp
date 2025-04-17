<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <title>New Blog Post</title>
</head>
<body>
    <h1>Create a New Post</h1>
    <form action="create" method="post">
        <label>Title:</label><br/>
        <input type="text" name="title" required/><br/><br/>

        <label>Content:</label><br/>
        <textarea name="content" rows="10" cols="40" required></textarea><br/><br/>

        <input type="submit" value="Publish"/>
    </form>
    <br/>
    <a href="index.jsp">← Back to Home</a>
</body>
</html>
