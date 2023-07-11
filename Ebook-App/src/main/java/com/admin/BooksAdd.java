package com.admin;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.DAO.BookDaoImpl;
import com.DB.DBConnect;
import com.entity.BookDtls;
@WebServlet("/add_books")
@MultipartConfig 
//Vị trí này được sử dụng để lưu trữ tệp tạm thời trong khi các bộ phận được xử lý hoặc khi kích thước của tệp vượt quá cài đặt fileSizeThreshold đã chỉ định
public class BooksAdd extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String bookName=req.getParameter("bname");
			String author=req.getParameter("author");
			String price=req.getParameter("price");
			String categories=req.getParameter("bcategories");
			String status=req.getParameter("bstatus");
			Part part=req.getPart("bimg");
			String fileName=part.getSubmittedFileName();
			
			BookDtls b=new BookDtls(bookName,author,price,categories,status,fileName,"admin");
			System.out.println(b);
			
			BookDaoImpl dao = new BookDaoImpl(DBConnect.getConnection());
			
			
			boolean f = dao.addBooks(b);
			
			HttpSession session = req.getSession();
			
			if(f) {
				String path = getServletContext().getRealPath("")+"book";			
				File file = new File(path);
				part.write(path + File.separator +fileName);			
				session.setAttribute("succMsg", "Book add Successfully");
				resp.sendRedirect("admin/add_books.jsp");
			}
			else {
				session.setAttribute("failedMsg", "Something wrong on Server");
				resp.sendRedirect("admin/add_books.jsp");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
