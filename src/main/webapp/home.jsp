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
<title>User : Home</title>
<%@include file="all_components/all_css.jsp"%>
</head>
<body style="background-color: #f0f1f2">

	<%@include file="all_components/navbar.jsp"%>

	<div class="container">
		<div class="row">
			<div class="col-md-12">

				<c:if test="${not empty msg}">
					<div class="text-center alert alert-success" role="alert">${msg}</div>
					<c:remove var="msg" />
				</c:if>

				<h5 class="text-center text-primary mt-2">All Jobs</h5>

				<div class="card">
					<div class="card-body">

						<form class="d-flex flex-row align-items-center flex-wrap"
							action="more_view.jsp" method="get">
							<div class="form-group col-md-5 me-1">
								<h5>Location</h5>
							</div>

							<div class="form-group col-md-4 mt-1">
								<h5>Category</h5>
							</div>

							<div class="form-group col-md-5 me-2">
								<select class="form-control form-select custom-select me-2"
									name="loc">
									<option selected value="lo">Choose...</option>
									<option value="Mumbai">Mumbai</option>
									<option value="Pune">Pune</option>
									<option value="Banglore">Banglore</option>
									<option value="Chennai">Chennai</option>
									<option value="Delhi">Delhi</option>
									<option value="Odisha">Odisha</option>
									<option value="Gujrat">Gujrat</option>
								</select>
							</div>

							<div class="form-group col-md-5 me-2">
								<select class="form-control form-select custom-select me-2"
									name="cat">
									<option selected value="ca">Choose...</option>
									<option value="IT">IT</option>
									<option value="Banking">Banking</option>
									<option value="Sales">Sales</option>
									<option value="Pharma">Pharma</option>
									<option value="Teacher">Teacher</option>
									<option value="Management">Management</option>
									<option value="Humar Resource">Humar Resource</option>
								</select>
							</div>

							<button class="btn ntn-sm btn-primary">
								<i class="fa-solid fa-magnifying-glass p-1" style="color: #ffffff;"></i>Search
							</button>

						</form>

					</div>
				</div>

				<%
				JobDAO dao = new JobDAO(DBConnect.getConnection());
				List<Jobs> list = dao.getAllJobsActive();
				for (Jobs r : list) {
				%>

				<div class="card mt-2 shadow p-3 mb-5 bg-white rounded">
					<div class="card-body">
						<div class="text-center text-primary">
							<i class="far fa-clipboard fa-2x"></i>
						</div>
						<h5 class="mb-2"><%=r.getTitle()%></h5>
						<h6 class="mt-3"><%=r.getCompany()%></h6>
						<%
						if (r.getDescription().length() > 0 && r.getDescription().length() < 300) {
						%>
						<p><%=r.getDescription()%></p>
						<%
						} else {
						%>
						<p><%=r.getDescription().substring(0, 300)%>....
						</p>

						<%
						}
						%>

						<div class="row">
							<div class="form-group col-md-3">
								<label><i class="me-2 fa-sharp fa-solid fa-location-dot"
									style="color: #4b80dd;"></i><%=r.getLocation()%></label>
							</div>

							<div class="form-group col-md-3">
								<label><i class="fa-light fa-square-list"
									style="color: #9f951d;"></i>Field : <%=r.getCategory()%></label>
							</div>
						</div>
						<h6 class="mt-2">
							Publish Date :<%=r.getPdate().toString()%></h6>

							<a href="one_view.jsp?id=<%=r.getId()%>"
								class="btn btn-sm bg-success text-white">View More</a>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
	</div>
</body>
</html>