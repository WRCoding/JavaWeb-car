package wlj.car.dao;

import com.mysql.cj.protocol.Resultset;
import wlj.car.DBUtil.DBUtil;
import wlj.car.bean.Book;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * @author LB
 * @create 2019-03-09 20:58
 */
public class BookDao {
    public List<Book> bookList(){
        Connection connection = DBUtil.getConnection();
        String sql = "select *from book";
        List<Book> list = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                Book book = new Book();
                book.setBookId(resultSet.getInt(1));
                book.setBookName(resultSet.getString(2));
                book.setBookSprice(resultSet.getDouble(3));
                book.setBookAuthor(resultSet.getString(4));
                book.setBookCount(resultSet.getInt(5));
                list.add(book);
            }
            resultSet.close();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Book> searchBook(String key) {
        Connection connection = DBUtil.getConnection();
        String sql = "select *from book where book_name like '%" + key + "%'";
        List<Book> list = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                Book book = new Book();
                book.setBookId(resultSet.getInt(1));
                book.setBookName(resultSet.getString(2));
                book.setBookSprice(resultSet.getDouble(3));
                book.setBookAuthor(resultSet.getString(4));
                book.setBookCount(resultSet.getInt(5));
                list.add(book);
            }
            resultSet.close();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public Book getBook(int bookId) {
        Connection connection = DBUtil.getConnection();
        String sql = "select *from book where book_id=?";
        Book book = new Book();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1,bookId );
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                book.setBookId(resultSet.getInt(1));
                book.setBookName(resultSet.getString(2));
                book.setBookSprice(resultSet.getDouble(3));
                book.setBookAuthor(resultSet.getString(4));
                book.setBookCount(resultSet.getInt(5));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return book;
    }

    public boolean addBook(Book book) {
        Connection connection = DBUtil.getConnection();
        String sql = "insert into book (book_name,book_sprice,book_author,book_count) values(?,?,?,?)";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1,book.getBookName() );
            preparedStatement.setDouble(2,book.getBookSprice() );
            preparedStatement.setString(3,book.getBookAuthor() );
            preparedStatement.setInt(4,book.getBookCount() );
            int count = preparedStatement.executeUpdate();
            return count>0?true:false;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean deleteBook(int id) {
        Connection connection = DBUtil.getConnection();
        String sql = "delete from book where book_id = ?";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1,id );
            int count = preparedStatement.executeUpdate();
            return count>0?true:false;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean updateBook(Book book) {
        Connection connection = DBUtil.getConnection();
        String sql = "update book set book_name=?,book_sprice=?,book_author=?,book_count=? where book_id=?";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1,book.getBookName() );
            preparedStatement.setDouble(2,book.getBookSprice() );
            preparedStatement.setString(3,book.getBookAuthor() );
            preparedStatement.setInt(4,book.getBookCount() );
            preparedStatement.setInt(5,book.getBookId() );
            int count = preparedStatement.executeUpdate();
            return count>0?true:false;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
