package wlj.car.servlet.admin;

import wlj.car.dao.BookDao;

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
            int id = Integer.parseInt(bookId);
            BookDao bookDao = new BookDao();
            bookDao.deleteBook(id);
            request.setAttribute("message","图书删除成功" );
        }
        request.getRequestDispatcher("/admin/bookList").forward(request,response );
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response );
    }
}
