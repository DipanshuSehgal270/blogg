<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Create New Post</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<div class="container">
    <h2>Create a New Post</h2>
    <form action="create" method="post">
        <label for="title">Title:</label>
        <input type="text" name="title" required />

        <label for="content">Content:</label>
        <textarea name="content" rows="5" required></textarea>

        <button type="submit">Submit Post</button>
    </form>
</div>
</body>
</html>
