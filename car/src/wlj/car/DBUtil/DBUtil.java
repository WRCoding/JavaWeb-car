package wlj.car.DBUtil;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 * @author LB
 * @create 2019-03-09 16:28
 */
public class DBUtil {
    private static final String URL="jdbc:mysql://localhost:3306/loginweb?serverTimezone=GMT%2B8";
    private static final String USER="root";
    private static final String KEY="1001101";
    private static Connection conn = null;

    /**
     * 连接数据库
     * @return
     */
    public static Connection getConnection(){
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn= DriverManager.getConnection(URL, USER, KEY);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }

    /**
     * 测试数据库是否连接
     * @param args
     */
    public static void main(String[] args) {
        System.err.println(getConnection());
    }
}
