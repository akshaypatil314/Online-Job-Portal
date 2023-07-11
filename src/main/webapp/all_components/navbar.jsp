<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
	<div class="container-fluid">
		<a class="navbar-brand" href="index.jsp">Job Portal</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="home.jsp"><i
						class="fa-solid fa-house p-1"></i>Home</a></li>

				<c:if test="${ userObject.role eq 'admin' }">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="recruiter.jsp"><i
							class="fas fa-eye p-1"></i>Recruiters</a></li>
				</c:if>

				<c:if test="${ userObject1.role eq 'Recruiter' }">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="add_post.jsp"><i
							class="fa fa-plus-circle p-1"></i>Post Job</a></li>
					<li class="nav-item"><a class="nav-link active"
						aria-current="page"
						href="view_jobs.jsp?company=${userObject1.companyName }"><i
							class="fas fa-eye p-1"></i>View Job</a></li>
					<li class="nav-item"><a class="nav-link active"
						aria-current="page"
						href="applied_candidates.jsp?comp=${userObject1.companyName }"><i
							class="fas fa-eye p-1"></i>Candidates Applied</a></li>
				</c:if>

			</ul>
			<form class="d-flex">

				<c:if test="${userObject.role eq 'admin' }">
					<a href="#" class="btn btn-light m-1"><i
						class="fa-solid fa-user p-1"></i>Admin</a>
					<a href="logout" class="btn btn-light m-1"><i
						class="fa-solid fa-arrow-right-to-bracket p-1"></i>Logout</a>
				</c:if>

				<c:if test="${userObject.role eq 'User' }">
					<a href="#" class="btn btn-light m-1" data-bs-toggle="modal"
						data-bs-target="#exampleModal"> <i
						class="fa-solid fa-user p-1"></i>${userObject.name }</a>
					<a href="logout" class="btn btn-light m-1"> <i
						class="fa-solid fa-arrow-right-to-bracket p-1"></i>Logout
					</a>
				</c:if>

				<c:if test="${userObject1.role eq 'Recruiter' }">
					<a class="btn btn-light m-1"> <i class="fa-solid fa-user-tie p-1"></i>${userObject1.recruiterName }</a>
					<a href="logout" class="btn btn-light m-1"> <i
						class="fa-solid fa-arrow-right-to-bracket p-1"></i>Logout
					</a>
				</c:if>


				<c:if test="${empty userObject && empty userObject1 }">
					<a href="signup.jsp" class="btn btn-light m-1"><i
						class="fa-solid fa-user p-1"></i>Users</a>
					<a href="recruiter_signup.jsp" class="btn btn-light m-1"><i
						class="fa-solid fa-user-tie p-1"></i>Recruiter</a>
					<a href="login.jsp" class="btn btn-light m-1"><i
						class="fa-solid fa-user-plus p-1"></i>Admin</a>
				</c:if>

			</form>
		</div>
	</div>
</nav>




<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Profile</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div class="card">
					<div class="card-body">
						<div class="text-center text-primary">
							<i class="fas fa-user-circle fa-3x"></i>
						</div>
						<table class="table">
							<tbody>
								<tr>
									<th scope="row">Name</th>
									<th>${userObject.name }</th>
								</tr>
								<tr>
									<th scope="row">Qualification</th>
									<th>${userObject.qualification }</th>
								</tr>
								<tr>
									<th scope="row">Email</th>
									<th>${userObject.email }</th>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary"
					data-bs-dismiss="modal">Close</button>
				<a href="edit_profile.jsp?id=${userObject.id }"
					class="btn btn-primary">Edit</a>
			</div>
		</div>
	</div>
</div>