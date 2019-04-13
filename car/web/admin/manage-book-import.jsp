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
    <link href="css/fileinput.min.css" rel="stylesheet">
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="https://lib.sinaapp.com/js/jquery/2.0.2/jquery-2.0.2.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="js/bootstrap.min.js"></script>
    <script src="js/fileinput.min.js"></script>
    <script src="js/zh.js"></script>
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
                <form id="file_form" action="admin/importExcel?type=excToMqsql" enctype="multipart/form-data" method="post" class="form-horizontal" role="form">
                    <h3>${message}</h3>
                   <div class="form-group">
                       <input type="file" name="file" id="file_input" class="file file_import" data-show-preview="false" >
                   </div>
                </form>
                <span>
            <ul>
                <li>文件后缀名必须是<span style="color: red;">.xls</span>，不能用其他格式强制转换后缀名</li>
                <li>字段位置不能随便更改，否则不能导入</li>
            </ul>
        </span>
            </div>
        </div>
    </div>
</div>
<script>
    init();
    function init() {
        $("#file_input").fileinput({
            language:'zh'
        })
    }
</script>
</body>
</html>
