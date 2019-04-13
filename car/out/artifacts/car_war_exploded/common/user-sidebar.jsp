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
<ul class="nav nav-sidebar faq-tabbable ">
    <li style="margin-top: 20px;"><a href="<%=request.getContextPath()%>/index">图书列表</a></li>
    <li><a href="<%=request.getContextPath()%>/searchBook">搜索图书</a> </li>
    <c:choose>
        <c:when test="${!empty user}">
            <li><a href="<%=request.getContextPath()%>/user/user-update.jsp">个人中心</a></li>
            <li><a href="<%=request.getContextPath()%>/user/cartList">购物车</a></li>
            <li><a href="<%=request.getContextPath()%>/user/totalPrice">结算</a></li>
            <li><a href="<%=request.getContextPath()%>/logout">退出系统</a></li>
        </c:when>
        <c:otherwise>
            <li><a href="<%=request.getContextPath()%>/index.jsp">登录</a></li>
            <li><a href="<%=request.getContextPath()%>/Register.jsp">注册</a></li>
        </c:otherwise>
    </c:choose>
</ul>
<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="https://lib.sinaapp.com/js/jquery/2.0.2/jquery-2.0.2.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="C:\Web\bootstrap-3.3.7-dist\js\bootstrap.min.js"></script>
<script>
    $(function () {
        $(".faq-tabbable").find("li").each(function () {
            var a = $(this).find("a:first")[0];
            if ($(a).attr("href") === location.pathname||$(a).attr("href") ==="") {
                $(this).addClass("active");
            } else {
                $(this).removeClass("active");
            }
        });
    })
</script>