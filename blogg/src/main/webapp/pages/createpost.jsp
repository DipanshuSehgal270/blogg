<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Create Post</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="container">
        <h2 class="title">Create New Post</h2>
        <form action="create" method="post">
            <div class="form-group">
                <label for="title">Title:</label><br/>
                <input type="text" name="title" required class="input-box"/>
            </div>
            <div class="form-group">
                <label for="content">Content:</label><br/>
                <textarea name="content" rows="5" required class="textarea-box"></textarea>
            </div>
            <button type="submit" class="btn create-btn">Submit Post</button>
        </form>
        <br/>
        <a class="btn view" href="index.jsp">Back to Home</a>
    </div>
</body>
</html>
