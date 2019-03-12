package wlj.car.servlet;

import wlj.car.bean.User;
import wlj.car.dao.UserDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author LB
 * @create 2019-03-10 16:17
 */
@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userName = request.getParameter("userName");
        String userPassword = request.getParameter("userPassword");
        UserDao userDao = new UserDao();
        User user = userDao.checkUser(userName);
        if(user != null){
            request.setAttribute("message","用户名已存在" );
            request.getRequestDispatcher("Register.jsp").forward(request,response );
        }else{
            userDao.register(userName,userPassword,1);
            request.setAttribute("message","注册成功" );
            request.getRequestDispatcher("Register.jsp").forward(request,response );
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("Register.jsp").forward(request,response );
    }
}
