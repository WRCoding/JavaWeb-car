<%--
  Created by IntelliJ IDEA.
  User: 林北
  Date: 2019/3/9
  Time: 15:41
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
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/signin.css" rel="stylesheet">
    <script type="text/javascript">
        function changeImge() {
            var ajax;
            if (window.XMLHttpRequest){
                ajax = new XMLHttpRequest();
            } else if (window.ActiveXObject){
                ajax = new ActiveXObject("Msxml2.XMLHTTP");
            }
            ajax.onreadystatechange = function () {
                if (ajax.readyState == 4){
                    if (ajax.status == 200){
                        document.getElementById("CodeImage").src="ver/drawImage?"+Math.random();
                    }
                }
            }
            ajax.open("get","ver/drawImage",true);
            ajax.send(null);
        }
    </script>
</head>
<body>
<div class="container">
    <form class="form-signin" action="login" method="post">
        <h1 class="form-signin-heading"style="margin-left: 50px;padding-left: 35px">购书系统</h1>
        <input type="hidden" name="action" value="login">
        <%--错误信息提示--%>
        <span style="color: red;margin-left:47% "><strong>${message}</strong></span><br/>
        <!-- 用户输入框 -->
        <div class="form-group">
            <div class="input-group">
                <input type="text"  class="form-control" placeholder="用户名" name="userName" required autofocus>
                <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
            </div>
        </div>
        <!-- 密码输入框 -->
        <div class="form-group">
            <div class="input-group">
                <input type="password"  class="form-control" placeholder="密码" name="userPassword" required autofocus>
                <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
            </div>
        </div>
        <!-- 验证码输入框 -->
        <div class="form-group">
            <div class="row">
                <div class="col-sm-10">
                    <div class="input-group">
                        <input type="text"  class="form-control" placeholder="验证码" name="validateCode" required autofocus>
                        <span class="input-group-addon"><span class="glyphicon glyphicon-picture"></span></span>
                    </div>
                </div>
                <div class="col-sm-2">
                    <img  src="ver/drawImage" style="margin-top: 7px" onclick="changeImge()" id="CodeImage">
                </div>
            </div>
        </div>
        <!--类型选择-->
        <div class="form-group">
            <div class="radio">
                <label style="margin-left: 50px">
                    <input type="radio" name="userType" value="0">管理员
                </label>
                <label style="margin-left: 50px">
                    <input type="radio" name="userType" value="1" checked>用户
                </label>
            </div>
        </div>
        <button class="btn btn-lg btn-primary btn-block" type="submit">登录</button>
    </form>
    <div class="col-md-7 col-md-offset-5">
        <a href="register">没有账户？去注册</a>
    </div>
</div> <!-- /container -->

</body>
</html>