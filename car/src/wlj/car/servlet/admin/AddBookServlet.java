package wlj.car.servlet.admin;

import wlj.car.bean.Book;
import wlj.car.dao.BookDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author LB
 * @create 2019-03-12 10:03
 */
@WebServlet("/admin/addBook")
public class AddBookServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String bookName = request.getParameter("bookName");
        String bookSprice = request.getParameter("bookSprice");
        String bookCount = request.getParameter("bookCount");
        String bookAuthor = request.getParameter("bookAuthor");

        Book book = new Book();
        book.setBookName(bookName);
        book.setBookSprice(Double.parseDouble(bookSprice));
        book.setBookCount(Integer.valueOf(bookCount));
        book.setBookAuthor(bookAuthor);

        BookDao bookDao = new BookDao();
        bookDao.addBook(book);
        request.getRequestDispatcher("/admin/bookList").forward(request,response );
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/admin/manage-book-add.jsp").forward(request,response );
    }
}
