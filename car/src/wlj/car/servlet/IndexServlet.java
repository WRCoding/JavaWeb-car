package wlj.car.servlet;

import wlj.car.bean.Book;
import wlj.car.dao.BookDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * @author LB
 * @create 2019-03-09 21:09
 */
@WebServlet("")
public class IndexServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Book> list = new ArrayList<>();
        BookDao bookDao = new BookDao();
        list = bookDao.bookList();
        request.setAttribute("booklist",list );
        request.getRequestDispatcher("index.jsp").forward(request,response );
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response );
    }
}
