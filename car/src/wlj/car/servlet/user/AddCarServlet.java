package wlj.car.servlet.user;

import org.apache.ibatis.session.SqlSession;
import wlj.car.DBUtil.GetSqlSession;
import wlj.car.bean.Book;
import wlj.car.bean.Car;
import wlj.car.dao.BookMapper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * @author LB
 * @create 2019-03-10 17:45
 */
@WebServlet("/user/addCar")
public class AddCarServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int bookId = Integer.parseInt(request.getParameter("bookId"));
        int booknumber = Integer.parseInt(request.getParameter("number"));
        int pageNum = Integer.parseInt(request.getParameter("pageNum"));
        SqlSession sqlSession = GetSqlSession.getSqlSession();
        BookMapper bookMapper = sqlSession.getMapper(BookMapper.class);
        Book book = bookMapper.getBook(bookId);
        List<Car> carList = (List<Car>) request.getSession().getAttribute("carList");
        if(carList == null){
            carList = new ArrayList<>();
            Car car = new Car();
            car.setBook(book);
            car.setNumber(booknumber);
            carList.add(car);
        }else{
            boolean flag=false;
            for (Car car : carList) {
                if(car.getBook().getBookId().equals(bookId)){
                    car.setNumber(car.getNumber() + booknumber);
                    flag = true;
                }
            }
            if(!flag){
                Car car = new Car();
                car.setBook(book);
                car.setNumber(booknumber);
                carList.add(car);
            }
        }
        request.getSession().setAttribute("carList",carList );
        response.sendRedirect("/car/index?pageNum="+pageNum);


    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response );
    }
}
