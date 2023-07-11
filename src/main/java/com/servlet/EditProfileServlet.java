package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.DBConnect;
import com.Entity.User;
import com.dao.UserDAO;

@WebServlet("/editProfile")
public class EditProfileServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			int id = Integer.parseInt(req.getParameter("id"));
			String name = req.getParameter("name");
			String qualification = req.getParameter("qualification");
			String password = req.getParameter("pwd");

			User j = new User();
			j.setId(id);
			j.setName(name);
			j.setQualification(qualification);
			j.setPassword(password);

			UserDAO dao = new UserDAO(DBConnect.getConnection());
			boolean a = dao.editUserProfile(j);

			HttpSession session = req.getSession();

			if (a == true) {
				session.setAttribute("msg", "Profile Updated Successfully");
				resp.sendRedirect("home.jsp");
			} else {
				session.setAttribute("msg", "Something went wrong");
				resp.sendRedirect("home.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		
		
	}
	

}
