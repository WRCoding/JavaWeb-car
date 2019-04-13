<%--
  Created by IntelliJ IDEA.
  User: 林北
  Date: 2019/3/10
  Time: 16:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">
<html>
<head>
    <title>购书系统</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            padding-top: 40px;
            padding-bottom: 40px;
            background-color: #eee;
        }
        .form-register{
            max-width: 330px;
            padding: 15px;
            margin: 0 auto;
        }
        /*h1 {*/
            /*text-align: center;*/
            /*border-bottom: 1px solid black;*/
            /*line-height: 100px;*/
        /*}*/

        /*.content {*/
            /*width: 1000px;*/
            /*margin-left: auto;*/
            /*margin-right: auto;*/
            /*text-align: center;*/
        /*}*/

        /*input {*/
            /*margin: 15px;*/
        /*}*/

        /*.input-css {*/
            /*width: 250px;*/
            /*height: 35px;*/
        /*}*/

        /*.btn {*/
            /*width: 80px;*/
            /*height: 35px;*/
        /*}*/
        a{
            text-decoration: none;
        }
        a:link {color: black}
        a:visited {color: black}
        a:hover {color: red}
        a:active {color: red}
    </style>
</head>
<body>
<div class="container">
    <form id="registerForm" method="post" action="register" class="form-register form-horizontal" role="form" >
        <h1 style="margin-left: 45%">注&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp册</h1>
        <strong>${message}</strong><br/>
        <div class="form-group">
            <label class="control-label col-md-4"> 账户</label>
            <div class="col-md-8">
                <input type="text" name="userName" required class="form-control" id="userName"/><br/>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-md-4"> 密码</label>
            <div class="col-md-8">
                <input type="password" name="userPassword"  required class="form-control" id="userPassword"/><br/>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-md-4"> 确认密码</label>
            <div class="col-md-8">
                <input type="password" name="checkUserPassword" required class="form-control" id="checkUserPassword"/><br/>
            </div>
        </div>
        <div class="col-md-8 col-md-offset-4">
            <input type="button" value="注 册" class="btn btn-block btn-default btn-primary" onclick="registerFun()"><br/>
        </div>
    </form>
    <div class="col-md-6 col-md-offset-6">
        <a href="index.jsp">去登录</a>
    </div>
</div>
<script>
    function registerFun() {
        var userName = document.getElementById("userName").value;
        var userPassword = document.getElementById("userPassword").value;
        var checkUserPassword = document.getElementById("checkUserPassword").value;
        //是否输入且输入是否为空
        if (userName != null && userName.length != 0 && userPassword != null && userPassword.length != 0) {
            if (userPassword != checkUserPassword) {
                alert("两次输入的密码不同请重新输入");
            } else {
                var form = document.getElementById("registerForm");
                form.submit();
            }
        } else {
            alert("用户名或密码不能为空");
        }
    }
</script>
</body>
</html>

