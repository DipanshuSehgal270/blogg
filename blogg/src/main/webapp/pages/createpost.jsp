<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Create New Post</title>
</head>
<body>
    <h2>Create a New Blog Post</h2>

    <form action="create" method="post">
        <div>
            <label for="title">Title:</label>
            <input type="text" name="title" required />
        </div>
        <div>
            <label for="content">Content:</label>
            <textarea name="content" rows="5" required></textarea>
        </div>
        <div>
            <button type="submit">Submit Post</button>
        </div>
    </form>

    <br/>
    <a href="index.jsp">Back to Home</a>
</body>
</html>
