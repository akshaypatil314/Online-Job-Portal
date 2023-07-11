package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.DBConnect;
import com.dao.RecruiterDAO;

@WebServlet("/activeRecruiter")
public class RecruiterStatus extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int id = Integer.parseInt(req.getParameter("id"));
		String status=req.getParameter("status");

		RecruiterDAO dao = new RecruiterDAO(DBConnect.getConnection());

		boolean a = dao.UpdateRecruiterById(id,status);
		HttpSession session = req.getSession();

		if (a) {
			session.setAttribute("succmsg", "Recruiter Access changed successfully");
			resp.sendRedirect("recruiter.jsp");
		} else {
			session.setAttribute("succmsg", "Something went wrong on server");
			resp.sendRedirect("recruiter.jsp");
		}
	}

}
