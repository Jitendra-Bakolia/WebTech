package com.web.tech.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.web.tech.entities.User;

import jdk.jshell.spi.ExecutionControl.UserException;

public class UserDao {
	private Connection con;

	public UserDao(Connection con) {
		super();
		this.con = con;
	}

	public boolean saveUser(User user) {
		boolean f = false;

		try {
			PreparedStatement pstmt = con.prepareStatement(
					"insert into user(username,useremail,password,repassword,gender,about) values (?,?,?,?,?,?)");
			pstmt.setString(1, user.getUsername());
			pstmt.setString(2, user.getUseremail());
			pstmt.setString(3, user.getPassword());
			pstmt.setString(4, user.getRepassword());
			pstmt.setString(5, user.getGender());
			pstmt.setString(6, user.getAbout());
			pstmt.executeUpdate();
			f = true;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;

	}

	public User getUserUsingEmailAndPassword(String email, String userpassword) {
		User user = null;
		try {
			PreparedStatement pstmt = con.prepareStatement("select * from user where useremail = ? and password = ?");
			pstmt.setString(1, email);
			pstmt.setString(2, userpassword);

			ResultSet set = pstmt.executeQuery();

			if (set.next()) {
				user = new User();

				user.setId(set.getInt("id"));
				user.setUsername(set.getString("username"));
				user.setUseremail(set.getString("useremail"));
				user.setPassword(set.getString("password"));
				user.setRepassword(set.getString("repassword"));
				user.setGender(set.getString("gender"));
				user.setAbout(set.getString("about"));
				user.setImgname(set.getString("imgname"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return user;
	}

	public boolean updateUser(User user) {
		boolean f = false;
		try {
			PreparedStatement pstmt = con.prepareStatement(
					"update user set username=? , useremail=? , password=?, repassword=? , gender=? , about=? , imgname=? where id=?");
			pstmt.setString(1, user.getUsername());
			pstmt.setString(2, user.getUseremail());
			pstmt.setString(3, user.getPassword());
			pstmt.setString(4, user.getRepassword());
			pstmt.setString(5, user.getGender());
			pstmt.setString(6, user.getAbout());
			pstmt.setString(7, user.getImgname());
			pstmt.setInt(8, user.getId());

			pstmt.executeUpdate();
			f = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public boolean deleteUser(int id) {
		boolean f = false;
		try {
			PreparedStatement pstmt = con.prepareStatement("delete from user where id=?");
			pstmt.setInt(1, id);

			pstmt.executeUpdate();
			f = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public User getUserByUserId(int uid) {
		User user = null;

		try {
			PreparedStatement pstmt = con.prepareStatement("select * from user where id = ?;");
			pstmt.setInt(1, uid);
			ResultSet set = pstmt.executeQuery();

			if (set.next()) {
				int id = set.getInt("id");
				String username = set.getString("username");
				String useremail = set.getString("useremail");
				String password = set.getString("password");
				String repassword = set.getString("repassword");
				String gender = set.getString("gender");
				String about = set.getString("about");
				String imgname = set.getString("imgname");

				user = new User(id, username, useremail, password, repassword, gender, about, imgname);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return user;
	}

}
