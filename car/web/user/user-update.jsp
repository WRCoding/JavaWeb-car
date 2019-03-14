<%--
  Created by IntelliJ IDEA.
  User: 林北
  Date: 2019/3/10
  Time: 16:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>购书系统 - 购书</title>
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

        table {
            border: 1px solid black;
            margin-left: auto;
            margin-right: auto;
            width: 600px;
            text-align: center;
            width: 100%;
        }

        .content {
            width: 1000px;
            margin-left: auto;
            margin-right: auto;
        }

        .content-left {
            width: 28%;
            border: 1px solid black;
            float: left;
            min-height: 400px;
        }

        .content-right {
            width: 68%;
            border: 1px solid black;
            float: right;
            min-height: 370px;
            padding: 15px;
        }

        ul {
            text-align: left;
        }

        input {
            margin: 17px;
        }

        .input-css {
            width: 250px;
            height: 35px;
        }

        .btn {
            width: 80px;
            height: 35px;
        }

    </style>
</head>
<body>
<div class="content">
    <h1>购书系统 - 购书</h1>
    <div class="content-left">
        <%@include file="../common/user-sidebar.jsp"%>
    </div>
    <div class="content-right">
        <form action="/user/updateUser" method="post">
            <%--message提示错误信息--%>
            <span style="color: red;">${message}</span><br/>
            <input type="hidden" name="userId" required class="input-css" value="${user.userId}"/>
            昵称：<input type="text" name="userName" required class="input-css" readonly value="${user.userName}"/><br/>
            密码：<input type="password" name="userPassword" required class="input-css" value="${user.userPassword}"/><br/>
            <input type="submit" value="修改密码" class="btn"><br/>
        </form>
    </div>
    <c:if test="${!empty user}">
        <span>当前在线人数为: ${applicationScope.count}</span>
    </c:if>
</div>
</body>
</html>
