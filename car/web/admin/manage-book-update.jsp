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
        <form action="/admin/updateBook" method="post">  <!-- 调用UpdateBookServlet中的doPost -->
            <input type="hidden" name="bookId" value="${book.bookId}" class="input-css"/>
            书名：<input type="text" name="bookName" value="${book.bookName}" class="input-css"/><br/>
            价格：<input type="text" name="bookSprice" value="${book.bookSprice}" class="input-css"/><br/>
            库存：<input type="number" name="bookCount" value="${book.bookCount}" min="1" class="input-css"/><br/>
            作者：<input type="text" name="bookAuthor" value="${book.bookAuthor}" class="input-css"/><br/>
            <button type="submit" class="btn">更新图书</button>
        </form>
    </div>
</div>
</body>
</html>
