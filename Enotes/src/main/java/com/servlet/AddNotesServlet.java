package com.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

import com.DAO.postDAO;
import com.db.DBConnect;
import com.user.post;

@WebServlet("/AddNotesServlet")
@SuppressWarnings("serial")
public class AddNotesServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int uid=Integer.parseInt(request.getParameter("uid"));
		String title=request.getParameter("title");
		String content=request.getParameter("tarea");
		
		postDAO dao = null;
		try {
			dao = new postDAO(DBConnect.getCon());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		boolean f=	dao.AddNotes(title,content,uid);
		if(f) {
			System.out.println("Data insert"+f);
		}else {
			System.out.println("failed insertion"+f);
		}
	}

}
