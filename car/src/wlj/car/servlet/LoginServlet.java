package wlj.car.servlet;

import wlj.car.bean.Book;
import wlj.car.bean.User;
import wlj.car.dao.BookDao;
import wlj.car.dao.UserDao;

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
 * @create 2019-03-09 16:35
 */
@WebServlet(name = "LoginServlet",urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userName = req.getParameter("userName");
        String userPassword = req.getParameter("userPassword");
        String validateCode = req.getParameter("validateCode").toUpperCase();
        System.out.println("validateCode: "+validateCode);
        String rightCode = String.valueOf(req.getSession().getAttribute("checkcode")).toUpperCase();
        System.out.println("rightCode: "+rightCode);
        int userType = Integer.parseInt(req.getParameter("userType"));
        UserDao userDao = new UserDao();
        User user =userDao.login(userName,userPassword );
        if(validateCode.equals(rightCode)){
            if(user == null){
                req.setAttribute("message","用户名或密码错误，请重新登录" );
                req.getRequestDispatcher("/index.jsp").forward(req,resp );
            }else{
                if(userType == 0){
                    if(user.getUserLevelId() == 0){
                        HttpSession session = req.getSession();
                        session.setAttribute("user",user );
                        req.getRequestDispatcher("/admin/bookList").forward(req,resp);
                    }else{
                        HttpSession session = req.getSession();
                        session.setAttribute("message", "用户身份错误");
                        resp.sendRedirect("403.jsp");
                        return;
                    }
                }
                if(userType == 1){
                    if(user.getUserLevelId() == 1){
                        BookDao bookDao = new BookDao();
                        List<Book> list  = bookDao.bookList();
                        req.setAttribute("booklist",list );
                        HttpSession session = req.getSession();
                        session.setAttribute("user",user );
                        req.getRequestDispatcher("/main.jsp").forward(req,resp );
                    }else{
                        HttpSession session = req.getSession();
                        session.setAttribute("message", "用户身份错误");
                        resp.sendRedirect("403.jsp");
                        return;
                    }
                }
            }
        }else {
            req.setAttribute("message","验证码输入错误" );
            req.getRequestDispatcher("/index.jsp").forward(req,resp );
        }
    }
}
