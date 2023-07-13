package com.web.tech.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.web.tech.dao.PostDao;
import com.web.tech.entities.Post;
import com.web.tech.entities.User;
import com.web.tech.helper.ConnectionProvider;
import com.web.tech.helper.FileData;

@MultipartConfig
@WebServlet("/AddPostServlet")
public class AddPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AddPostServlet() {
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
		int cid = Integer.parseInt(request.getParameter("cid"));

		String ptitle = request.getParameter("ptitle");
		String pcontent = request.getParameter("pcontent");
		String pcode = request.getParameter("pcode");

		Part part = request.getPart("ppic");
		String imgname = part.getSubmittedFileName();

		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("currentUser");
		
		if(imgname.isEmpty()) {
			imgname = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQCqY-g7jbJ7uHLEG_1mRM267QxikaYfYjcYg&usqp=CAU";
		}
		
		
		Post post = new Post(ptitle, pcontent, pcode, imgname, null, cid, user.getId());
		PostDao pd = new PostDao(ConnectionProvider.getConnection());

		if (pd.savePost(post)) {
			out.println("save");
			String Path = request.getRealPath("/") + "data" + File.separator + imgname;
			FileData.saveFile(part.getInputStream(), Path);
		} else {
			out.println("not-save");
		}

	}

}
