package com.web.tech.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.web.tech.dao.DeletedUserDao;
import com.web.tech.dao.PostDao;
import com.web.tech.dao.UserDao;
import com.web.tech.entities.Msg;
import com.web.tech.entities.User;
import com.web.tech.helper.ConnectionProvider;

@WebServlet("/DeleteUser")
public class DeleteUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DeleteUser() {
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

		String email = request.getParameter("real_useremail");
		String password = request.getParameter("real_password");

		PostDao pd = new PostDao(ConnectionProvider.getConnection());
		DeletedUserDao dud = new DeletedUserDao(ConnectionProvider.getConnection());

		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("currentUser");

		UserDao dao = new UserDao(ConnectionProvider.getConnection());

		if (email.equals(user.getUseremail())) {
			if (password.equals(user.getPassword())) {
				if (pd.deleteAllUserPost(user.getId())) {
					if (dud.setDeleteUserName(user.getUsername(), user.getUseremail())) {
						if (dao.deleteUser(user.getId())) {
							Msg msg = new Msg("Account Deleted", "success", "alert-success");
							session.setAttribute("msg", msg);
							response.sendRedirect("login.jsp");
						}
					}
				}
			} else {
				Msg msg = new Msg("Wrong Password", "error", "alert-danger");
				session.setAttribute("editmsg", msg);
				response.sendRedirect("profile.jsp");
			}
		} else {
			Msg msg = new Msg("Wrong Email", "error", "alert-danger");
			session.setAttribute("editmsg", msg);
			response.sendRedirect("profile.jsp");
		}

	}

}
