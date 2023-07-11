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


@WebServlet("/login")
public class LoginServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String email=req.getParameter("email");
			String password=req.getParameter("pwd");
			
			HttpSession session=req.getSession();
			User u=new User();
			
			
			if("admin@gmail.com".equals(email) && "admin1234".equals(password))
			{
				u.setRole("admin");
				session.setAttribute("userObject", u);
				resp.sendRedirect("admin.jsp");
			}
			else
			{
				UserDAO dao=new UserDAO(DBConnect.getConnection());
				User r=dao.login(email, password);
				
				if(r!=null)
				{
					session.setAttribute("userObject", r);
					resp.sendRedirect("home.jsp");
				}
				else
				{
					session.setAttribute("msg", "Invalid Credntials");
					resp.sendRedirect("login.jsp");
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
