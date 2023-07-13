package com.web.tech.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LikeDao {
	Connection con;

	public LikeDao(Connection con) {
		super();
		this.con = con;
	}

	public boolean insertLike(int pid, int uid) {
		boolean f = false;

		try {
			PreparedStatement pstmt = con.prepareStatement("insert into likes(pid,uid) values (?,?)");
			pstmt.setInt(1, pid);
			pstmt.setInt(2, uid);
			pstmt.executeUpdate();

			f = true;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public int countLikesOnPost(int pid) {
		int count = 0;

		try {
			PreparedStatement pstmt = con.prepareStatement("select count(*) from likes where pid=?");
			pstmt.setInt(1, pid);

			ResultSet set = pstmt.executeQuery();

			if (set.next()) {
				count = set.getInt("count(*)");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return count;

	}

	public boolean isLikeByUser(int pid, int uid) {
		boolean f = false;

		try {
			PreparedStatement pstmt = con.prepareStatement("select * from likes where pid=? and uid=?");
			pstmt.setInt(1, pid);
			pstmt.setInt(2, uid);
			ResultSet set = pstmt.executeQuery();

			if (set.next()) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;

	}

	public boolean deleteLike(int pid, int uid) {
		boolean f = false;

		try {
			PreparedStatement pstmt = con.prepareStatement("delete from likes where pid=? and uid=?");
			pstmt.setInt(1, pid);
			pstmt.setInt(2, uid);
			pstmt.executeUpdate();
			f=true;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

}
