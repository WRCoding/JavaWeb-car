<%--
  Created by IntelliJ IDEA.
  User: 林北
  Date: 2019/3/10
  Time: 16:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">
<html>
<head>
    <title>购书系统</title>
    <style>
        h1 {
            text-align: center;
            border-bottom: 1px solid black;
            line-height: 100px;
        }

        .content {
            width: 1000px;
            margin-left: auto;
            margin-right: auto;
            text-align: center;
        }

        input {
            margin: 15px;
        }

        .input-css {
            width: 250px;
            height: 35px;
        }

        .btn {
            width: 80px;
            height: 35px;
        }
        a{
            text-decoration: none;
        }
        a:link {color: black}
        a:visited {color: black}
        a:hover {color: red}
        a:active {color: red}
    </style>
</head>
<body>
<div class="content">
    <h1>购书系统</h1>
    <form id="registerForm" method="post" action="register">
        <strong>${message}</strong><br/>
        账户：<input type="text" name="userName" required class="userName input-css"/><br/>
        密码：<input type="password" name="userPassword" required class="userPassword input-css"/><br/>
        确认：<input type="password" required class="checkUserPassword input-css" placeholder=" 确认密码"/><br/>
        <input type="button" value="注 册" class="btn" onclick="registerFun()"><br/>
        <%--<a href="/">游客访问</a><br/>--%>
        <a href="login.jsp">去登录</a>
    </form>
</div>
<script>
    function registerFun() {
        var userName = document.getElementsByClassName("userName")[0].value;
        var userPassword = document.getElementsByClassName("userPassword")[0].value;
        var checkUserPassword = document.getElementsByClassName("checkUserPassword")[0].value;
        //是否输入且输入是否为空
        if (userName != null && userName.length != 0 && userPassword != null && userPassword.length != 0) {
            if (userPassword != checkUserPassword) {
                alert("两次输入的密码不同请重新输入");
            } else {
                var form = document.getElementById("registerForm");
                form.submit();
            }
        } else {
            alert("用户名或密码不能为空");
        }
    }
</script>
</body>
</html>

