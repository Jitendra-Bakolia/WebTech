package com.web.tech.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.web.tech.dao.UserDao;
import com.web.tech.entities.Msg;
import com.web.tech.entities.User;
import com.web.tech.helper.ConnectionProvider;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();

		String email = request.getParameter("email");
		String password = request.getParameter("userpassword");
		String check = request.getParameter("condution");
		
		if(check == null) {
			Msg m = new Msg("Accept terms and conditions", "warning", "alert-warning");
			HttpSession s = request.getSession();
			s.setAttribute("msg", m);
			response.sendRedirect("login.jsp");
		} else {
			UserDao dao = new UserDao(ConnectionProvider.getConnection());
			User u = dao.getUserUsingEmailAndPassword(email, password);
			
			if(u==null) {
				Msg msg = new Msg("Invalid Details ! try with another", "error", "alert-danger");
				HttpSession session = request.getSession();
				session.setAttribute("msg", msg);
				response.sendRedirect("login.jsp");
			} else {
				HttpSession session = request.getSession();
				session.setAttribute("currentUser", u);
				response.sendRedirect("profile.jsp");
			}
			
		}
	}

}
