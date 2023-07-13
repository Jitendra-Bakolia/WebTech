package com.web.tech.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.web.tech.dao.SecurityDao;
import com.web.tech.entities.Msg;
import com.web.tech.entities.Security;
import com.web.tech.entities.User;
import com.web.tech.helper.ConnectionProvider;

@WebServlet("/Security_Que")
public class Security_Que extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Security_Que() {
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

		SecurityDao sd = new SecurityDao(ConnectionProvider.getConnection());
		Security s = sd.getSecurity(user.getUseremail());

		String school_name = request.getParameter("school_name");
		String born = request.getParameter("born");
		String fr = request.getParameter("best_fr");

		if (s == null) {
			s = new Security(school_name, born, fr, user.getUseremail(), user.getPassword());
			if (sd.insertSecurity(s)) {
				Msg msg = new Msg("Congratulation security questions are set successfully", "success", "alert-success");
				session.setAttribute("security", msg);
				response.sendRedirect("sequrity.jsp");
			} else {
				Msg msg = new Msg("Error", "error", "alert-danger");
				session.setAttribute("security", msg);
				response.sendRedirect("sequrity.jsp");
			}

		} else {

			if (sd.deleteSecurity(s.getSid())) {

				Security ss = new Security(school_name, born, fr, user.getUseremail(), user.getPassword());

				if (sd.insertSecurity(ss)) {
					Msg msg = new Msg("Congratulation security questions's are update successfully", "success",
							"alert-success");
					session.setAttribute("security", msg);
					response.sendRedirect("sequrity.jsp");
				} else {
					Msg msg = new Msg("data not update", "errror", "alert-danger");
					session.setAttribute("security", msg);
					response.sendRedirect("sequrity.jsp");
				}

			} else {
				Msg msg = new Msg("data not deleted", "errror", "alert-danger");
				session.setAttribute("security", msg);
				response.sendRedirect("sequrity.jsp");
			}

			out.println("s : " + school_name + "\nb : " + born + "\nfr : " + fr + "\nemail : " + user.getUseremail()
					+ "\npass : " + user.getPassword() + "\nid : " + s.getSid());
		}

	}

}
