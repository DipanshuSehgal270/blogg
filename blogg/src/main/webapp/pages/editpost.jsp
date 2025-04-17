<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head><title>Edit Post</title></head>
<body>
    <h2>Edit Post</h2>
    <form action="edit" method="POST">
        <input type="hidden" name="id" value="${post.id}" />
        <label for="title">Title:</label>
        <input type="text" name="title" value="${post.title}" required />
        <br/>
        <label for="content">Content:</label>
        <textarea name="content" required>${post.content}</textarea>
        <br/>
        <button type="submit">Update</button>
    </form>
    <a href="home">Back to Home</a>
</body>
</html>
