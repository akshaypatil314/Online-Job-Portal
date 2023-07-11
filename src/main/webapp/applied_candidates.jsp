<%@page import="com.dao.ResumeDAO"%>
<%@page import="com.Entity.Resume"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.dao.RecruiterDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Applied Candidates</title>
<%@include file="all_components/all_css.jsp"%>
</head>
<body class="bg-light">

	<%@include file="all_components/navbar.jsp"%>

	<div class="card">
		<div class="card-body">
			<div class="container">
				<p class="fs-3 text-center p-3">List of Users Applied</p>

				<c:if test="${not empty succmsg }">
					<p class="text-center text-success">${succmsg }</p>
					<c:remove var="succmsg" />
				</c:if>


				<table class="table">
					<thead>
						<tr>
							<th scope="col">User Name</th>
							<th scope="col">Mobile</th>
							<th scope="col">Resume</th>
							
						</tr>
					</thead>
					<tbody>

						<%
						String com=request.getParameter("comp");
						ResumeDAO dao = new ResumeDAO(DBConnect.getConnection());
						List<Resume> a=dao.getCandidatesByCompany(com);
						for (Resume j : a) {
						%>
						<tr>
							<th scope="row"><%=j.getUserName() %></th>
							<td><%=j.getUserMobile() %></td>
							<td><a href="files/<%= j.getUserResume() %>" target="_blank"><%=j.getUserResume() %></a></td>
						</tr>
						<%
						}
						%>

					</tbody>
				</table>
			</div>
		</div>
	</div>

</body>
</html>