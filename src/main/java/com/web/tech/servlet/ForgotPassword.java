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
import com.web.tech.helper.ConnectionProvider;


@WebServlet("/ForgotPassword")
public class ForgotPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ForgotPassword() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		
		
		String forgot_school_name = request.getParameter("forgot_school_name");
		String forgot_born = request.getParameter("forgot_born");
		String forgot_best_fr = request.getParameter("forgot_best_fr");
		
		SecurityDao sd = new SecurityDao(ConnectionProvider.getConnection());
		Security s = sd.getEmailAndPassword(forgot_school_name, forgot_born, forgot_best_fr);
		
		HttpSession session = request.getSession();
		
		if(s==null) {
			Msg msg = new Msg("Wrong answer","error","alert-danger");
			session.setAttribute("msg", msg);
			response.sendRedirect("login.jsp");
		} else {
			session.setAttribute("forgot", s);
			response.sendRedirect("EmailAndPassword.jsp");
		}
		
	}

}
