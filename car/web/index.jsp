<%--
  Created by IntelliJ IDEA.
  User: 林北
  Date: 2019/3/9
  Time: 16:47
  To change this template use File | Settings | File Templates.
--%>
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

    </style>
</head>
<body>
<div class="content">
    <h1>购书系统 - 购书</h1>
    <div class="content-left">
        <%@include file="common/user-sidebar.jsp"%>
    </div>
    <div class="content-right">
        ${search}
        <table>
            <thead>
            <tr>
                <th>书名</th>
                <th>价格</th>
                <th>库存</th>
                <th>作者</th>
                <c:choose>
                    <c:when test="${!empty user}">
                        <th>购买数量</th>
                        <th>操作</th>
                    </c:when>
                </c:choose>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${booklist}" var="book" varStatus="status">
                <tr>
                    <td>${book.bookName}</td>
                    <td>${book.bookSprice}</td>
                    <td>${book.bookCount}</td>
                    <td>${book.bookAuthor}</td>
                    <c:choose>
                        <c:when test="${!empty user}">
                            <td><input type="number" class="bookNumber" value="1" min="1" ></td>
                            <td>
                                <a href="javascript:;" onclick="addCartFun('${book.bookId}',${status.index})">加入购物车</a>
                            </td>
                        </c:when>
                    </c:choose>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<script>
    function addCartFun(bookId,ind) {
        var number = document.getElementsByClassName("bookNumber")[ind].value;
        window.location.href = "user/addCar?bookId=" + bookId + "&number=" + number;
    }
</script>

</body>
</html>

