package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;

//import com.user.UserDetails;

public class postDAO {
	private Connection con;

	public postDAO(Connection con) {
		super();
		this.con = con;
	}
	public boolean AddNotes(String ti,String co,int ui) {
		
		boolean f=false;
		try {
			String qu="insert into post(title,content,uid)values(?,?,?)";
			PreparedStatement ps=con.prepareStatement(qu);
			ps.setString(1, ti);
			ps.setString(2, co);
			ps.setInt(3, ui);
			int i=ps.executeUpdate();
			if(i==1) {
				f=true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return f;
	}
}
