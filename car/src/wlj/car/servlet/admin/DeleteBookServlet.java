package wlj.car.servlet.admin;

import org.apache.ibatis.session.SqlSession;
import wlj.car.DBUtil.GetSqlSession;
import wlj.car.dao.BookMapper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author LB
 * @create 2019-03-12 13:31
 */
@WebServlet("/admin/deleteBook")
public class DeleteBookServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String bookId = request.getParameter("bookId");
        if(bookId != null || bookId.equals("")){
            SqlSession sqlSession = GetSqlSession.getSqlSession();
            BookMapper bookMapper = sqlSession.getMapper(BookMapper.class);
            bookMapper.deleteBook(Integer.parseInt(bookId));
            sqlSession.commit();
            sqlSession.close();
            request.setAttribute("message","图书删除成功" );
        }
        request.getRequestDispatcher("/admin/bookList").forward(request,response );
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response );
    }
}
