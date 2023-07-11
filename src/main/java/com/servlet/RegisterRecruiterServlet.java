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

@WebServlet("/addRecruiter")
public class RegisterRecruiterServlet extends HttpServlet 
{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String companyName=req.getParameter("companyName");
		String recruiterName=req.getParameter("recruiterName");
		String email=req.getParameter("email");
		String pwd=req.getParameter("pwd");
		String mobile=req.getParameter("mobile");
		
		Recruiter r=new Recruiter(companyName,recruiterName,email,pwd,mobile,"Recruiter","Inactive");
		
		
		RecruiterDAO dao=new RecruiterDAO(DBConnect.getConnection());
		HttpSession session=req.getSession();
		boolean i=dao.addRecruiter(r);
		if(i==true)
		{
			session.setAttribute("msg", "Recruiter Registered Successfully");
			resp.sendRedirect("recruiter_loginlogin.jsp");
		}
		else
		{
			session.setAttribute("msg", "Something went wrong");
			resp.sendRedirect("recruiter_sigup.jsp");
		}
	}
	
}
