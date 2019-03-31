package wlj.car.servlet.admin;


import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;
import jxl.read.biff.BiffException;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import wlj.car.DBUtil.DBUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.List;

/**
 * 读取excel文件
 */
@WebServlet("/admin/importExcel")
public class ImportExcelServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/admin/manage-book-import.jsp").forward(req, resp);
    }

    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        Connection conn = DBUtil.getConnection();
        FileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);
        try {
            List items = upload.parseRequest(req);
            InputStream is = null;
            Iterator iter = items.iterator();
            while (iter.hasNext()) {
                FileItem item = (FileItem) iter.next();
                if (!item.isFormField()) {
                    is = item.getInputStream();
                }
            }
            //判断其兼容版本 调用了判断版本的方法
            Workbook workbook = Workbook.getWorkbook(is);
            Sheet sheet = workbook.getSheet(0);//获得第一个工作表对象
            // 获得行数
            int rows = sheet.getRows();
            // 获得列数
            int columns = sheet.getColumns();

            PreparedStatement ps = conn.prepareStatement("INSERT INTO book(bookName,bookSprice,bookAuthor,bookCount) VALUES (?,?,?,?)");

            for (int i = 0; i < rows; i++) {
                if (i == 0) {  // 第一行是属性，不读取
                    continue;
                }
                //得到第一列，第i行的单元格，下同
                Cell ce0 = sheet.getCell(0, i);
                Cell ce1 = sheet.getCell(1, i);
                Cell ce2 = sheet.getCell(2, i);
                Cell ce3 = sheet.getCell(3, i);

                //获得对应单元格的内容
                String c0 = ce0.getContents();
                String c1 = ce1.getContents();
                String c2 = ce2.getContents();
                String c3 = ce3.getContents();

                ps.setString(1, c0);
                ps.setString(2, c1);
                ps.setString(3, c2);
                ps.setString(4, c3);
                ps.execute();
            }
            ps.close();
            req.setAttribute("message", "导入成功");
            req.getRequestDispatcher("/admin/manage-book-import.jsp").forward(req, resp);
        } catch (FileUploadException e) {
            e.printStackTrace();
        } catch (BiffException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
