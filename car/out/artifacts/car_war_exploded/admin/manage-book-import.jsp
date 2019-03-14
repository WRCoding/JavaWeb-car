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

    </style>
</head>
<body>
<div class="content">
    <h1>购书系统 - 管理</h1>
    <div class="content-left">
        <%@include file="../common/manage-sidebar.jsp" %>
    </div>
    <div class="content-right">
        <h3>${message}</h3>
        <form id="file_form" action="/admin/importExcel?type=excToMqsql" enctype="multipart/form-data" method="post">
            <input type="file" name="file" id="file_input">
            <input type="submit" value="导入数据" class="file">
        </form>
        <span>
            <ul>
                <li>文件后缀名必须是<span style="color: red;">.xls</span>，不能用其他格式强制转换后缀名</li>
                <li>字段位置不能随便更改，否则不能导入</li>
            </ul>
        </span>
    </div>
    <c:if test="${!empty user}">
        <span>当前在线人数为: ${applicationScope.count}</span>
    </c:if>
</div>
</body>
</html>
