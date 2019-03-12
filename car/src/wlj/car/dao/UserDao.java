package wlj.car.dao;

import wlj.car.DBUtil.DBUtil;
import wlj.car.bean.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * @author LB
 * @create 2019-03-09 16:55
 */
public class UserDao {
    public User login(String userName,String userPassword){
        Connection connection = DBUtil.getConnection();
        String sql = "select *from bookuser where user_name=? and user_password=?";
        User user = null;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1,userName);
            preparedStatement.setString(2,userPassword);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                user = new User();
                user.setUserId(resultSet.getInt(1));
                user.setUserLevelId(resultSet.getInt(2));
                user.setUserName(resultSet.getString(3));
                user.setUserPassword(resultSet.getString(4));
            }
            resultSet.close();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    public User checkUser(String userName) {
        Connection connection = DBUtil.getConnection();
        String sql = "select *from bookuser where user_name=?";
        User user = null;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1,userName);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                user = new User();
                user.setUserId(resultSet.getInt(1));
                user.setUserLevelId(resultSet.getInt(2));
                user.setUserName(resultSet.getString(3));
                user.setUserPassword(resultSet.getString(4));
            }
            resultSet.close();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    public boolean register(String userName, String userPassword, int userLevelId) {
        Connection connection = DBUtil.getConnection();
        String sql = "INSERT INTO bookuser(user_name,user_password,user_level_id) VALUES (?,?,?)";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1,userName );
            preparedStatement.setString(2,userPassword );
            preparedStatement.setInt(3,userLevelId );
            int count = preparedStatement.executeUpdate();
            preparedStatement.close();
            return count>0?true:false;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean updateUser(User user) {
        Connection connection = DBUtil.getConnection();
        String sql = "update bookuser set user_name=?,user_password=? where user_id=?";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1,user.getUserName() );
            preparedStatement.setString(2,user.getUserPassword());
            preparedStatement.setInt(3,user.getUserId());
            int count = preparedStatement.executeUpdate();
            return count>0?true:false;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
