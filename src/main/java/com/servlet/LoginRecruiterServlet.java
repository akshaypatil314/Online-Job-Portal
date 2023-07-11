package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.DBConnect;
import com.Entity.Recruiter;
import com.dao.RecruiterDAO;

@WebServlet("/loginRecruiter")
public class LoginRecruiterServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
			String email=req.getParameter("em");
			String password=req.getParameter("pw");
			
			HttpSession session=req.getSession();
			
			RecruiterDAO dao1=new RecruiterDAO(DBConnect.getConnection());
			Recruiter r1=dao1.login1(email, password);
			System.out.println(r1);
			System.out.println(r1.getStatus());
			
			if("active".equals(r1.getStatus()))
			{
				session.setAttribute("userObject1", r1);
				resp.sendRedirect("recruiter_home.jsp");
			}
			else
			{
				session.setAttribute("msg", "Invalid Credntials or Recruiter Access Not granted.");
				resp.sendRedirect("recruiter_login.jsp");
			}
		} 
}
