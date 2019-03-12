<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style type="text/css">
    li{
        line-height: 45px;
    }
    a{
        text-decoration: none;
    }
    a:link {color: black}
    a:visited {color: black}
    a:hover {color: deepskyblue}
    a:active {color: black}
</style>
<ul>
    <c:choose>
        <c:when test="${!empty user}">
            当前登录：<strong>${user.userName}</strong>
        </c:when>
    </c:choose>
    <li style="margin-top: 20px;"><a href="/">图书列表</a></li>
    <li><a href="/searchBook">搜索图书</a> </li>
    <c:choose>
        <c:when test="${!empty user}">
            <li><a href="/user/user-update.jsp">个人中心</a></li>
            <li><a href="/user/cartList">购物车</a></li>
            <%--<li><a href="/clearCart">清空购物车</a></li>--%>
            <li><a href="/user/totalPrice">结算</a></li>
            <li><a href="/logout">退出系统</a></li>
        </c:when>
        <c:otherwise>
            <li><a href="/login.jsp">登录</a></li>
            <li><a href="/Register.jsp">注册</a></li>
        </c:otherwise>
    </c:choose>
</ul>