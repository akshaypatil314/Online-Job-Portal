package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.DBConnect;
import com.Entity.Jobs;
import com.dao.JobDAO;

@WebServlet("/updateJob")
public class UpdateServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			int id = Integer.parseInt(req.getParameter("id"));
			String title = req.getParameter("title");
			String description = req.getParameter("desc");
			String category = req.getParameter("category");
			String status = req.getParameter("status");
			String location = req.getParameter("location");

			Jobs j = new Jobs();
			j.setId(id);
			j.setTitle(title);
			j.setDescription(description);
			j.setCategory(category);
			j.setStatus(status);
			j.setLocation(location);

			JobDAO dao = new JobDAO(DBConnect.getConnection());
			boolean a = dao.updateJob(j);

			HttpSession session = req.getSession();

			if (a == true) {
				session.setAttribute("msg", "Job Updated Successfully");
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
