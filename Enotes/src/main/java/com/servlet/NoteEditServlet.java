package com.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.DAO.postDAO;
import com.db.DBConnect;


@SuppressWarnings("serial")
@WebServlet("/NoteEditServlet")
public class NoteEditServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		try {
			Integer noteid=Integer.parseInt(request.getParameter("noteid"));
			String title=request.getParameter("title");
			String content=request.getParameter("tarea");
			postDAO dao=new postDAO(DBConnect.getCon());
			boolean f=dao.PostUpdate(noteid, title, content);
			if(f) {
				System.out.println("data update successfull");
				HttpSession session=request.getSession();
				session.setAttribute("updateMsg", "Notes updated successfully");
				response.sendRedirect("showNotes.jsp");
				
			}else {
				System.out.println("Not successfull");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

}
