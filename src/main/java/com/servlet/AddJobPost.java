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
import com.Entity.Jobs;

@WebServlet("/addPost")
public class AddJobPost extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String title=req.getParameter("title");
		String description=req.getParameter("desc");
		String category=req.getParameter("category");
		String status=req.getParameter("status");
		String location=req.getParameter("location");
		String company=req.getParameter("company");
		
		System.out.println(company);
		
		Jobs j=new Jobs();
		j.setTitle(title);
		j.setDescription(description);
		j.setCategory(category);
		j.setStatus(status);
		j.setLocation(location);
		j.setCompany(company);
		
		JobDAO dao=new JobDAO(DBConnect.getConnection());
		boolean a=dao.addJob(j);
		
		HttpSession session=req.getSession();
		
		if(a==true)
		{
			session.setAttribute("msg", "Job Posted Successfully");
			resp.sendRedirect("add_post.jsp");
		}
		else
		{
			session.setAttribute("msg", "Something went wrong");
			resp.sendRedirect("add_post.jsp");
		}
	}
	

}
