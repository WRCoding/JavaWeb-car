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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/dashboard.css" rel="stylesheet">
    <style>
        h3 {
            text-align: center;
            line-height: 100px;
        }
    </style>
</head>
<body>
<%@include file="/common/nav-header.jsp"%>

<div class="container-fluid">
    <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
            <c:choose>
                <c:when test="${user.user_level_id == 0}">
                    <%@include file="/common/manage-sidebar.jsp"%>
                </c:when>
                <c:otherwise>
                    <%@include file="/common/user-sidebar.jsp"%>
                </c:otherwise>
            </c:choose>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <div class="container">
                <c:choose>
                    <c:when test="${empty carList}">
                        <h3 class="text-center">购书车空空如也 <a href="index" style="color: red">去购物</a></h3>
                    </c:when>
                    <c:otherwise>
                        <table class="table table-striped">
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
                                        <a href="user/deleteCar?bookId=${cart.book.bookId}">删除</a>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                        <input type="button" class="btn btn-primary btn-block btn-default" style="width: 200px;float: right" value="清空购物车" onclick="ClearCar()">
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    function ClearCar() {
        window.location.href = "user/clearCar";
    }
</script>
</body>
</html>
