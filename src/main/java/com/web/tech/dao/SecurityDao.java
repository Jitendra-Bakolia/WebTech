package com.web.tech.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.web.tech.entities.Security;

public class SecurityDao {
	Connection con;

	public SecurityDao(Connection con) {
		super();
		this.con = con;
	}

	public boolean insertSecurity(Security s) {
		boolean f = false;
		
		try {
			PreparedStatement pstmt = con.prepareStatement("insert into security(first_school_name,born,fev_fr,email,password) values (?,?,?,?,?)");
			pstmt.setString(1, s.getFirst_school_name());
			pstmt.setString(2, s.getBorn());
			pstmt.setString(3, s.getFev_fr());
			pstmt.setString(4, s.getEmail());
			pstmt.setString(5, s.getPassword());
			
			pstmt.executeUpdate();
			f=true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	
	public Security getSecurity(String email) {
		Security s = null;
		
		try {
			PreparedStatement pstmt = con.prepareStatement("select * from security where email = ?");
			pstmt.setString(1, email);
			
			ResultSet set = pstmt.executeQuery();
			
			if(set.next()) {
				
				int sid = set.getInt("sid");
				String school = set.getString("first_school_name");
				String born = set.getString("born");
				String fr = set.getString("fev_fr");
				String useremail = set.getString("email");
				String pass = set.getString("password");
				
				s = new Security(sid, school, born, fr, useremail, pass);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return s;
		
	}
	
	public boolean deleteSecurity(int sid) {
		boolean f = false;
		
		try {
			PreparedStatement pstmt = con.prepareStatement("delete from security where sid=?");
			pstmt.setInt(1, sid);
			pstmt.executeUpdate();
			f = true;
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	
	public Security getEmailAndPassword(String school_name , String born , String fev_fr) {
		Security s = null;
		
		try {
			
			PreparedStatement pstmt = con.prepareStatement("select * from security where first_school_name = ? and born = ? and fev_fr = ?");
			pstmt.setString(1, school_name);
			pstmt.setString(2, born);
			pstmt.setString(3, fev_fr);
			
			ResultSet set = pstmt.executeQuery();
			
			if(set.next()) {
				int sid = set.getInt("sid");
				String useremail = set.getString("email");
				String pass = set.getString("password");
				
				s=new Security(sid, school_name, born, fev_fr, useremail, pass);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return s;
	}
	
}
