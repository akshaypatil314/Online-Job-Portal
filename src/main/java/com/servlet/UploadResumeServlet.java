package com.servlet;

import java.io.File;
import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.DB.DBConnect;
import com.Entity.Resume;

import com.dao.ResumeDAO;

@WebServlet("/upload")
@MultipartConfig
public class UploadResumeServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		Part p = req.getPart("file");
		String filename = p.getSubmittedFileName();
		String user=req.getParameter("userName");
		String mobile=req.getParameter("userMobile");
		String company=req.getParameter("companyName");
		
		Resume r=new Resume(filename,user,mobile,company);
		
		ResumeDAO dao=new ResumeDAO(DBConnect.getConnection());
		boolean a=dao.addResume(r);
		
		String path = getServletContext().getRealPath("") + "files";
		System.out.println(path);
		File file = new File(path);
		p.write(path + File.separator + filename);

		String url = path + File.separator;
		
		HttpSession session=req.getSession();
		if (a == true) {
			session.setAttribute("msg", "Upload Successfull");
			session.setAttribute("path", url);
			resp.sendRedirect("resume_form.jsp");
		} else {
			session.setAttribute("msg", "Something went wrong");
			resp.sendRedirect("resume_form.jsp");
		}

	}

}
