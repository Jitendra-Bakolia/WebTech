package com.web.tech.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.web.tech.dao.PostDao;
import com.web.tech.dao.UserDao;
import com.web.tech.entities.Msg;
import com.web.tech.entities.User;
import com.web.tech.helper.ConnectionProvider;

@WebServlet("/DeletePost")
public class DeletePost extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DeletePost() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		PostDao dao = new PostDao(ConnectionProvider.getConnection());

		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("currentUser");
		HttpSession s = request.getSession();

		int pid = (Integer) session.getAttribute("delete_post");

		if (dao.deletePostByPostId(pid)) {
			Msg msg = new Msg("Post Deleted successfully", "success", "alert-success");
			s.setAttribute("editmsg", msg);
			response.sendRedirect("profile.jsp");

		} else {
			Msg msg = new Msg("Dao issue", "error", "alert-danger");
			s.setAttribute("editmsg", msg);
			response.sendRedirect("profile.jsp");
		}
	}
}
