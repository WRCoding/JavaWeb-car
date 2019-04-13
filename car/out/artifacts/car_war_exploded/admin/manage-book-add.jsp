<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">
<html>
<head>
    <title>购书系统 - 管理</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/dashboard.css" rel="stylesheet">
    <style>
        .form-add{
            max-width: 450px;
            padding: 15px;
            margin: 70px auto;
        }
    </style>
</head>
<body>
<%@include file="/common/nav-header.jsp"%>

<div class="container-fluid">
    <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
            <%@include file="/common/manage-sidebar.jsp"%>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <div class="container">
                <form action="admin/addBook" method="post" class="form-add form-horizontal">
                    <div class="form-group">
                        <h1 style="margin-left: 220px">新增图书</h1>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-4">书名</label>
                        <div class="col-md-8">
                            <input type="text" name="bookName" required class="form-control"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-4">价格</label>
                        <div class="col-md-8">
                            <input type="text" name="bookSprice" required class="form-control"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-4">库存</label>
                        <div class="col-md-8">
                            <input type="text" name="bookCount" required  class="form-control"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-4">作者</label>
                        <div class="col-md-8">
                            <input type="text" name="bookAuthor" required  class="form-control"/>
                        </div>
                    </div>
                    <div class="col-md-8 col-md-offset-4">
                        <button type="submit" class="btn btn-primary btn-block">新增图书</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

</body>
</html>
