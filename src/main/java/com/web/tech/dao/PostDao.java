package com.web.tech.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.web.tech.entities.Category;
import com.web.tech.entities.Post;

public class PostDao {
	Connection con;

	public PostDao(Connection con) {
		super();
		this.con = con;
	}

	public ArrayList<Category> getAllCategories() {
		ArrayList<Category> list = new ArrayList<>();

		try {
			PreparedStatement pstmt = con.prepareStatement("select * from categories");
			ResultSet set = pstmt.executeQuery();

			while (set.next()) {
				int cid = set.getInt("cid");
				String name = set.getString("name");
				String category = set.getString("discription");

				Category cat = new Category(cid, name, category);
				list.add(cat);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public Category getCategoriesInfo(String catname) {
		Category cat = null;

		try {
			PreparedStatement pstmt = con.prepareStatement("select * from categories where name=?");
			pstmt.setString(1, catname);

			ResultSet set = pstmt.executeQuery();

			if (set.next()) {
				int cid = set.getInt("cid");
				String name = set.getString("name");
				String discription = set.getString("discription");

				cat = new Category(cid, name, discription);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return cat;
	}

	public boolean savePost(Post p) {
		boolean f = false;

		try {
			PreparedStatement pstmt = con
					.prepareStatement("insert into posts(title,pcontent,pcode,ppic,catid,userid) values (?,?,?,?,?,?)");
			pstmt.setString(1, p.getTitle());
			pstmt.setString(2, p.getPcontent());
			pstmt.setString(3, p.getPcode());
			pstmt.setString(4, p.getPpic());
			pstmt.setInt(5, p.getCatid());
			pstmt.setInt(6, p.getUserid());

			pstmt.executeUpdate();
			f = true;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;

	}

	public List<Post> getAllPost() {
		List<Post> list = new ArrayList<>();

		try {
			PreparedStatement pstmt = con.prepareStatement("select * from posts order by pid desc");
			ResultSet set = pstmt.executeQuery();

			while (set.next()) {
				int pid = set.getInt("pid");
				String title = set.getString("title");
				String pcontent = set.getString("pcontent");
				String pcode = set.getString("pcode");
				String ppic = set.getString("ppic");
				Timestamp pdate = set.getTimestamp("pdate");
				int catid = set.getInt("catid");
				int userid = set.getInt("userid");

				Post p = new Post(pid, title, pcontent, pcode, ppic, pdate, catid, userid);

				list.add(p);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public List<Post> getPostByCatId(int catid) {
		List<Post> list = new ArrayList<>();

		try {
			PreparedStatement pstmt = con.prepareStatement("select * from posts where catid=?");
			pstmt.setInt(1, catid);
			ResultSet set = pstmt.executeQuery();

			while (set.next()) {
				int pid = set.getInt("pid");
				String title = set.getString("title");
				String pcontent = set.getString("pcontent");
				String pcode = set.getString("pcode");
				String ppic = set.getString("ppic");
				Timestamp pdate = set.getTimestamp("pdate");
				int userid = set.getInt("userid");

				Post p = new Post(pid, title, pcontent, pcode, ppic, pdate, catid, userid);

				list.add(p);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public List<Post> getAllPostByUserId(int uid) {
		List<Post> list = new ArrayList<>();

		try {
			PreparedStatement pstmt = con.prepareStatement("select * from posts where userid=?");
			pstmt.setInt(1, uid);

			ResultSet set = pstmt.executeQuery();

			while (set.next()) {
				int pid = set.getInt("pid");
				String title = set.getString("title");
				String pcontent = set.getString("pcontent");
				String pcode = set.getString("pcode");
				String ppic = set.getString("ppic");
				Timestamp pdate = set.getTimestamp("pdate");
				int catid = set.getInt("catid");

				Post p = new Post(pid, title, pcontent, pcode, ppic, pdate, catid, uid);

				list.add(p);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public Post getPostByPostId(int postid) {
		Post p = null;

		try {
			PreparedStatement pstmt = con.prepareStatement("select * from posts where pid=?");
			pstmt.setInt(1, postid);

			ResultSet set = pstmt.executeQuery();
			if (set.next()) {
				int pid = set.getInt("pid");
				String title = set.getString("title");
				String pcontent = set.getString("pcontent");
				String pcode = set.getString("pcode");
				String ppic = set.getString("ppic");
				int catid = set.getInt("catid");
				Timestamp pdate = set.getTimestamp("pdate");
				int userid = set.getInt("userid");

				p = new Post(pid, title, pcontent, pcode, ppic, pdate, catid, userid);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return p;
	}

	public boolean deletePostByPostId(int pid) {
		boolean f = false;

		try {
			PreparedStatement pstmt = con.prepareStatement("delete from posts where pid=?");
			pstmt.setInt(1, pid);
			pstmt.executeUpdate();
			f = true;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public boolean deleteAllUserPost(int uid) {
		boolean f = false;
			
		try {
			
			PreparedStatement pstmt = con.prepareStatement("delete from posts where userid=?");
			pstmt.setInt(1, uid);
			
			pstmt.executeUpdate();
			f=true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}

}
