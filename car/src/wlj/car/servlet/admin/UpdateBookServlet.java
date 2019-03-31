package wlj.car.servlet.admin;

import org.apache.ibatis.session.SqlSession;
import wlj.car.DBUtil.GetSqlSession;
import wlj.car.bean.Book;
import wlj.car.dao.BookMapper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author LB
 * @create 2019-03-12 15:14
 */
@WebServlet("/admin/updateBook")
public class UpdateBookServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int bookId = Integer.parseInt(request.getParameter("bookId"));
        String bookName = request.getParameter("bookName");
        String bookSprice = request.getParameter("bookSprice");
        String bookCount = request.getParameter("bookCount");
        String bookAuthor = request.getParameter("bookAuthor");
        int pageNum = Integer.parseInt(request.getParameter("pageNum"));

        Book book = new Book();
        book.setBookId(bookId);
        book.setBookName(bookName);
        book.setBookSprice(Double.parseDouble(bookSprice));
        book.setBookCount(Integer.valueOf(bookCount));
        book.setBookAuthor(bookAuthor);

        SqlSession sqlSession = GetSqlSession.getSqlSession();
        BookMapper bookMapper = sqlSession.getMapper(BookMapper.class);
        bookMapper.updateBook(book);
        sqlSession.commit();
        sqlSession.close();

        request.setAttribute("message","更新成功" );
        request.getRequestDispatcher("/admin/bookList?pageNum="+pageNum).forward(request,response );
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int bookId = Integer.parseInt(request.getParameter("bookId"));
        int pageNum = Integer.parseInt(request.getParameter("pageNum"));
        SqlSession sqlSession = GetSqlSession.getSqlSession();
        BookMapper bookMapper = sqlSession.getMapper(BookMapper.class);
        Book book = bookMapper.getBook(bookId);
        request.setAttribute("book",book );
        request.setAttribute("pageNum",pageNum );
        request.getRequestDispatcher("/admin/manage-book-update.jsp").forward(request,response );
    }
}
