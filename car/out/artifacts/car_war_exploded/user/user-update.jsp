<%--
  Created by IntelliJ IDEA.
  User: 林北
  Date: 2019/3/10
  Time: 16:50
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
    <style type="text/css">
        .form-update{
            max-width: 500px;
            padding: 15px;
            margin: 170px auto;
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
                <form action="user/updateUser" method="post" class="form-horizontal form-update" role="form">
                    <%--message提示错误信息--%>
                    <span style="color: red;">${message}</span><br/>
                        <input type="hidden" name="userId" required class="form-control" value="${user.user_id}"/>
                    <div class="form-group">
                        <label class="control-label col-md-4">昵称</label>
                        <div class="col-md-8">
                            <input type="text" name="userName" required class=" form-control" readonly value="${user.user_name}"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-4">密码</label>
                        <div class="col-md-8">
                            <input type="text" name="userPassword" required class=" form-control" value="${user.user_password}"/>
                        </div>
                    </div>
                    <div class="col-md-8 col-md-offset-4">
                        <input type="submit" value="修改密码" class="btn btn-block btn-primary btn-default">
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
