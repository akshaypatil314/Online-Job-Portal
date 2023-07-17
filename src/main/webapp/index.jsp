<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index</title>
<%@include file="all_components/all_css.jsp"%>
<style type="text/css">
.back-image {
	background: url("images/h1_hero.jpg");
	height: 100vh;
	width: 100%;
	background-repeat: no-repeat;
	background-size: cover;
}

.back-image2 {
	background: url("images/how-applybg.png");
	height: 50vh;
	width: 100%;
	background-repeat: no-repeat;
	background-size: cover;
	color: white;
}
</style>
</head>
<body>
	<%@include file="all_components/navbar.jsp"%>

	<div>
		<div class="slider-area ">
			<!-- Mobile Menu -->
			<div class="slider-active">
				<div
					class=" d-flex align-items-center back-image">
					<div class="container">
						<div class="row">
							<div class="col-xl-6 col-lg-9 col-md-10">
								<div>
									<h1>Find the Perfect Job</h1>
									<h1>That You Deserved</h1>
								</div>
							</div>
						</div>
						<!-- Search Box -->
						<div class="row">
							<div class="col-xl-8">
								<div class="mt-5">
									<a href="home.jsp"
										style="background-color: black; color: white; padding: 10px; text-decoration: none; cursor: pointer">Show
										Jobs</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="pt-5 pb-5 back-image2">
			<div class="container">
				<!-- Section Tittle -->
				<div class="row">
					<div class="col-lg-12">
						<div class="m2-5 text-center">
							<span>Apply process</span> <br>
							<h2>How it works</h2>
						</div>
					</div>
				</div>
				<!-- Apply Process Caption -->
				<div class="row mt-5">
					<div class="col-lg-4 col-md-6">
						<div class="text-center">
							<div class="mb-3">
								<i class="fa-solid fa-magnifying-glass fa-2xl"
									style="color: #ffffff;"></i>
							</div>
							<div class="process-cap">
								<h5>1. Search a job</h5>
								<p>Serach the jobs based on your field of interest and Work Location.</p>
							</div>
						</div>
					</div>
					<div class="col-lg-4 col-md-6">
						<div class="text-center">
							<div class="mb-3">
								<i class="fa-solid fa-upload fa-2xl" style="color: #ffffff;"></i>
							</div>
							<div class="process-cap">
								<h5>2. Apply for job</h5>
								<p>To Apply to particular job create your resume and submit as per selected job Profile</p>
							</div>
						</div>
					</div>
					<div class="col-lg-4 col-md-6">
						<div class="text-center">
							<div class="mb-3">
								<i class="fa-regular fa-circle-down fa-2xl"
									style="color: #ffffff;"></i>
							</div>
							<div class="process-cap">
								<h5>3. Get your job</h5>
								<p>Get Notified by Recruiters once your Profile Shortlisted and Your Ready for job.</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<footer>
			<!-- Footer Start-->
			<div
				style="background-color: black; color: white; height: 50vh; padding: 20px">
				<div class="container">
					<div class="row d-flex justify-content-between m-5">
						<div class="col-xl-6 col-lg-3 col-md-4 col-sm-6">
							<div class="mb-5">
								<div class="mb-3">
									<div class="footer-tittle">
										<h4>About Us</h4>
										<div >
											<p>Welcome to our job portal website! We are a leading
												online platform dedicated to connecting job seekers with
												employers, creating a seamless and efficient job search
												experience for both parties. Our mission is to empower
												individuals to find meaningful employment opportunities
												while assisting employers in recruiting top talent.</p>
										</div>
									</div>
								</div>

							</div>
						</div>
						<div class="col-xl-4 col-lg-3 col-md-4 col-sm-5">
							<div class="mb-5">
								<div class="footer-tittle">
									<h4>Contact Info</h4>
									<ul>
										<li>
											<p>Address :Your address goes here, your demo address.</p>
										</li>
										<li><a href="#">Phone : +8880 44338899</a></li>
										<li><a href="#">Email : info@colorlib.com</a></li>
									</ul>
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- Footer End-->
		</footer>
	</div>
</body>
</html>
