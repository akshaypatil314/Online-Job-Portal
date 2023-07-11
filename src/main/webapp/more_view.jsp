<%@page import="java.util.ArrayList"%>
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
<title>Results</title>
<%@include file="all_components/all_css.jsp"%>

</head>
<body>
<%-- 	<c:if test="${empty userObject && empty userObject1 }"> --%>
<%-- 		<c:redirect url="login.jsp"></c:redirect> --%>
<%-- 	</c:if> --%>
	<%@include file="all_components/navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-12">

				<%
				String loc = request.getParameter("loc");
				String cat = request.getParameter("cat");
				JobDAO dao = new JobDAO(DBConnect.getConnection());
				String msg = "";
				List<Jobs> list = null;

				if ("lo".equals(loc) && "ca".equals(cat)) {
					list = new ArrayList<Jobs>();
					msg = "Jobs Not Available";
				} else if ("lo".equals(loc) || "ca".equals(cat)) {
					list = dao.getJobByLocORCat(loc, cat);
				} else {
					list = dao.getJobByLocANDCat(loc, cat);
				}

				if (list.isEmpty()) {
				%>
				<h4 class="text-center text-danger">Job Not Available</h4>
				<%
				}

				if (list != null) {
				for (Jobs j : list) {
				%>

				<div class="card mt-3 shadow p-3 mb-5 bg-white rounded">
					<div class="card-body">


						<h4><%=j.getTitle()%></h4>
						<p>
							<span><b>Description : </b></span><%=j.getDescription()%></p>
						<br>
						<div class="row">
							<div class="form-group col-md-3">
								<label><i class="me-2 fa-sharp fa-solid fa-location-dot"
									style="color: #4b80dd;"></i><%=j.getLocation()%></label>
							</div>

							<div class="form-group col-md-3">
								<label><i class="fa-solid fa-code-branch"></i><%=j.getCategory()%></label>
							</div>

							<div class="form-group col-md-3">
								<label><i class="me-2 fa-sharp fa-solid fa-location-dot"
									style="color: #4b80dd;"></i><%=j.getStatus()%></label>
							</div>
						</div>

						<h6 class="mt-3">
							Published Date:
							<%=j.getPdate()%></h6>
					</div>
				</div>
				<%
				}
				} else {
				%>
				<h4 class="text-center text-danger"><%=msg%></h4>
				<%
				}
				%>
			</div>
		</div>
	</div>
</body>
</html>