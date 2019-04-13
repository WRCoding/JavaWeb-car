<%--
  Created by IntelliJ IDEA.
  User: 林北
  Date: 2019/4/12
  Time: 11:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container-fluid">
        <div class="navbar-header">
            <!-- <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
              <span class="sr-only">Toggle navigation</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button> -->
            <span class="navbar-brand">当前登录:${user.user_name}</span>
        </div>
        <div class="navbar-right row">
            <span class="navbar-brand col-md-1"><span class="glyphicon glyphicon-log-out" onclick="logout()"></span></span>
        </div>
    </div>
</nav>

<script>
    function logout() {
        window.location.href="logout";
    }
</script>
