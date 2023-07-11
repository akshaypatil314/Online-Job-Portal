<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index</title>
<%@include file="all_components/all_css.jsp" %>
<style type="text/css">
	.back-image{
		background: url("images/img4.jpg");
		height:91.6vh;
		width:100%;
		background-repeat: no-repeat;
		background-size: cover;
	}
</style>
</head>
<body>
	<%@include file="all_components/navbar.jsp" %>
	
	<div class="container-fluid back-image">
		<div class="text-center">
			<h1 class="text-white p-4">
				<i class="fa fa-book" aria-hidden="true"></i>Online Job Portal
			</h1>
		</div>
	</div>
</body>
</html>