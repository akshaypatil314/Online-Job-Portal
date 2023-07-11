<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.dao.JobDAO"%>
<%@page import="com.Entity.Jobs"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> View Jobs</title>
<%@include file="all_components/all_css.jsp"%>
</head>
<body style="background-color: #f0f1f2">

	<c:if test="${userObject1.role ne 'Recruiter' }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	
	<%@include file="all_components/navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-12">

				<h5 class="text-center text-primary mt-3">All jobs</h5>

				<%
				String com=request.getParameter("company");
				JobDAO dao = new JobDAO(DBConnect.getConnection());
				List<Jobs> a=dao.getJobByCompany(com);
				for (Jobs j : a) {
				%>
				<div class="card mt-2 shadow p-3 mb-5 bg-white rounded">
					<div class="card-body">
						<div class="text-center text-primary">
							<i class="far fa-clipboard fa-2x"></i>
						</div>

						<c:if test="${not empty msg}">
							<div class="text-center alert alert-success" role="alert">${msg}</div>
							<c:remove var="msg" />

						</c:if>

						<h6><%=j.getTitle()%></h6>
						<p><%=j.getDescription()%></p>
						<br>
						<div class="row">
							<div class="form-group col-md-3">
								<input type="text" class="form-control form-control-sm"
									value="Location: <%=j.getLocation()%>" readonly>
							</div>

							<div class="form-group col-md-3">
								<input type="text" class="form-control form-control-sm"
									value="Category: <%=j.getCategory()%>" readonly>
							</div>

							<div class="form-group col-md-3">
								<input type="text" class="form-control form-control-sm"
									value="Status: <%=j.getStatus()%>" readonly>
							</div>
						</div>

						<h6 class="mt-3">
							Published Date:
							<%=j.getPdate()%></h6>
						<div class="text-center">
							<a href="edit_job.jsp?id=<%=j.getId()%>"
								class="btn btn-sm bg-success text-white">Edit</a> <a
								href="delete?id=<%=j.getId()%>"
								class="btn btn-sm bg-danger text-white">Delete</a>
						</div>
					</div>
				</div>

				<%
				}
				%>


			</div>
		</div>
	</div>

</body>
</html>