<%@page import="org.hibernate.Transaction"%>
<%@page import="java.util.Date"%>
<%@page import="com.entities.Note"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
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
<title>Insert title here</title>

</head>
<body>

	<!-- Code to Edit the notes  -->

	<!-- Navbar -->

	<%@include file="Navbar.jsp"%>

	<%
	
	/* getting the note id from Show_note.jsp */
	int noteid = Integer.parseInt(request.getParameter("note_id").trim());

	Session s = FactoryProvider.getFactory().openSession();
	
	/* passing noteid to get the object of note class */

	Note note = (Note) s.get(Note.class, noteid);
	%>


	<div class="container mt-3">
		<form action="UpdateServlet" method="post">

			<input value=<%=note.getId()%> name="noteid" type="hidden" />
			<div class="mb-3">
				<label for="title" class="form-label">Title</label> <input
					type="text" class="form-control" id="title" name="title"
					required="required" value="<%=note.getTitle()%>">
			</div>
			<div class="mb-3">
				<label for="content" class="form-label">Content</label>
				<textarea name="content" class="form-control m-0" id="content"
					required="required"><%=note.getContent()%></textarea>
			</div>
			<button type="submit" class="btn btn-primary container">Submit</button>
		</form>
	</div>



</body>
</html>