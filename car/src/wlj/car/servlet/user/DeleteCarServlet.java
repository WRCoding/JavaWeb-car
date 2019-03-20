package wlj.car.servlet.user;

import wlj.car.bean.Car;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * @author LB
 * @create 2019-03-11 10:51
 */
@WebServlet("/user/deleteCar")
public class DeleteCarServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int bookId = Integer.parseInt(request.getParameter("bookId"));
        List<Car> carList = (List<Car>) request.getSession().getAttribute("carList");
        for(int i = 0;i<carList.size();i++){
            if(carList.get(i).getBook().getBookId().equals(bookId)){
                carList.remove(i);
            }
        }
        response.sendRedirect("user-cart.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response );
    }
}
