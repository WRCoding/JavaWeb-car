<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>购书系统 - 管理</title>
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

    </style>
</head>
<body>
<div class="content">
    <h1>购书系统 - 管理</h1>
    <div class="content-left">
        <%@include file="../common/manage-sidebar.jsp" %>
    </div>
    <div class="content-right">
        <form action="/admin/addBook" method="post">
            书名：<input type="text" name="bookName" required class="input-css"/><br/>
            价格：<input type="text" name="bookSprice" required class="input-css"/><br/>
            库存：<input type="number" name="bookCount" required min="1" class="input-css"/><br/>
            作者：<input type="text" name="bookAuthor" required class="input-css"/><br/>
            <button type="submit" class="btn">新增图书</button>
        </form>
    </div>
    <c:if test="${!empty user}">
        <span>当前在线人数为: ${applicationScope.count}</span>
    </c:if>
</div>
</body>
</html>
