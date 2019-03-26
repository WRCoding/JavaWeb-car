package wlj.car.filter;

import wlj.car.bean.User;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author LB
 * @create 2019-03-09 16:37
 */
@WebFilter(filterName = "AllFilter",urlPatterns = {"/*"})
public class AllFilter implements Filter {
    @Override
    public void destroy() {
        System.out.println("过滤器销毁");
    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;
        request.setCharacterEncoding("utf-8");
        String url = request.getRequestURI();
        String path = url.substring(url.lastIndexOf("/")+1);
        String action = request.getParameter("action");
        //如果是登录页面和验证码图片的请求以及登录的请求时进行放行
        if("index.jsp".equals(path)||"login".equals(action)||"drawImage".equals(path)){
            request.setCharacterEncoding("utf-8");
            chain.doFilter(request, response);
            response.setContentType("text/html;charset=utf-8");
            return;
        }else {
            //如果没有用户说明无权限不给放行
            User user = (User) request.getSession().getAttribute("user");
            if(user != null){
                request.setCharacterEncoding("utf-8");
                chain.doFilter(request, response);
                response.setContentType("text/html;charset=utf-8");
            }else{
                request.setAttribute("message","无权限操作，请先登录!" );
                request.getRequestDispatcher("/index.jsp").forward(request,response );
            }

        }

    }

    @Override
    public void init(FilterConfig config) throws ServletException {
        System.out.println("过滤器初始化");
    }

}
