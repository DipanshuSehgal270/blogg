<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>View Posts</title>
</head>
<body>
    <h2>Blog Posts</h2>

    <c:if test="${not empty posts}">
        <ul>
            <c:forEach var="post" items="${posts}">
                <li>
                    <h3>${post.title}</h3>
                    <p>${post.content}</p>
                    <hr />
                </li>
            </c:forEach>
        </ul>
    </c:if>

    <c:if test="${empty posts}">
        <p>No posts available.</p>
    </c:if>

    <a href="index.jsp">Back to Home</a>
</body>
</html>
