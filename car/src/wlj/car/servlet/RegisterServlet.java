package wlj.car.servlet;

import org.apache.ibatis.session.SqlSession;
import wlj.car.DBUtil.GetSqlSession;
import wlj.car.bean.User;
import wlj.car.dao.UserMapper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * @author LB
 * @create 2019-03-10 16:17
 */
@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        SqlSession sqlSession = GetSqlSession.getSqlSession();
        UserMapper userMapper = sqlSession.getMapper(UserMapper.class);

        String userName = request.getParameter("userName");
        String userPassword = request.getParameter("userPassword");

        Map<String,Object> map = new HashMap<>();
        map.put("userName",userName );
        map.put("userPassword",userPassword );
        map.put("userLevelId", 1);

        User user = userMapper.checkUser(userName);
        if(user != null){
            request.setAttribute("message","用户名已存在" );
            request.getRequestDispatcher("/Register.jsp").forward(request,response );
        }else{
            userMapper.register(map);
            sqlSession.commit();
            sqlSession.close();
            request.setAttribute("message","注册成功" );
            request.getRequestDispatcher("/index.jsp").forward(request,response );
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/Register.jsp").forward(request,response );
    }
}
