package wlj.car.servlet;

import wlj.car.bean.Book;
import wlj.car.bean.User;
import wlj.car.dao.BookDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

/**
 * @author LB
 * @create 2019-03-09 21:43
 */
@WebServlet("/searchBook")
public class SearchBookServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String key = request.getParameter("key");
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        BookDao bookDao = new BookDao();
        List<Book> list = bookDao.searchBook(key);
        System.out.println(key+"-----"+list);
        request.setAttribute("booklist", list);
        request.setAttribute("search","搜索结果" );
        if(user == null || user.getUserLevelId() == 1){
            request.getRequestDispatcher("/main.jsp").forward(request,response );
        }else{
            request.getRequestDispatcher("/admin/manage-book-main.jsp").forward(request,response );
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/search.jsp").forward(request,response );
    }
}
