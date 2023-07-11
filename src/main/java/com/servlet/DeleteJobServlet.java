package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.DBConnect;
import com.dao.JobDAO;

@WebServlet("/delete")
public class DeleteJobServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int id=Integer.parseInt(req.getParameter("id"));
		
		JobDAO dao=new JobDAO(DBConnect.getConnection());
		
		boolean a=dao.deleteJobById(id);
		HttpSession session=req.getSession();
		
		if(a)
		{
			session.setAttribute("msg", "Details deleted successfully");
			resp.sendRedirect("view_jobs.jsp");
		}
		else
		{
			session.setAttribute("msg", "Something went wrong on server");
			resp.sendRedirect("view_jobs.jsp");
		}
	}

	
}
