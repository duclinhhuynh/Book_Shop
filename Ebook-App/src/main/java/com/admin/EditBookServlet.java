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

@WebServlet("/edit_books")
@MultipartConfig 
public class EditBookServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(req.getParameter("id"));
			String bookName = req.getParameter("bname");
			String author = req.getParameter("author");
			String price = req.getParameter("price");
			String categories = req.getParameter("categories");
			String status = req.getParameter("status");
			Part part = req.getPart("bimg");
			String fileName=part.getSubmittedFileName();
			System.out.println(bookName  + author + price + categories + status+fileName);
			
			BookDtls b = new BookDtls();
			b.setBookId(id);
			b.setBookName(bookName);
			b.setAuthor(author);
			b.setPrice(price);
			b.setBookCategory(categories);
			b.setStatus(status);
			b.setPhotoName(fileName);
			System.out.println(b);
			
			BookDaoImpl dao = new BookDaoImpl(DBConnect.getConnection());
			boolean f = dao.updateEditBooks(b);
			HttpSession session =req.getSession();		
			if(f) {
				String uploadPath = getServletContext().getRealPath("")+"book/";
				part.write(uploadPath + File.separator +fileName);
				session.setAttribute("succMsg", "Book Update Successfully...");
				resp.sendRedirect("admin/all_books.jsp");
			}
			else {
				session.setAttribute("failedMsg", "Something wrong on server");
				resp.sendRedirect("admin/all_books.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
