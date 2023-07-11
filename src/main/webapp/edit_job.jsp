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
<title>Edit Post</title>
<%@include file="all_components/all_css.jsp"%>
</head>
<body style="background-color: #f0f1f2">
	<c:if test="${userObject1.role ne 'Recruiter' }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	<%@include file="all_components/navbar.jsp"%>
	<div class="container p-2">
		<div class="col-md-10 offset-md-1">
			<div class="card">
				<div class="card-body">

					<%
					int id = Integer.parseInt(request.getParameter("id"));
					JobDAO dao = new JobDAO(DBConnect.getConnection());
					Jobs j = dao.getJobById(id);
					%>

					<c:if test="${not empty msg}">
						<div class="text-center alert alert-success" role="alert">${msg}</div>
						<c:remove var="msg" />

					</c:if>
					<h3 class="text-center text-success">
						<i class="fa-solid fa-users m-3"></i>Edit Jobs
					</h3>

					<form action="updateJob" method="post">

						<input type="hidden" name="id" value="<%=j.getId()%>">
						<div class="form-group">
							<label class="form-label">Enter Title</label> <input type="text"
								class="form-control" name="title" value="<%=j.getTitle()%>"
								required>
						</div>

						<div class="row mt-2">

							<div class="form-group col-md-4">
								<label class="form-label">Location</label> <select
									class="form-control form-select custom-select" name="location">
									<option value="<%=j.getLocation()%>"><%=j.getLocation()%></option>
									<option value="Mumbai">Mumbai</option>
									<option value="Pune">Pune</option>
									<option value="Banglore">Banglore</option>
									<option value="Chennai">Chennai</option>
									<option value="Delhi">Delhi</option>
									<option value="Odisha">Odisha</option>
									<option value="Gujrat">Gujrat</option>
								</select>
							</div>

							<div class="form-group col-md-4">
								<label class="form-label">Category</label> <select
									class="form-control form-select custom-select" name="category"
									id="inlineFormCustomSelectPref">
									<option value="<%=j.getCategory()%>"><%=j.getCategory()%></option>
									<option value="IT">IT</option>
									<option value="Banking">Banking</option>
									<option value="Sales">Sales</option>
									<option value="Pharma">Pharma</option>
									<option value="Teacher">Teacher</option>
									<option value="Management">Management</option>
									<option value="Humar Resource">Humar Resource</option>
								</select>
							</div>

							<div class="form-group col-md-4">
								<label class="form-label">Status</label> <select
									class="form-select form-control" name="status">
									<option class="Active" value="<%=j.getStatus()%>"><%=j.getStatus()%></option>
									<option class="Active" value="Active">Active</option>
									<option class="Inactive" value="Inactive">Inactive</option>
								</select>
							</div>

						</div>

						<div class="form-group">
							<label class="form-label">Enter Description</label>
							<textarea required rows="6" cols="" name="desc"
								class="form-control"><%=j.getDescription()%></textarea>
						</div>

						<button type="submit" class="btn btn-success m-2">Update
							Job</button>
					</form>
				</div>
			</div>
		</div>
	</div>

</body>
</html>