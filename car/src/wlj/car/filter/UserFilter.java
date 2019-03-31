package wlj.car.filter;

import wlj.car.bean.User;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class UserFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        System.out.println("初始化用户拦截器");
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");  //获取当前用户
        if (user != null && user.getUser_level_id() == 1) {  //检查currentUser判断是否登录且是否为用户
            filterChain.doFilter(servletRequest, servletResponse);  //用户已登录，则放行
            return;
        } else {
            request.getRequestDispatcher("/index.jsp").forward(request,response );  //未登录或者没有权限进行操作
            return;
        }
    }

    @Override
    public void destroy() {
        System.out.println("销毁用户拦截器");
    }
}
