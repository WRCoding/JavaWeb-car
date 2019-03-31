package wlj.car.DBUtil;

import org.apache.ibatis.session.SqlSession;
import wlj.car.bean.Book;
import wlj.car.bean.Page;
import wlj.car.dao.BookMapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author LB
 * @create 2019-03-30 17:33
 */
public class PageUser {
    public static Page getPageUser(int pageNum,int pageSize){
        SqlSession sqlSession = GetSqlSession.getSqlSession();
        BookMapper bookMapper = sqlSession.getMapper(BookMapper.class);
        int totalRecord = bookMapper.BookSize();

        Page page = new Page(pageNum,pageSize ,totalRecord );
        int startIndex = page.getStartIndex();
        Map<String,Integer> map = new HashMap<>();
        map.put("startIndex",startIndex );
        map.put("pageSize",pageSize );
        page.setBooklist(bookMapper.Books(map));
        return page;
    }
}
