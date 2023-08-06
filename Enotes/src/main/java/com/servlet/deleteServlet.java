package com.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;

import com.DAO.postDAO;
import com.db.DBConnect;


@SuppressWarnings("serial")
@WebServlet("/deleteServlet")
public class deleteServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Integer noteid=Integer.parseInt(request.getParameter("note_id"));
		postDAO dao;
		try {
			dao = new postDAO(DBConnect.getCon());
			boolean f=dao.deleteNotes(noteid);
			HttpSession session=null;
			if(f) {
				session=request.getSession();
				session.setAttribute("DeleteMsg", "Notes Deleted Successfully");
				response.sendRedirect("showNotes.jsp");
			}else {
				session=request.getSession();
				session.setAttribute("WrongMsg", "Something went wrong in server!!");
				response.sendRedirect("showNotes.jsp");
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
