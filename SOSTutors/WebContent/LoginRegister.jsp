<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Tutor Scheduling Website">
<meta name="author" content="SOSTutors">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>SOSTutors - Login/Register</title>

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
<%
	session.setAttribute("currentPage", "Index");
%>
</head>

<body>
	<!-- HEADER -->
	<%
		session.setAttribute("currentPage", "LoginRegister");
	%>
	<%@include file="Header.jsp"%>

	<!-- CONTENT -->
	<div class="content">
		<img class="background-image" src="images/main-wall.jpg">

		<!--Error and Messages -->
		<%
			if (request.getAttribute("errorMessage") != null) {
		%>
		<div class="container">
			<div class="alert alert-info">
				<<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
				<%=lang.getString(request.getAttribute("errorMessage")
						.toString())%>
			</div>
		</div>
		<%
			}
		%>
		<!--Error and Messages End -->
		<%
			if (session.getAttribute("currentStudent") == null) {
		%>
		<div
			class="container-fluid form blackform col-md-10 col-md-offset-1 col-lg-6 col-lg-offset-3 col-sm-8 col-sm-offset-2 col-xs-10 col-xs-offset-1">
			<div class="row">

				<!-- INFO -->
				<div class="col-sm-6 col-md-6"
					style="padding: 50px 25px 25px 25px; color: white; text-align: center;">
					<p>
						<%
							out.println(lang.getString("intro1"));
						%>
					</p>
					<br />
					<p>
						<%
							out.println(lang.getString("intro2"));
						%>
					
				</div>

				<!-- LOGIN -->
				<div class="col-sm-6 col-md-6" style="padding: 25px;">
					<div class="titlebar">
						<h4>
							<%
								out.println(lang.getString("login"));
							%>
						</h4>
					</div>
					<br />
					<form name="LoginForm" action="loginServlet" method="post">
						<h4 style="color: white">
							<%
								out.println(lang.getString("email"));
							%>
						</h4>
						<input type=text name=loginUseremail maxlength=100
							class="form-control" value="" /><br />

						<h4 style="color: white">
							<%
								out.println(lang.getString("password"));
							%>
						</h4>
						<input type=password name=loginUserpassword maxlength=100
							class="form-control" /> <br /> <br /> <input
							class="btn btn-default greenbtn" type=submit
							value="<%out.println(lang.getString("login"));%>"
							style="float: right; width: 45%" /> <br />
					</form>
				</div>

				<!-- REGISTER -->
				<div class="col-sm-12 col-md-12"
					style="padding: 25px; color: white;">
					<div class="titlebar">
						<h4>
							<%
								out.println(lang.getString("register"));
							%>
						</h4>
					</div>
					<br />
					<form name="LoginForm" action="registerServlet" method="post">

						<div class="col-md-6">
							<h4>
								<%
									out.println(lang.getString("fname"));
								%>
							</h4>
							<input type=text name=registerUserfname value="" maxlength=100
								class="form-control" value="" />
						</div>

						<div class="col-md-6">
							<h4>
								<%
									out.println(lang.getString("lname"));
								%>
							</h4>
							<input type=text name=registerUserlname value="" maxlength=100
								class="form-control" value="" />
						</div>

						<div class="col-md-6">
							<h4>
								<%
									out.println(lang.getString("email"));
								%>
							</h4>
							<input type=text name=registerUseremail value="" maxlength=100
								class="form-control" value="" />
						</div>

						<div class="col-md-6">
							<h4>
								<%
									out.println(lang.getString("password"));
								%>
							</h4>
							<input type=password name=registerUserpassword maxlength=100
								class="form-control" />
						</div>
						<!--
						<div class="col-md-12">
							<br /> <br /> <label class="radio-inline"> <input
								type="radio" name="optradio"><b>Student</b>
							</label> <label class="radio-inline"> <input type="radio"
								name="optradio"><b>Tutor</b>
							</label> <br /> <br />
						</div>
						-->
						<div class="col-md-12">
							<h4>Description</h4>
							<textarea class="form-control" id="description" rows="5"
								name=registerUserprofile></textarea>
						</div>

						<div class="col-md-12">
							<input type="hidden" name="registerUserrole" value="student">
							<input class="btn btn-default greenbtn" type=submit
								value="<%out.println(lang.getString("register"));%>"
								style="float: right; width: 30%; margin-top: 25px" />
						</div>
						<br />
					</form>

				</div>

			</div>
		</div>
		<%
			}
		%>
	</div>

	<br />
	<br />
</body>
</html>