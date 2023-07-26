package com.db;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnect {
	private static Connection con;
	public static Connection getCon() throws SQLException {
		if(con==null) {
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				con=DriverManager.getConnection("jdbc:mysql://localhost:3306/enotes","root","root");
				
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
		}
		return con;
	}
}
