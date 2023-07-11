<%@page import="com.Entity.Jobs"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.dao.JobDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Jobs</title>
<%@include file="all_components/all_css.jsp"%>
</head>
<body>
	<%@include file="all_components/navbar.jsp"%>

	<c:if
		test="${empty userObject }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	<div class="container mt-3">

		<c:if test="${not empty msg}">
			<div class="text-center alert alert-success" role="alert">${msg}</div>
			<c:remove var="msg" />

		</c:if>
		<div class="row">
			<div class="col-md-12">
				<div class="card">

					<%
					String company = request.getParameter("company");
					%>
					<div class="card-body">
						<div class="text-center text-primary">
							<i class="fas fa-user-circle fa-3x"></i>
						</div>
						<form method="post" action="upload" enctype="multipart/form-data">
							<input type="hidden" name="userName" value="${userObject.name }">
							<input type="hidden" name="userMobile"
								value="${userObject.mobile }"> <input type="hidden"
								name="companyName" value="<%=company%>">
							<table class="table">
								<tbody>
									<tr>
										<th scope="row">Resume</th>
										<th><input type="file" name="file" accept=".pdf"></th>
									</tr>
								</tbody>
							</table>
							<button type="submit" class="btn btn-primary">Upload</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>