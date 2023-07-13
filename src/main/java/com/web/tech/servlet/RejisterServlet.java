package com.web.tech.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.tech.dao.UserDao;
import com.web.tech.entities.User;
import com.web.tech.helper.ConnectionProvider;

@MultipartConfig
@WebServlet({ "/RegisterServlet", "/registerservlet", "/register", "/Register", "/RejisterServlet" })

public class RejisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RejisterServlet() {
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

		String username = request.getParameter("username");
		String useremail = request.getParameter("useremail");
		String password = request.getParameter("password");
		String repassword = request.getParameter("repassword");
		String gender = request.getParameter("gender");
		String about = request.getParameter("about");
		String check = request.getParameter("check");

		User user = new User(username, useremail, password, repassword, gender, about);
		
		System.out.println("\n\n\n\n\n Its user : "+user+"\n\n\n\n\n\n\n");

		UserDao dao = new UserDao(ConnectionProvider.getConnection());

		if (username.isBlank()) {
			out.println("UserName");
		} else {
			if (useremail.isBlank()) {
				out.println("UserEmail");
			} else {
				if (password.isBlank()) {
					out.println("pass");
				} else {
					if (repassword.isBlank()) {
						out.println("RePass");
					} else {
						if (gender == null) {
							out.println("Gen");
						} else {
							if (check == null) {
								out.println("tdc");
							} else {
								if (password.equals(repassword)) {
									if (dao.saveUser(user)) {
										out.println("done");
									} else {
										out.println("Duplicate");
									}
								} else {
									out.println("pmbs");
								}
							}
						}
					}
				}
			}
		}

	}

}
