<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<script src="statics/jquery-1.12.4.js"></script>
<script type="text/javascript">
    $(function () {
        show(1);

        $("#btn").click(function () {
            show(1)
        });
    })

    //分页的方法
    function show(pageIndex) {
        var keyWord=$("#keyWord").val();
        $.ajax({
            url:"index2",
            data:{"pageIndex":pageIndex,"keyWord":keyWord},
            dateType:"json",
            success:function (result) {
                var tbody="";
                var list=result.list;
                for(var i = 0; i < list.length; i++){
                    tbody+= "<tr><td><a href='/tosel?id="+list[i].id+"'>"+list[i].keyWord+"</a></td>" +
                        "<td>"+list[i].searchSum+"</td><td>"+list[i].createDate+"</td></tr>";
                }
                $("#tbody").html(tbody);

                var div="";
                if(result.pageIndex>1){
                    div+="<a href='javascript:show(1)'>首页</a>";
                    div+="<a href='javascript:show("+(result.pageIndex-1)+")'>上一页</a>";
                }
                if (result.pageIndex<result.pageCount){
                    div+="<a href='javascript:show("+(result.pageIndex+1)+")'>下一页</a>";
                    div+="<a href='javascript:show("+(result.pageCount)+")'>尾页</a>";
                }
                div+="第"+result.pageIndex+"/共"+result.pageCount+"页";
                $("#div").html(div);
                $("table tbody tr:even").css("background","green");
                $("table tbody tr:odd").css("background","red");
                $("table tr:first").css("background","yellow");
            }
        })
    }
</script>
    电影名称：<input type="text" name="keyWord" id="keyWord" value="${param.keyWord}" />
    <input type="button" value="提交" id="btn"/>

<table width="500px" border="1">
    <tr>
        <td>关键词</td>
        <td>搜索指数</td>
        <td>创建时间</td>
    </tr>
    <tbody id="tbody">
    </tbody>
</table>
<div id="div">

</div>

<%--<div>--%>
    <%--<c:if test="${page.pageIndex>1}">--%>
        <%--<a href="javascript:toPage(1)">首页</a>--%>
        <%--<a href="javascript:toPage(${page.pageIndex-1})">上一页</a>--%>

    <%--</c:if>--%>
    <%--<c:if test="${page.pageIndex<page.pageCount}">--%>
        <%--<a href="javascript:toPage(${page.pageIndex+1})">下一页</a>--%>
        <%--<a href="javascript:toPage(${page.pageCount})">末页</a>--%>
    <%--</c:if>--%>
    <%--第${page.pageIndex}页/第${page.pageCount}页--%>
<%--</div>--%>

</body>
</html>
<scrtip>

</scrtip>
