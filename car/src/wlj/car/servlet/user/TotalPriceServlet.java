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
 * @create 2019-03-12 7:33
 */
@WebServlet("/user/totalPrice")
public class TotalPriceServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Car> carList = (List<Car>) request.getSession().getAttribute("carList");
        double totalPrice = 0;
        if(carList == null){
            request.setAttribute("message","当前购物车没有商品" );
        }else{
            for (Car car : carList) {
                totalPrice += car.getBook().getBookSprice()*car.getNumber();
            }
        }
        request.setAttribute("totalPrice",totalPrice );
        request.getRequestDispatcher("/user/user-total.jsp").forward(request,response );
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response );
    }
}
