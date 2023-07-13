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

import com.web.tech.dao.UserDao;
import com.web.tech.entities.Msg;
import com.web.tech.entities.User;
import com.web.tech.helper.ConnectionProvider;
import com.web.tech.helper.FileData;

@MultipartConfig
@WebServlet("/EditServlet")
public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public EditServlet() {
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

		String name = request.getParameter("edit_username");
		String email = request.getParameter("edit_useremail");
		String about = request.getParameter("edit_about");
		String password = request.getParameter("edit_password");
		String repassword = request.getParameter("edit_repassword");
		String oldpassword = request.getParameter("edit_old_password");
		String realpassword = request.getParameter("edit_old_real_password");
		Part part = request.getPart("profileimg");
		String imgname = part.getSubmittedFileName();
		HttpSession session = request.getSession();

		UserDao dao = new UserDao(ConnectionProvider.getConnection());
		User user = (User) session.getAttribute("currentUser");
		
		System.out.println("\n\n\n"+user+"\n\n\n");

		if(realpassword.equals(user.getPassword())) {
			if (oldpassword.equals(user.getPassword())) {
				if (password.equals(repassword)) {

					String oldPath = request.getRealPath("/") + "data" + File.separator + user.getImgname();

					System.out.println("\n\n\n\n\n"+oldPath+"\n\n\n\n");
					
					user.setUsername(name);
					user.setUseremail(email);
					user.setAbout(about);
					user.setPassword(password);
					user.setRepassword(repassword);
					user.setImgname(imgname);

					String newPath = request.getRealPath("/") + "data" + File.separator + user.getImgname();
				
					System.out.println("\n\n\n\n\n"+newPath+"\n\n\n\n");
					
					if (dao.updateUser(user)) {
						if (!oldPath.equals(
								"D:\\program\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\WebTech\\data\\default.png")) {
							FileData.deleteFile(oldPath);
						}
						if (FileData.saveFile(part.getInputStream(), newPath)) {
							Msg m = new Msg("profile update successfully", "success", "alert-success");
							session.setAttribute("editmsg", m);
							response.sendRedirect("profile.jsp");
						} else {
							out.println("profile not update");
						}
					} else {
						out.println("dao not working");
					}

				} else {
					Msg msg = new Msg("Password and Re-Password not same.... both should be same", "error", "alert-danger");
					session.setAttribute("editmsg", msg);
					response.sendRedirect("profile.jsp");
				}
			} else {
				Msg msg = new Msg("Please enter correct old password", "error", "alert-danger");
				session.setAttribute("editmsg", msg);
				response.sendRedirect("profile.jsp");
			}
		} else {
			Msg msg = new Msg("Please enter correct Real password", "error", "alert-danger");
			session.setAttribute("editmsg", msg);
			response.sendRedirect("profile.jsp");
		}

	}

}
