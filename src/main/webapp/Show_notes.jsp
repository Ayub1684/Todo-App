<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@page import="com.entities.Register"%>
<%@page import="com.entities.Note"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Notes</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp"
	crossorigin="anonymous">
</head>
<body>

	<!-- Show notes -->
	<%-- <%@include file="Navbar.jsp"%> --%>

	<%
	Register User = (Register) session.getAttribute("register1");

	System.out.println(User);
	%>


	<!-- Navbar -->

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
				<form action="LogoutServlet" method="get">
					<ul class="navbar-nav  mb-2 mb-lg-0">


						<button type="submit" class="btn btn-primary container">
							logout
							<!-- <li class="nav-item"><a class="nav-link " href="logout">Logout</a></li> -->
						</button>

					</ul>
				</form>

			</div>
		</div>
	</nav>


	<!-- Search form -->

	<div class="container p-2">

		<form id="formId" action="Show_notes.jsp" method="post">
			<div class="row g-3 align-items-center">
				<div class="col-auto">
					<label for="inputPassword6" class="col-form-label">Title</label>
				</div>
				<div class="col-auto">
					<input type="text" id="search" class="form-control"
						aria-labelledby="passwordHelpInline" placeholder="search"
						name="search">
				</div>
				<div class="col-auto">
					<button type="submit" class="btn btn-primary">Submit</button>
				</div>
			</div>
		</form>
	</div>


	<div class="container">

		<%
		/* getting the search from the user */

		String search = request.getParameter("search");

		/* to get the session of register in order to get the value using Register.id */
		Session s = FactoryProvider.getFactory().openSession();

		/* getting the object of Register as resid from Add_notes.jsp inorder to get the notes to a user logedin  using Register.id*/

		/* Register resid = (Register) session.getAttribute("newres"); */

		Query q;

		/* Query for when the search bar is null or empty */
		if ((search != null) & search != "") {
			q = s.createQuery("from Note where title like '%" + search.trim() + "%' and register_id = " + User.getId());
		} else {
			/* Query for when thier is a value in search bar */
			q = s.createQuery("from Note where register_id = '" + User.getId() + "'");
			/* q.setParameter("a", User.getId()); */
		}

		List<Note> list = q.list();

		/* If their are No notes to display */
		if (list.isEmpty()) {
		%>

		<h1 class="text-center">No items to display</h1>

		<%
		}

		for (Note note : list) {
		%>

		<div class="card mt-3">
			<!-- <img src="..." class="card-img-top" alt="..."> -->
			<div class="card-body">
				<h5 class="card-title"><%=note.getTitle()%></h5>
				<p class="card-text"><%=note.getContent()%></p>
				<!-- Delete Button passing note id when deleting  -->
				<a href="DeleteServlet?note_id=<%=note.getId()%>"
					class="btn btn-danger">Delete</a>

				<!-- Edit Button passing note id when deleting  -->
				<a href="Edit.jsp?note_id=<%=note.getId()%>" class="btn btn-success">Update</a>
			</div>
		</div>
		<%
		}
		%>

	</div>

</body>
</html>