package com.web.tech.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.web.tech.entities.Deleteduser;

public class DeletedUserDao {
	Connection con;

	public DeletedUserDao(Connection con) {
		super();
		this.con = con;
	}

	public boolean setDeleteUserName(String username, String useremail) {
		boolean f = false;

		try {

			PreparedStatement pstmt = con.prepareStatement("insert into deleteduser (username,useremail) value (?,?);");
			pstmt.setString(1, username);
			pstmt.setString(2, useremail);
			pstmt.executeUpdate();
			f = true;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public int getDeletedCount() {
		int c = 0;

		try {

			PreparedStatement pstmt = con.prepareStatement("select count(*) from deleteduser");
			ResultSet set = pstmt.executeQuery();

			if (set.next()) {
				c = set.getInt("count(*)");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return c;
	}

	public Deleteduser getDeletedUserInfo(int did) {
		Deleteduser du = new Deleteduser();

		try {

			PreparedStatement pstmt = con.prepareStatement("select * from deleteduser where did = ?");
			pstmt.setInt(1, did);
			ResultSet set = pstmt.executeQuery();

			if (set.next()) {

				du.setUsername(set.getString("username"));
				du.setUseremail(set.getString("useremail"));

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return du;
	}

}
