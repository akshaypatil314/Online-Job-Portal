<%@page import="com.Entity.Recruiter"%>
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
<title>Index</title>
<%@include file="all_components/all_css.jsp"%>
</head>
<body class="bg-light">

	<%@include file="all_components/navbar.jsp"%>

	<div class="card">
		<div class="card-body">
			<div class="container">
				<p class="fs-3 text-center p-3">List of Recruiters</p>

				<c:if test="${not empty succmsg }">
					<p class="text-center text-success">${succmsg }</p>
					<c:remove var="succmsg" />
				</c:if>


				<table class="table">
					<thead>
						<tr>
							<th scope="col">Company Name</th>
							<th scope="col">Recruiter Name</th>
							<th scope="col">Email</th>
							<th scope="col">Mobile</th>
							<th scope="col">Status</th>
							<th scope="col">Action</th>
						</tr>
					</thead>
					<tbody>

						<%
						RecruiterDAO dao = new RecruiterDAO(DBConnect.getConnection());
						List<Recruiter> s = dao.getAllRecruiter();

						for (Recruiter str : s) {
						%>
						<tr>
							<th scope="row"><%=str.getCompanyName() %></th>
							<td><%=str.getRecruiterName() %></td>
							<td><%=str.getEmail() %></td>
							<td><%=str.getMobile() %></td>
							<td><%=str.getStatus() %></td>
							<td><a href="activeRecruiter?id=<%=str.getId() %>&status=active"
								class="btn btn-sm btn-success">Active</a> <a
								href="activeRecruiter?id=<%=str.getId()%>&status=Inactive"
								class="btn btn-sm btn-danger">Inactive</a></td>
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