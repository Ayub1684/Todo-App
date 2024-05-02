<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp"
	crossorigin="anonymous">
<title>Register</title>
</head>
<body>
	<div class="container-fluid p-5">

		<div class="row d-flex justify-content-center align-items-center p-5">

			<%
			String newmessage = (String) session.getAttribute("message");

			if (session.getAttribute("newmessage") != null) {
			%>

			<div class="container text-center text-success">
				<h3><%=session.getAttribute("newmessage")%></h3>

			</div>
			<%
			session.removeAttribute("newmessage");
			}
			%>

			<div class="col-6 p-2">

				<form action="RegisterServlet" method="post">
					<h2>Register</h2>
					<div class="mb-3">
						<label for="Name" class="form-label">Name</label> <input
							type="text" class="form-control" id="Name" name="Name" required
							aria-describedby="emailHelp">
					</div>
					<div class="mb-3">
						<label for="email" class="form-label">Email address</label> <input
							type="email" class="form-control" id="email" name="email"
							required aria-describedby="emailHelp">
						<div id="emailHelp" class="form-text">We'll never share your
							email with anyone else.</div>
					</div>
					<div class="mb-3">
						<label for="password" class="form-label">Password</label> <input
							type="password" class="form-control" id="password"
							name="password">
					</div>
					<div class="mb-3 form-check">
						<input type="checkbox" class="form-check-input" id="exampleCheck1"
							required> <label class="form-check-label"
							for="exampleCheck1">Check me out</label>
					</div>
					<button type="submit" class="btn btn-primary">Submit</button>
				</form>
			</div>
		</div>
	</div>

</body>
</html>