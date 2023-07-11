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


@WebServlet("/addUser")
public class RegisterServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name=req.getParameter("name");
		String email=req.getParameter("email");
		String password=req.getParameter("pwd");
		String qualification=req.getParameter("qualification");
		String mobile=req.getParameter("mobile");
		
		User r=new User(name,email,password,qualification,"User",mobile);
		
		
		UserDAO dao=new UserDAO(DBConnect.getConnection());
		HttpSession session=req.getSession();
		boolean i=dao.addUser(r);
		if(i==true)
		{
			session.setAttribute("msg", "User Registered Successfully");
			resp.sendRedirect("login.jsp");
		}
		else
		{
			session.setAttribute("msg", "Something went wrong");
			resp.sendRedirect("signup.jsp");
		}
		
	}
}
