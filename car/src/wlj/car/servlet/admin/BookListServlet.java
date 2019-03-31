package wlj.car.servlet.admin;

import org.apache.ibatis.session.SqlSession;
import wlj.car.DBUtil.GetSqlSession;
import wlj.car.DBUtil.PageUser;
import wlj.car.bean.Book;
import wlj.car.bean.Page;
import wlj.car.dao.BookMapper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * @author LB
 * @create 2019-03-10 15:16
 */
@WebServlet("/admin/bookList")
public class BookListServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pageNum = request.getParameter("pageNum") == null?"1":request.getParameter("pageNum");
        int pageSize = 7;
        Page page = PageUser.getPageUser(Integer.parseInt(pageNum), pageSize);
        request.getSession().setAttribute("page",page );
        response.sendRedirect("/car/admin/manage-book-index.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response );
    }
}
