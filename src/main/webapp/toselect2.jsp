<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>查看</title>
</head>
<body>
    <p><h1 id="h1"></h1></p>
    <p id="p1"></p>
    <p id="p2"></p>
    <p><h1>评论</h1></p>
        <div id="div">
        </div>
        <p>快速评论：</p>
        <p>
            <textarea name="content" rows="5" cols="30" id="content"></textarea>
            <input type="hidden" name="hotEventsId" id="hotEventsId"  value="${requestScope.id}">
        </p>
        <input type="button" value="提交" id="btn" >
        <a href="/index2.jsp">返回首页</a>
</body>
</html>
<script src="statics/jquery-1.12.4.js"></script>
<script type="text/javascript">

    $(function () {
        show();
        show2();
        $("#btn").click(function () {
            add();
        })
    })


    function show() {
        var id=$("#hotEventsId").val();
        $.ajax({
            url:"/sel",
            data:{"id":id},
            dateType:"json",
            success:function (result) {
                $("#h1").html(result.keyWord);
                $("#p1").html("创建于："+result.createDate);
                $("#p2").html(result.hotContent);
            }
        })
    }


    function show2() {
        var id=$("#hotEventsId").val();
        $.ajax({
            url:"/sel2",
            data:{"id":id},
            dateType:"json",
            success:function (result) {

               var div="";
               for (var i=0;i < result.length;i++){
                   div+="<p>"+"评论时间:"+result[i].commentDate+"<br/>"+result[i].content+"</p>";
            }
               $("#div").html(div);
            }
        })
    }

    function add() {
        var content=$("#content").val();
        var hotEventsId=$("#hotEventsId").val();
        $.ajax({
            url:"/add2",
            data:{"content":content,"hotEventsId":hotEventsId},
            dateType:"json",
            success:function (result) {
                if (result =="ok"){
                    show2();
                    var content=$("#content").val("");
                }
            }
        })
    }
</script>
