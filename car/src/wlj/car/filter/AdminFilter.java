package wlj.car.filter;

import wlj.car.bean.User;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


public class AdminFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        System.out.println("初始化管理员拦截器");
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");  //获取当前用户
        if (user != null && user.getUserLevelId() == 0) {  //检查currentUser判断是否登录且是否为管理员
            filterChain.doFilter(servletRequest, servletResponse);  //管理员已登录，放行
        } else {
            response.sendRedirect("403.jsp");  //未登录或者没有权限进行操作
        }
    }

    @Override
    public void destroy() {
        System.out.println("销毁管理员拦截器");
    }
}
