package wlj.car.bean;

/**
 * @author LB
 * @create 2019-03-09 16:21
 */
public class Book {
    private Integer bookId;  //编号
    private String bookName;  //书名
    private double bookSprice;  //价格
    private String bookAuthor;  //作者
    private Integer bookCount;  //数量

    public Integer getBookId() {
        return bookId;
    }

    public void setBookId(Integer bookId) {
        this.bookId = bookId;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public double getBookSprice() {
        return bookSprice;
    }

    public void setBookSprice(double bookSprice) {
        this.bookSprice = bookSprice;
    }

    public String getBookAuthor() {
        return bookAuthor;
    }

    public void setBookAuthor(String bookAuthor) {
        this.bookAuthor = bookAuthor;
    }

    public Integer getBookCount() {
        return bookCount;
    }

    public void setBookCount(Integer bookCount) {
        this.bookCount = bookCount;
    }
}
