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

    input {
      margin: 15px;
    }

    .input-css {
      width: 250px;
      height: 35px;
    }

    .btn {
      width: 80px;
      height: 35px;
    }
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
<div class="content">
  <h1>购书系统</h1>
  <form action="login" method="post">
    <%--message提示错误信息--%>
    <span style="color: red;">${message}</span><br/>
        <input type="hidden" name="action" value="login">
    账户：<input type="text" name="userName" required class="input-css"/><br/>
    密码：<input type="password" name="userPassword" required class="input-css"/><br/>
    <input type="radio" name="userType" value="0" /> 管理员
    <input type="radio" name="userType" value="1" checked/> 用户<br/>
     验证码：<input type="text" name="validateCode">
      <img src="ver/drawImage" id="CodeImage" onclick="changeImge()">
      <a href="javascript:void(0)" onclick="changeImge()">看不清，换一张</a><br>
      <input type="submit" value="登 录" class="btn"><br/>
    <%--<a href="main.jsp">游客访问</a><br/>--%>
      <br>
    <a href="register">没有账户？去注册</a>
  </form>
</div>
<script type="text/javascript">
  function changeImge() {
      document.getElementById("CodeImage").src="ver/drawImage?"+Math.random();
  }
</script>
</body>
</html>