package wlj.car.servlet.user;

import org.apache.ibatis.session.SqlSession;
import wlj.car.DBUtil.GetSqlSession;
import wlj.car.bean.User;
import wlj.car.dao.UserMapper;

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


        SqlSession sqlSession = GetSqlSession.getSqlSession();
        UserMapper userMapper = sqlSession.getMapper(UserMapper.class);


        int userId = Integer.parseInt(request.getParameter("userId"));
        String userName = request.getParameter("userName");
        String userPassword = request.getParameter("userPassword");

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        user.setUser_id(userId);
        user.setUser_name(userName);
        user.setUser_password(userPassword);
        int index = userMapper.updateUser(user);
        System.out.println(index);
        sqlSession.commit();
        sqlSession.close();
        if(index > 0){
            session.setAttribute("message","密码修改成功" );
            session.setAttribute("user",user );
            request.getRequestDispatcher("/logout").forward(request,response );
        }else{
            request.setAttribute("message","密码修改失败" );
            request.getRequestDispatcher("/user/user-update.jsp?").forward(request,response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response );
    }
}
