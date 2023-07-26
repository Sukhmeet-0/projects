package com.servlet;

import java.io.IOException;
//import java.io.PrintWriter;
import java.sql.SQLException;

import com.DAO.UserDAO;
import com.db.DBConnect;
import com.user.UserDetails;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet{
	@Override
	public void doPost(HttpServletRequest req,HttpServletResponse res)throws ServletException, IOException {
		
		String name=req.getParameter("fname");
		String email=req.getParameter("uemail");
		String password=req.getParameter("upassword");
		
		UserDetails us=new UserDetails();
		us.setName(name);
		us.setEmail(email);
		us.setPassword(password);
		
		
		try {
			UserDAO dao=new UserDAO(DBConnect.getCon());
			boolean f=dao.addUser(us);
//			PrintWriter out=res.getWriter();
			HttpSession session;
			if(f) {
				session=req.getSession();
				session.setAttribute("reg-success", "Registration Successfull");
				res.sendRedirect("register.jsp");
//				out.print("User Registered successfully");
			}else {
				
				session=req.getSession();
				session.setAttribute("failed-msg", "Something went wrong on server !!");
				res.sendRedirect("register.jsp");
				
//				out.print("User not Registered!!");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
