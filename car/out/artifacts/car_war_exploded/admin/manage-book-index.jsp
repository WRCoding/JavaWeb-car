<%--
  Created by IntelliJ IDEA.
  User: 林北
  Date: 2019/3/10
  Time: 15:05
  To change this template use File | Settings | File Templates.
--%>
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
        h1 {
            text-align: center;
            border-bottom: 1px solid black;
            line-height: 100px;
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
            <h2 class="sub-header">Books</h2>
            <div class="table-responsive">
                <table class="table table-striped" >
                    <thead>
                    <tr>
                        <th>书名</th>
                        <th>价格</th>
                        <th>库存</th>
                        <th>作者</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${sessionScope.page.booklist}" var="book">
                        <tr>
                            <td>${book.bookName}</td>
                            <td>${book.bookSprice}</td>
                            <td>${book.bookCount}</td>
                            <td>${book.bookAuthor}</td>
                            <td>
                                <a href="admin/updateBook?bookId=${book.bookId}&pageNum=${sessionScope.page.pageNum}">更新</a>  <!-- 调用UpdateBookServlet中的doGet方法 -->
                                <a href="admin/deleteBook?bookId=${book.bookId}&pageNum=${sessionScope.page.pageNum}">删除</a>  <!-- get方法 -->
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <c:if test="${empty requestScope.page.booklist}">
                    <ul class="pagination">
                        <li><a href="admin/bookList?pageNum=1">首页</a></li>
                            <%--当前页数为第一页--%>
                        <c:if test="${sessionScope.page.pageNum == 1}">
                            <c:forEach begin="${sessionScope.page.start}" end="${sessionScope.page.end}" step="1" var="i">
                                <c:if test="${sessionScope.page.pageNum == i}">
                                    <li><span  style="color: deeppink">${i}</span></li>
                                </c:if>
                                <c:if test="${sessionScope.page.pageNum != i}">
                                    <li><a href="admin/bookList?pageNum=${i}">${i}</a></li>
                        </c:if>
                            </c:forEach>
                            <li><a href="admin/bookList?pageNum=${sessionScope.page.pageNum+1}">下一页</a></li>
                        </c:if>
                            <%--当前页数为中间页数--%>
                        <c:if test="${sessionScope.page.pageNum >1 && sessionScope.page.pageNum<sessionScope.page.totalPage}">
                            <li><a href="admin/bookList?pageNum=${sessionScope.page.pageNum-1}">上一页</a></li>
                            <c:forEach begin="${sessionScope.page.start}" end="${sessionScope.page.end}" step="1" var="i">
                                <c:if test="${sessionScope.page.pageNum == i}">
                                    <li><span  style="color: deeppink">${i}</span></li>
                                </c:if>
                                <c:if test="${sessionScope.page.pageNum != i}">
                                    <li><a href="admin/bookList?pageNum=${i}">${i}</a></li>
                                </c:if>
                            </c:forEach>
                            <li><a href="admin/bookList?pageNum=${sessionScope.page.pageNum+1}">下一页</a></li>
                        </c:if>
                            <%--当前页数为最后一页--%>
                        <c:if test="${sessionScope.page.pageNum == sessionScope.page.totalPage}">
                            <li><a href="admin/bookList?pageNum=${sessionScope.page.pageNum-1}">上一页</a></li>
                            <c:forEach begin="${sessionScope.page.start}" end="${sessionScope.page.end}" step="1" var="i">
                                <c:if test="${sessionScope.page.pageNum == i}">
                                    <li><span  style="color: deeppink">${i}</span></li>
                                </c:if>
                                <c:if test="${sessionScope.page.pageNum != i}">
                                    <li><a href="admin/bookList?pageNum=${i}">${i}</a></li>
                                </c:if>
                            </c:forEach>
                        </c:if>
                        <li><a href="admin/bookList?pageNum=${sessionScope.page.totalPage}">首页</a></li>
                    </ul>
                </c:if>
            </div>
            <c:if test="${!empty user}">
                <h4>当前在线人数为: ${applicationScope.count}</h4>
            </c:if>
        </div>
    </div>
</div>
</div>


<%--<div class="content">--%>
    <%--<h1>购书系统 - 管理</h1>--%>
    <%--<div class="content-left">--%>
        <%--<%@include file="../common/manage-sidebar.jsp"%>--%>
    <%--</div>--%>
    <%--<div class="content-right">--%>
        <%--${search}--%>
        <%--${message}--%>
        <%--<table>--%>
           <%----%>
        <%--</table>--%>
        <%--<div>--%>
            <%--<a href="admin/bookList?pageNum=1">首页</a>--%>
            <%--&lt;%&ndash;当前页数为第一页&ndash;%&gt;--%>
            <%--<c:if test="${sessionScope.page.pageNum == 1}">--%>
                <%--<a href="#" >上一页</a>--%>
                <%--<c:forEach begin="${sessionScope.page.start}" end="${sessionScope.page.end}" step="1" var="i">--%>
                    <%--<c:if test="${sessionScope.page.pageNum == i}">--%>
                        <%--<span  style="color: deeppink">${i}</span>--%>
                    <%--</c:if>--%>
                    <%--<c:if test="${sessionScope.page.pageNum != i}">--%>
                        <%--<a href="admin/bookList?pageNum=${i}">${i}</a>--%>
                    <%--</c:if>--%>
                <%--</c:forEach>--%>
                <%--<a href="admin/bookList?pageNum=${sessionScope.page.pageNum+1}">下一页</a>--%>
            <%--</c:if>--%>
            <%--&lt;%&ndash;当前页数为中间页数&ndash;%&gt;--%>
            <%--<c:if test="${sessionScope.page.pageNum >1 && sessionScope.page.pageNum<sessionScope.page.totalPage}">--%>
                <%--<a href="admin/bookList?pageNum=${sessionScope.page.pageNum-1}">上一页</a>--%>
                <%--<c:forEach begin="${sessionScope.page.start}" end="${sessionScope.page.end}" step="1" var="i">--%>
                    <%--<c:if test="${sessionScope.page.pageNum == i}">--%>
                        <%--<span  style="color: deeppink">${i}</span>--%>
                    <%--</c:if>--%>
                    <%--<c:if test="${sessionScope.page.pageNum != i}">--%>
                        <%--<a href="admin/bookList?pageNum=${i}">${i}</a>--%>
                    <%--</c:if>--%>
                <%--</c:forEach>--%>
                <%--<a href="admin/bookList?pageNum=${sessionScope.page.pageNum+1}">下一页</a>--%>
            <%--</c:if>--%>
            <%--&lt;%&ndash;当前页数为最后一页&ndash;%&gt;--%>
            <%--<c:if test="${sessionScope.page.pageNum == sessionScope.page.totalPage}">--%>
                <%--<a href="admin/bookList?pageNum=${sessionScope.page.pageNum-1}">上一页</a>--%>
                <%--<c:forEach begin="${sessionScope.page.start}" end="${sessionScope.page.end}" step="1" var="i">--%>
                    <%--<c:if test="${sessionScope.page.pageNum == i}">--%>
                        <%--<span  style="color: deeppink">${i}</span>--%>
                    <%--</c:if>--%>
                    <%--<c:if test="${sessionScope.page.pageNum != i}">--%>
                        <%--<a href="admin/bookList?pageNum=${i}">${i}</a>--%>
                    <%--</c:if>--%>
                <%--</c:forEach>--%>
                <%--<a href="#">下一页</a>--%>
            <%--</c:if>--%>
            <%--<a href="admin/bookList?pageNum=${sessionScope.page.totalPage}">尾页</a>--%>
        <%--</div>--%>
    <%--</div>--%>
    <%--<c:if test="${!empty user}">--%>
        <%--<span>当前在线人数为: ${applicationScope.count}</span>--%>
    <%--</c:if>--%>
<%--</div>--%>
</body>
</html>

