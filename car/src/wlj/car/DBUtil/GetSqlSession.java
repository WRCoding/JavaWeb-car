package wlj.car.DBUtil;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.Reader;

/**
 * @author LB
 * @create 2019-03-29 7:30
 */
public class GetSqlSession {
    static String resources = "mybatis-config.xml";
    //读取配置文件
    static Reader  reader = null;
    public static SqlSession getSqlSession(){
        try {
            reader = Resources.getResourceAsReader(resources);
            //创建会话工厂
            SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
            //创建sqlsession
            SqlSession sqlSession = sqlSessionFactory.openSession();
            return sqlSession;
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }
}
