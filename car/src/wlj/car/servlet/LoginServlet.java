package wlj.car.servlet;

import org.apache.ibatis.session.SqlSession;
import wlj.car.DBUtil.GetSqlSession;
import wlj.car.bean.Book;
import wlj.car.bean.User;
import wlj.car.dao.BookMapper;
import wlj.car.dao.UserMapper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author LB
 * @create 2019-03-09 16:35
 */
@WebServlet(name = "LoginServlet",urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        SqlSession sqlSession = GetSqlSession.getSqlSession();
        UserMapper userMapper = sqlSession.getMapper(UserMapper.class);


        String userName = req.getParameter("userName");
        String userPassword = req.getParameter("userPassword");
        String validateCode = req.getParameter("validateCode").toUpperCase();
        String rightCode = String.valueOf(req.getSession().getAttribute("checkcode")).toUpperCase();
        int userType = Integer.parseInt(req.getParameter("userType"));

        Map<String,Object> map = new HashMap<>(2);
        map.put("userName", userName);
        map.put("userPassword", userPassword);

        User user = userMapper.login(map);
        System.out.println(user+"----"+map);
        if(validateCode.equals(rightCode)){
            if(user == null){
                req.setAttribute("message","用户名或密码错误，请重新登录" );
                req.getRequestDispatcher("/index.jsp").forward(req,resp );
            }else{
                if(userType == 0){
                    if(user.getUser_level_id() == 0){
                        HttpSession session = req.getSession();
                        session.setAttribute("user",user );
                        req.getRequestDispatcher("/admin/bookList").forward(req,resp);
                    }else{
                        HttpSession session = req.getSession();
                        resp.sendRedirect("403.jsp");
                        return;
                    }
                }
                if(userType == 1){
                    if(user.getUser_level_id() == 1){
                        HttpSession session = req.getSession();
                        session.setAttribute("user",user );
                        req.getRequestDispatcher("/index").forward(req,resp );
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
