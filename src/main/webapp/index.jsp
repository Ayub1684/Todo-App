<!doctype html>
<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@page import="com.entities.Register"%>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Home</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp"
	crossorigin="anonymous">
</head>
<body>
	<!-- Navbar -->

	<%-- <%@include file="Navbar.jsp"%> --%>

	<div class="container p-5">

		<section class="vh-100">
			<div class="container-fluid">
				<div class="row">
					<% 
					
					String message = (String) session.getAttribute("message");
					
					

					if (session.getAttribute("message") != null) {
					%>

					<div class="container text-center text-success">
						<h3><%=session.getAttribute("message")%></h3>

					</div>
					<%
					
					session.removeAttribute("message");
					}
					%>
					<div class="col-sm-6 text-black">

						<div class="px-5 ms-xl-4">
							<i class="fas fa-crow fa-2x me-3 pt-5 mt-xl-4"
								style="color: #709085;"></i> <span class="h1 fw-bold mb-0">Note
								Taker</span>
						</div>

						<div
							class="d-flex align-items-center h-custom-2 px-5 ms-xl-4 mt-5 pt-5 pt-xl-0 mt-xl-n5">

							<form style="width: 23rem;" action="LoginServlet" method="post">

								<h3 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;">Log
									in</h3>

								<div class="form-outline mb-4">
									<input type="email" id="email" name="email"
										class="form-control form-control-lg" /> <label
										class="form-label" for="email">Email address</label>
								</div>

								<div class="form-outline mb-4">
									<input type="password" id="passowrd" name="password"
										class="form-control form-control-lg" /> <label
										class="form-label" for="password">Password</label>
								</div>

								<div class="pt-1 mb-4">
									<button class="btn btn-info btn-lg btn-block" type="submit">Login</button>
								</div>

								<p class="small mb-5 pb-lg-2">
									<a class="text-muted" href="#!">Forgot password?</a>
								</p>
								<p>
									Don't have an account? <a href="Register.jsp" class="link-info">Register
										here</a>
								</p>

							</form>

						</div>

					</div>
					<div class="col-sm-6 px-0 d-none d-sm-block">
						<img
							src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkNR4EQnnHEt24DzYsL51wU_Jzne8uf52hKA&usqp=CAU"
							alt="Login image" class="w-100 vh-100"
							style="object-fit: content; object-position: left;">
					</div>
				</div>
			</div>
		</section>

	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N"
		crossorigin="anonymous"></script>
</body>
</html>