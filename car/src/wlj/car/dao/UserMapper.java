package wlj.car.dao;

import wlj.car.bean.User;

import java.util.Map;

/**
 * @author LB
 * @create 2019-03-28 14:28
 */
public interface UserMapper {
     User login(Map<String,Object> map);
     User checkUser(String user_name);
     void register(Map<String,Object> map);
     int updateUser(User user);
}
