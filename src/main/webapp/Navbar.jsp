<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Navbar</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp"
	crossorigin="anonymous">
</head>
<body>

	<!-- Navbar -->

	<nav class="navbar bg-dark navbar-expand-lg bg-body-tertiary"
		data-bs-theme="dark">
		<div class="container-fluid">
			<!-- <a class="navbar-brand" href="index.jsp">Note Taker</a> -->
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<!-- <li class="nav-item"><a class="nav-link active"
						aria-current="page" href="#">Home</a></li> -->
					<li class="nav-item"><a class="nav-link" href="Add_notes.jsp">Add
							Notes</a></li>

					<li class="nav-item"><a class="nav-link " href="Show_notes.jsp">Show Notes</a></li>
				</ul>
				<ul class="navbar-nav  mb-2 mb-lg-0">

					<li class="nav-item"><a class="nav-link " href="index.jsp">Logout</a></li>
				</ul>

			</div>
		</div>
	</nav>

</body>
</html>