<%--
  Created by IntelliJ IDEA.
  User: 林北
  Date: 2019/3/9
  Time: 21:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">
<html>
<head>
    <c:choose>
        <c:when test="${user.user_level_id == 0}">
            <title>购书系统 - 管理</title>
        </c:when>
        <c:otherwise>
            <title>购书系统 - 购书</title>
        </c:otherwise>
    </c:choose>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/dashboard.css" rel="stylesheet">
    <style type="text/css">
        .form-search{
            max-width: 330px;
            padding: 15px;
            margin: 200px auto;
        }
    </style>
</head>
<body>
<%--导航条，引用公共代码--%>
<%@include file="/common/nav-header.jsp"%>
<div class="container-fluid">
    <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
            <c:choose>
                <c:when test="${user.user_level_id == 0}">
                        <%@include file="common/manage-sidebar.jsp"%>
                </c:when>
                <c:otherwise>
                        <%@include file="common/user-sidebar.jsp"%>
                </c:otherwise>
            </c:choose>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <div class="container">
                <form action="searchBook" method="post" class="form-search form-horizontal">
                    <div class="form-group row">
                        <label class="control-label col-md-4">关键字</label>
                        <div class="col-md-8">
                            <input type="text" name="key" required class="form-control"/><br/>
                        </div>
                    </div>
                    <div class=" col-md-8 col-md-offset-4">
                        <button type="submit" class="btn btn-default btn-primary btn-block">搜索</button>
                    </div>
                </form>
            </div>
        </div>
</div>
</div>
</body>
</html>
