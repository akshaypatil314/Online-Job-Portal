<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Signup</title>
<%@ include file="all_components/all_css.jsp"%>
</head>
<body style="background-color: #f0f1f2">

	<%@include file="all_components/navbar.jsp"%>
	<div class="container p-3">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-body">

						
						<h4 class="text-center">
							<i class="fa-solid fa-user-plus p-1"></i>Recruiters Registration
						</h4>
						
						<c:if test="${not empty msg }">
							<h4 class="text-center text-success">${msg}</h4>
							<c:remove var="msg" />
						</c:if>

						<form action="addRecruiter" method="post">
							<div class="mb-3">
								<label class="form-label">Company Name</label> <input type="text"
									class="form-control" name="companyName" required>
							</div>

							<div class="mb-3">
								<label class="form-label">Recruiter Name</label> <input
									type="text" class="form-control" name="recruiterName" required>
							</div>
							
							<div class="mb-3">
								<label class="form-label">Email address</label> <input
									type="email" class="form-control" name="email" required>
							</div>

							<div class="mb-3">
								<label class="form-label">Password</label> <input
									type="password" class="form-control" name="pwd" required>
							</div>
							
							<div class="mb-3">
								<label class="form-label">Mobile No :</label> <input
									type="number" class="form-control" name="mobile" required>
							</div>
							

							<button type="submit" class="btn btn-primary">Register</button>
							
							<p class="p-2">Registered Already? <a href="recruiter_login.jsp" style="text-decoration:none;">Login</a></p>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>