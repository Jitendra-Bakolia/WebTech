package com.web.tech.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.web.tech.entities.Msg;
import com.web.tech.entities.User;

@WebServlet("/Sequrity_login")
public class Sequrity_login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Sequrity_login() {
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

		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("currentUser");

		String sequrityEmail = request.getParameter("security_email");
		String sequrityPassword = request.getParameter("security_password");

		if (user.getUseremail().equals(sequrityEmail) && user.getPassword().equals(sequrityPassword)) {
			response.sendRedirect("sequrity.jsp");
		} else {
			Msg msg = new Msg("Email and Password incorrect", "error", "alert-danger");
			session.setAttribute("editmsg", msg);
			response.sendRedirect("profile.jsp");
		}
		

	}

}
