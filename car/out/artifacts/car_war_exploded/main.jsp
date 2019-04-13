<%--
  Created by IntelliJ IDEA.
  User: 林北
  Date: 2019/3/9
  Time: 16:47
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
    <title>购书系统 - 购书</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/dashboard.css" rel="stylesheet">
</head>
<body>
<%@include file="/common/nav-header.jsp"%>
<div class="container-fluid">
    <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
            <%@include file="common/user-sidebar.jsp"%>
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
                        <c:choose>
                            <c:when test="${!empty user}">
                                <th>购买数量</th>
                                <th>操作</th>
                            </c:when>
                        </c:choose>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${page.booklist}" var="book" varStatus="status">
                        <tr>
                            <td>${book.bookName}</td>
                            <td>${book.bookSprice}</td>
                            <td>${book.bookCount}</td>
                            <td>${book.bookAuthor}</td>
                            <c:choose>
                                <c:when test="${!empty user}">
                                    <td><input type="number" class="bookNumber" value="1" min="1" ></td>
                                    <td>
                                        <a href="javascript:;" onclick="addCartFun('${book.bookId}',${status.index})">加入购物车</a>
                                    </td>
                                </c:when>
                            </c:choose>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
              <c:if test="${empty requestScope.page.booklist}">
                  <ul class="pagination">
                      <li><a href="index?pageNum=1">首页</a></li>
                          <%--当前页数为第一页--%>
                      <c:if test="${sessionScope.page.pageNum == 1}">
                          <c:forEach begin="${sessionScope.page.start}" end="${sessionScope.page.end}" step="1" var="i">
                              <c:if test="${sessionScope.page.pageNum == i}">
                                  <li><span  style="color: deeppink">${i}</span></li>
                              </c:if>
                              <c:if test="${sessionScope.page.pageNum != i}">
                                  <li><a href="index?pageNum=${i}">${i}</a></li>
                              </c:if>
                          </c:forEach>
                          <li><a href="index?pageNum=${sessionScope.page.pageNum+1}">下一页</a></li>
                      </c:if>
                          <%--当前页数为中间页数--%>
                      <c:if test="${sessionScope.page.pageNum >1 && sessionScope.page.pageNum<sessionScope.page.totalPage}">
                          <li><a href="index?pageNum=${sessionScope.page.pageNum-1}">上一页</a></li>
                          <c:forEach begin="${sessionScope.page.start}" end="${sessionScope.page.end}" step="1" var="i">
                              <c:if test="${sessionScope.page.pageNum == i}">
                                  <li><span  style="color: deeppink">${i}</span></li>
                              </c:if>
                              <c:if test="${sessionScope.page.pageNum != i}">
                                  <li><a href="index?pageNum=${i}">${i}</a></li>
                              </c:if>
                          </c:forEach>
                          <li><a href="index?pageNum=${sessionScope.page.pageNum+1}">下一页</a></li>
                      </c:if>
                          <%--当前页数为最后一页--%>
                      <c:if test="${sessionScope.page.pageNum == sessionScope.page.totalPage}">
                          <li><a href="index?pageNum=${sessionScope.page.pageNum-1}">上一页</a></li>
                          <c:forEach begin="${sessionScope.page.start}" end="${sessionScope.page.end}" step="1" var="i">
                              <c:if test="${sessionScope.page.pageNum == i}">
                                  <li><span  style="color: deeppink">${i}</span></li>
                              </c:if>
                              <c:if test="${sessionScope.page.pageNum != i}">
                                  <li><a href="index?pageNum=${i}">${i}</a></li>
                              </c:if>
                          </c:forEach>
                      </c:if>
                      <li><a href="index?pageNum=${sessionScope.page.totalPage}">首页</a></li>
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

<script>
    function addCartFun(bookId,ind) {
        var number = document.getElementsByClassName("bookNumber")[ind].value;
        window.location.href = "user/addCar?bookId=" + bookId + "&number=" + number+"&pageNum="+${sessionScope.page.pageNum};
    }
    function logout() {
        window.location.href="logout";
    }
</script>

</body>
</html>

