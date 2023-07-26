package com.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;

import com.DAO.UserDAO;
import com.db.DBConnect;
import com.user.UserDetails;

@SuppressWarnings("serial")
@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email=request.getParameter("uemail");
		String password=request.getParameter("upassword");
		
		UserDetails us=new UserDetails();
		us.setEmail(email);
		us.setPassword(password);
		
		UserDAO dao = null;
		try {
			dao = new UserDAO(DBConnect.getCon());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		boolean f=dao.loginUser(us);
		if(f) {
			response.sendRedirect("home.jsp");
		}else {
			HttpSession session=request.getSession();
			session.setAttribute("login-failed", "Invalid email or password");
			response.sendRedirect("login.jsp");
		}
	}

}
