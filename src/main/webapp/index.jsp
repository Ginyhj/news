<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<script src="statics/jquery-1.12.4.js"></script>
<script type="text/javascript">
    function toPage(pageIndex) {
        $("#pageIndex").val(pageIndex);
        $("form").submit();
    }
</script>

<form action="/page" method="post">
    <input type="hidden" name="pageIndex" id="pageIndex" value="1"/>
    电影名称：<input type="text" name="keyWord" value="${param.keyWord}" />
    <input type="submit" value="提交"/>
</form>
<table width="500px" border="1">
    <tr>
        <td>关键词</td>
        <td>搜索指数</td>
        <td>创建时间</td>

    </tr>
    <c:forEach items="${page.list}" var="p">
        <tr>
            <td><a href="toselect?id=${p.id}">${p.keyWord}</a></td>
            <td>${p.searchSum}</td>
            <td>${p.createDate}</td>
        </tr>
    </c:forEach>
</table>

<div>
    <c:if test="${page.pageIndex>1}">
        <a href="javascript:toPage(1)">首页</a>
        <a href="javascript:toPage(${page.pageIndex-1})">上一页</a>

    </c:if>
    <c:if test="${page.pageIndex<page.pageCount}">
        <a href="javascript:toPage(${page.pageIndex+1})">下一页</a>
        <a href="javascript:toPage(${page.pageCount})">末页</a>
    </c:if>
    第${page.pageIndex}页/第${page.pageCount}页
</div>
</body>
</html>
