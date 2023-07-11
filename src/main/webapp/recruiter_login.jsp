<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index</title>
<%@include file="all_components/all_css.jsp"%>
</head>
<body style="background-color: #f0f1f2">
	<%@include file="all_components/navbar.jsp"%>
	<div class="container p-3">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">

						<form action="loginRecruiter" method="post">
							<h4 class="text-center">
								<i class="fa-solid fa-user-plus p-2"></i>Recruiters Login
							</h4>

							<c:if test="${not empty msg }">
								<h4 class="text-center text-success">${msg}</h4>
								<c:remove var="msg" />
							</c:if>

							<div class="mb-3">
								<label class="form-label">Enter Email</label> <input
									type="email" class="form-control" name="em" required>
							</div>

							<div class="mb-3">
								<label class="form-label">Enter Password</label> <input
									type="password" class="form-control" name="pw" required>
							</div>

							<button type="submit" class="btn btn-primary btn-block">Login</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>