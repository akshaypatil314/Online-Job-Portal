<%@page import="com.DB.DBConnect"%>
<%@page import="com.dao.JobDAO"%>
<%@page import="com.Entity.User"%>

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
	<c:if test="${empty userObject }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	<%@include file="all_components/navbar.jsp"%>
	<div class="container p-2">
		<div class="col-md-10 offset-md-1">
			<div class="card">
				<div class="card-body">

					<c:if test="${not empty msg}">
						<div class="text-center alert alert-success" role="alert">${msg}</div>
						<c:remove var="msg" />

					</c:if>
					<h3 class="text-center text-success">
						<i class="fa-solid fa-users m-3"></i>Edit Profile
					</h3>

					<form action="editProfile" method="post">
					<input type="hidden" name="id" value="${userObject.id }">
							<div class="mb-3">
								<label class="form-label">Full Name</label> <input type="text"
									class="form-control" name="name" value="${userObject.name }" required>
							</div>

							<div class="mb-3">
								<label class="form-label">Qualification</label> <input
									type="text" class="form-control" name="qualification" value="${userObject.qualification }" required>
							</div>

							<div class="mb-3">
								<label class="form-label">Enter Password</label> <input
									type="password" class="form-control" name="pwd" value="${userObject.password }" required>
							</div>

							<button type="submit" class="btn btn-primary">Update</button>
						</form>
				</div>
			</div>
		</div>
	</div>

</body>
</html>