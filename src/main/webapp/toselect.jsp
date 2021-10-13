<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>查看</title>
</head>
<body>

    <p><h1>${b.keyWord}</h1></p>
    <p>创建于：${b.createDate}</p>
    <p>${b.hotContent}</p>
    <p><h1>评论</h1></p>
    <c:forEach items="${b2}" var="p">
        <p>评论时间：${p.commentDate}</p>
        <p>${p.content}</p>
    </c:forEach>
    <form action="/add" method="post">
        <p>快速评论：</p>
        <p>
            <textarea name="content" rows="5" cols="30"></textarea>
            <input type="hidden" name="hotEventsId" value="${b.id}">
        </p>
        <input type="submit" value="提交">
        <a href="/page">返回首页</a>
    </form>
</body>
</html>
