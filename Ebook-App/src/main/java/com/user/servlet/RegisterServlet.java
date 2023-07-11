package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDaoImpl;
import com.DB.DBConnect;
import com.entity.User;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String name = req.getParameter("fname");
			String email = req.getParameter("email");
			String phone = req.getParameter("phone");
			String password = req.getParameter("password");
			String check = req.getParameter("check");
			System.out.println(name + email + phone + password + check);
			User us = new User();
			us.setName(name);
			us.setEmail(email);
			us.setPhone(phone);
			us.setPassword(password);
			// Ta phải tạo thư mục lid thêm thư viện mysql-connection trong web-inf nếu
			// không sẽ lỗi
			HttpSession session = req.getSession();
			if (check != null) {
				UserDaoImpl dao = new UserDaoImpl(DBConnect.getConnection());
				
				boolean f2= dao.checkUser(email);
				if(f2) {
					boolean f = dao.userRegister(us);
					if(f) {
						session.setAttribute("succMsg","Registration Succesfully");
						resp.sendRedirect("register.jsp");
					}else {
						session.setAttribute("failedMsg","Registration Succesfully");
						resp.sendRedirect("register.jsp");
					}
				}else {
					session.setAttribute("failedMsg","User Already Exist Try Another Email id");
					resp.sendRedirect("register.jsp");
				}
			}
			else {	
				UserDaoImpl dao = new UserDaoImpl(DBConnect.getConnection());
				boolean f = dao.userRegister(us);
				if (f) {
//					System.out.println("user register success");
					
					session.setAttribute("succMsg", "Registration Successfully");
					resp.sendRedirect("register.jsp");
				} else {
					session.setAttribute("failedMsg", "Something wrong on server");
					resp.sendRedirect("register.jsp");
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
