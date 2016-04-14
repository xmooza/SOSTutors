<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>

<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Tutor Scheduling Website">
<meta name="author" content="SOSTutors">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>SOSTutors - Edit Tutor</title>

<!-- Bootstrap -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

<!-- Google -->
<link href='https://fonts.googleapis.com/css?family=Quicksand|Roboto'
	rel='stylesheet' type='text/css'>

<!-- FontAwesome -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">

<!-- Custom Styles -->
<link rel="stylesheet" type="text/css" href="styles/styles.css">
<!-- Initialization -->
</head>

<body>
	<!-- CONTENT -->
	<div class="content">

		<!--Error and Messages -->
		<%
			if (request.getAttribute("errorMessage") != null) {
		%>
		<DIV CLASS="container">
			<DIV CLASS="alert alert-danger">
				<A HREF="#" CLASS="close" DATA-DISMISS="alert" ARIA-LABEL="close">&times;</A>
				<%=request.getAttribute("errorMessage").toString()%>
			</DIV>
		</DIV>
		<%
			}
		%>
		<!--Error and Messages End -->
		<div
			class="container-fluid form blackform col-md-10 col-md-offset-1 col-lg-6 col-lg-offset-3 col-sm-8 col-sm-offset-2 col-xs-10 col-xs-offset-1">
			<div class="row">
				<!-- REGISTER -->
				<div class="col-sm-12 col-md-12"
					style="padding: 25px; color: white;">
					<div class="titlebar">
						<h4>Edit Tutor</h4>
					</div>
					<br />
					<form name="EditForm" action="editServlet" method="post">
					
						<div class="col-md-6">
							<h4>Enabled</h4>
							<input type=text name=editTutorenabled maxlength=1
								class="form-control" value="${tutor.enabled}" />
						</div>

						<div class="col-md-6">
							<h4>First Name</h4>
							<input type=text name=editTutorfname maxlength=100
								class="form-control" value="${tutor.fname}" />
						</div>

						<div class="col-md-6">
							<h4>Last Name</h4>
							<input type=text name=editTutorlname maxlength=100
								class="form-control" value="${tutor.lname}" />
						</div>

						<div class="col-md-6">
							<h4>Email</h4>
							<input type=text name=editTutoremail maxlength=100
								class="form-control" value="${tutor.email}" />
						</div>

						<div class="col-md-6">
							<h4>Password</h4>
							<input type=password name=editTutorpassword maxlength=100
								value="${tutor.password}" class="form-control" />
						</div>
						<div class="col-md-12">
							<h4>Description</h4>
							<textarea class="form-control" id="description" rows="5"
								name=editTutorprofile>${tutor.profile}</textarea>
						</div>

						<div class="col-md-12">
							<h4>Hourly</h4>
							<input type=text name=editTutorhourly maxlength=100
								class="form-control" value="${tutor.hourly}" />
						</div>

						<div class="col-md-12">
							<h4>Rating</h4>
							<input type=text name=editTutorrating maxlength=100
								class="form-control" value="${tutor.rating}" />
						</div>

						<div class="col-md-12">
							<h4>Image</h4>
							<input type=text name=editTutorimage maxlength=100
								class="form-control" value="${tutor.image}" />
						</div>

						<div class="col-md-12">
							<h4>College</h4>
							<input type=text name=editTutorcollege maxlength=100
								class="form-control" value="${tutor.college}" />
						</div>
						<div class="col-md-12">
							<input type="hidden" name="editTutorid" value="${tutor.tutorID}">
							<input type="hidden" name="editRole" value="tutor"> <input
								class="btn btn-default greenbtn" type=submit value="Update"
								style="float: right; width: 30%; margin-top: 25px" />
						</div>
						<br />
					</form>
				</div>

			</div>
		</div>
	</div>

	<br />
	<br />
</body>
</html>