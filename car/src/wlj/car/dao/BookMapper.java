package wlj.car.dao;

import wlj.car.bean.Book;

import java.util.List;

/**
 * @author LB
 * @create 2019-03-29 7:53
 */
public interface BookMapper {
    List<Book> bookList();
    List<Book> searchBook(String key);
    Book getBook(int bookId);
    int addBook(Book book);
    int deleteBook(int id);
    int updateBook(Book book);

}
