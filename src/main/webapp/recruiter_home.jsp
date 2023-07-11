<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Recruiter : Home</title>
<%@include file="all_components/all_css.jsp"%>
<style>
.back-image {
	background: url("images/img5.jpg");
	height: 91.6vh;
	width: 100%;
	background-repeat: no-repeat;
	background-size: cover;
}
</style>
</head>
<body>
	
	<c:if test="${userObject1.role ne 'Recruiter' }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	<%@include file="all_components/navbar.jsp"%>
	<div class="container-fluid back-image">
		<div class="text-center">
			<h1 class="text-black p-2 ml-2">Welcome Recruiter</h1>
		</div>
	</div>
</body>
</html>