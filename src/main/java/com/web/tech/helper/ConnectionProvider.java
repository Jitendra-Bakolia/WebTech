package com.web.tech.helper;

import java.sql.*;

public class ConnectionProvider {
	private static Connection con;
	
	public static Connection getConnection() {
		
		try {
			/* load Driver */
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/webtech","root","0000");
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return con;
		
	}
}
