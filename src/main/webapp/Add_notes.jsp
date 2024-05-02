<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@page import="com.entities.Register"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Note</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp"
	crossorigin="anonymous">
</head>
<body>

	<!-- Navbar -->
	<%-- <%@include file="Navbar.jsp"%> --%>

	<!-- Navbar -->

	<%
	/* getting the object of Register from login servlet  */
	Register User = (Register) session.getAttribute("register1");
	%>

	<nav class="navbar bg-dark navbar-expand-lg bg-body-tertiary"
		data-bs-theme="dark">
		<div class="container-fluid">
			<a class="navbar-brand" href="index.jsp"><%=User.getName().toUpperCase()%></a>
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

					<li class="nav-item"><a class="nav-link "
						href="Show_notes.jsp">Show Notes</a></li>
				</ul>
				<ul class="navbar-nav  mb-2 mb-lg-0">
					<form action="LogoutServlet" method="get">
						<button type="submit" class="btn btn-primary container">logout
							<!-- <li class="nav-item"><a class="nav-link " href="logout">Logout</a></li> -->
						</button>
					</form>
				</ul>

			</div>
		</div>
	</nav>



	<h1>Add note</h1>

	<div class="container text-center">
		<h1 class="text-success " style="display: none">Note added
			successfully</h1>
	</div>

	<div class="container">
		<form action="SaveNoteServlet" method="post">

			<%
			try {

				/* final Register res = (Register) session.getAttribute("register1"); */

				System.out.println(User.getId());
			%>

			<input type="hidden" name="regid" value=<%=User.getId()%>>

			<%
			/* passing the object of Register res to Show_notes.jsp page  */

			/* session.setAttribute("newres", res); */

			} catch (Exception e) {
			e.printStackTrace();
			}

			/* out.println(res.getId()); */
			%>



			<div class="mb-3">
				<label for="title" class="form-label">Title</label> <input
					type="text" class="form-control" id="title" name="title"
					required="required">
			</div>
			<div class="mb-3">
				<label for="content" class="form-label">Content</label>
				<textarea name="content" class="form-control m-0" id="content"
					required></textarea>
			</div>
			<button type="submit" class="btn btn-primary container">Submit</button>
		</form>

	</div>

</body>
</html>