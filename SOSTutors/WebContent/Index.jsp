<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Tutor Scheduling Website">
<meta name="author" content="SOSTutors">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SOSTutors - Tutors</title>

<!-- Custom Styles-->
<link rel="stylesheet" type="text/css" href="styles/styles.css">

<!-- Bootstrap -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

<!-- FontAwesome-->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">

<!-- Google -->
<link href='https://fonts.googleapis.com/css?family=Quicksand|Roboto'
	rel='stylesheet' type='text/css'>
</head>

<body class="body">
	<!-- HEADER -->
	<div class="navbar navbar-fixed-top">
		<a class="navbar-brand" href="#">SOSTutors</a>
	</div>

	<!-- SEARCH & FILTER FORM -->
	<div class="container-fluid filterform">
		<div class="row">
			<div class="col-md-5">
				<input class="form-control input-lg" type="text">
			</div>
			<div class="col-md-3">
				<div class="col-xs-5">
					<select name="subject" class="form-control">
						<option value="AllSub">All Subjects</option>
						<option value="Math">Mathematics</option>
						<option value="Science">Science</option>
						<option value="English">English</option>
						<option value="French">French</option>
						<option value="Computers">Computer Science</option>
					</select>
				</div>
			</div>
			<div class="col-md-2 col-sm-6 col-xs-6">
				<button id="advancedbtn" class="btn btn-default input-lg"
					type="button">Advanced</button>
			</div>
			<div class="col-md-2 col-sm-6 col-xs-6">
				<a href="TutoringSessions.jsp"><button id="searchbtn" class="btn btn-default input-lg"
					type="submit">Search</button></a>
			</div>
		</div>
</div>
<div class="container-fluid resultform">
<h1>Welcome, you know what this is. So lets go meet our <a href="Tutors.jsp">Tutors</a>. If not learn about us at our <a href="About.jsp">About</a> page. While navigating this beta site you might come across our <a href="404.jsp">404</a> page, please bear with us.
</h1>
</div>
	<!-- RESULTS FORM -->
	<div class="container-fluid resultform">

		<div class="row">

			<div class="col-sm-6 col-md-6">
				<div class="titlebar">
					<h3>Login</h3>
				</div>
			</div>

			<div class="col-sm-6 col-md-6">
				<div class="titlebar">
					<h3>Register</h3>
				</div>
			</div>

			<div class="col-sm-6 col-md-6">
				<div class="tutorform">
					<h4>Email</h4>
					<input class="form-control input-lg" type="text">
					<h4>Password</h4>
					<input class="form-control input-lg" type="password"> <br />
					<button id="searchbtn" class="btn btn-default input-lg"
						type="submit">Login</button>
				</div>
			</div>

			<div class="col-sm-6 col-md-6">
				<div class="tutorform">
					<h4>Name</h4>
					<input class="form-control input-lg" type="text">
					<h4>Last name</h4>
					<input class="form-control input-lg" type="text">
					<h4>Email</h4>
					<input class="form-control input-lg" type="text">
					<h4>Password</h4>
					<input class="form-control input-lg" type="password"> <br />
					<button id="searchbtn" class="btn btn-default input-lg"
						type="submit">Register</button>
				</div>
			</div>
		</div>

	</div>
</body>

</html>