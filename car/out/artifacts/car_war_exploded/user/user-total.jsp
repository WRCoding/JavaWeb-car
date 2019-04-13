<%--
  Created by IntelliJ IDEA.
  User: 林北
  Date: 2019/3/12
  Time: 7:32
  To change this template use File | Settings | File Templates.
--%>
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
                    <c:when test="${totalPrice == 0.0}">
                        <h3>${message} <a href="index" style="color: red">去购物</a></h3>
                    </c:when>
                    <c:otherwise>
                        <h3> 您当前总共需要支付 <span style="color: red;">${totalPrice}</span> 元</h3>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
</div>
</body>
</html>

