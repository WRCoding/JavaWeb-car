<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">
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
        <%@include file="../common/user-sidebar.jsp"%>
    </div>
    <div class="content-right">
        <c:choose>
            <c:when test="${empty carList}">
                <h3 class="text-center">购书车空空如也 <a href="" style="color: red">去购物</a></h3>
            </c:when>
            <c:otherwise>
                <table>
                    <thead>
                    <tr>
                        <th>书名</th>
                        <th>价格</th>
                        <th>库存</th>
                        <th>作者</th>
                        <th>购买数量</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${carList}" var="cart">
                        <tr>
                            <td>${cart.book.bookName}</td>
                            <td>${cart.book.bookSprice}</td>
                            <td>${cart.book.bookCount}</td>
                            <td>${cart.book.bookAuthor}</td>
                            <td>${cart.number}</td>
                            <td>
                                <a href="deleteCar?bookId=${cart.book.bookId}">删除</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <input type="button" style="width: 200px;height: 50px;margin: 60px" value="清空购物车" onclick="ClearCar()">
            </c:otherwise>
        </c:choose>
    </div>
    <c:if test="${!empty user}">
        <span>当前在线人数为: ${applicationScope.count}</span>
    </c:if>
</div>
<script type="text/javascript">
    function ClearCar() {
        window.location.href = "clearCar";
    }
</script>
</body>
</html>
