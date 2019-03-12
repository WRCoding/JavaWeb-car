package wlj.car.servlet.user;

import wlj.car.bean.User;
import wlj.car.dao.UserDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * @author LB
 * @create 2019-03-10 16:52
 */
@WebServlet("/user/updateUser")
public class UpdateUserServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int userId = Integer.parseInt(request.getParameter("userId"));
        String userName = request.getParameter("userName");
        String userPassword = request.getParameter("userPassword");
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        user.setUserId(userId);
        user.setUserName(userName);
        user.setUserPassword(userPassword);
        UserDao userDao = new UserDao();
        boolean flag = userDao.updateUser(user);
        if(flag == true){
            session.setAttribute("message","密码修改成功" );
            session.setAttribute("user",user );
            request.getRequestDispatcher("logout").forward(request,response );
        }else{
            request.setAttribute("message","密码修改失败" );
            request.getRequestDispatcher("/user/user-update.jsp").forward(request,response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response );
    }
}
