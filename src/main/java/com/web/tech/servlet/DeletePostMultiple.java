package com.web.tech.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.web.tech.dao.PostDao;
import com.web.tech.entities.Msg;
import com.web.tech.entities.User;
import com.web.tech.helper.ConnectionProvider;

@WebServlet("/DeletePostMultiple")
public class DeletePostMultiple extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DeletePostMultiple() {
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

		String one = request.getParameter("deleteone");
		
		if (one != null) {

			int deleteone = Integer.parseInt(request.getParameter("deleteone"));

			if (dao.deletePostByPostId(deleteone)) {
				Msg msg = new Msg("Post Deleted successfully", "success", "alert-success");
				s.setAttribute("editmsg", msg);
				response.sendRedirect("delete_multiple_posts.jsp");

			} else {
				Msg msg = new Msg("Dao issue", "error", "alert-danger");
				s.setAttribute("editmsg", msg);
				response.sendRedirect("profile.jsp");
			}
		} else {
			out.println("SORRY ! it's not working now ");
		}
		
		

	}
}
