package com.web.tech.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.tech.dao.LikeDao;
import com.web.tech.helper.ConnectionProvider;

@WebServlet("/LikeServlet")
public class LikeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LikeServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		LikeDao ldao = new LikeDao(ConnectionProvider.getConnection());
		
		String opreation = request.getParameter("opreation");
		int uid = Integer.parseInt(request.getParameter("uid"));
		int pid = Integer.parseInt(request.getParameter("pid"));
		
		PrintWriter out = response.getWriter();
		
		if(opreation.equals("like")) {
			/*
			 * boolean f = ldao.insertLike(pid, uid); { out.println(f); }
			 */
			
			if(ldao.isLikeByUser(pid, uid)) {
				if(ldao.deleteLike(pid, uid)) {
					out.println("false");
				}
			} else {
				if(ldao.insertLike(pid, uid)) {
					out.println("true");
				}
			}
		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
