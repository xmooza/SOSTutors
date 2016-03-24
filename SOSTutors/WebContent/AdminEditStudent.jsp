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

<title>SOSTutors - Edit Student</title>

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
						<h4>Edit Student</h4>
					</div>
					<br />
					<form name="EditForm" action="editServlet" method="post">

						<div class="col-md-6">
							<h4>First Name</h4>
							<input type=text name=editStudentfname maxlength=100
								class="form-control" value="${student.fname}" />
						</div>

						<div class="col-md-6">
							<h4>Last Name</h4>
							<input type=text name=editStudentlname maxlength=100
								class="form-control" value="${student.lname}" />
						</div>

						<div class="col-md-6">
							<h4>Email</h4>
							<input type=text name=editStudentemail maxlength=100
								class="form-control" value="${student.email}" />
						</div>

						<div class="col-md-6">
							<h4>Password</h4>
							<input type=password name=editStudentpassword maxlength=100
								value="" class="form-control" />
						</div>
						<div class="col-md-12">
							<h4>Description</h4>
							<textarea class="form-control" id="description" rows="5"
								name=editStudentprofile>${student.profile}</textarea>
						</div>

						<div class="col-md-12">
							<input type="hidden" name="editStudentid"
								value="${student.studentID}"> <input type="hidden"
								name="editRole" value="student"> <input
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