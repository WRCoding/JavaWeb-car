<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    当前登录：${user.userName}
    <li style="margin-top: 20px"><a href="admin/addBook">新增图书</a></li>
    <li><a href="searchBook">搜索图书</a> </li>
    <li><a href="admin/bookList">图书列表</a></li>
    <li><a href="admin/importExcel">批量导入图书</a></li>
    <li><a href="logout">退出系统</a></li>
</ul>