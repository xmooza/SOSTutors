<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
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
			<div class="alert alert-danger">
				<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
				<%=lang.getString(request.getAttribute("errorMessage").toString())%>
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
					<br />
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
					<div class="col-md-12">
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
				</div>

				<!-- REGISTER -->
				<div class="col-sm-12 col-md-12"
					style="padding: 25px; color: white;">
					<div class="titlebar">
						<%-- <h4><%out.println(lang.getString("register"));%></h4> --%>
						<h4>Register as Student</h4>
					</div>
					<br />
					<form name="LoginForm" action="registerServlet" method="post">
						<div class="col-md-12">
							<p>Here you can register as a student and have isntant access
								to scheduling and attending tutoring sessions with any of the
								large number of tutors we currently have working to help you be
								a better student!</p>
						</div>
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
							<br />
							<h4>Description</h4>
							<textarea class="form-control" id="description" rows="5"
								name=registerUserprofile></textarea>
						</div>

						<div class="col-md-12">
							<input type="hidden" name="registerUserrole" value="student">
							<br /> <input class="btn btn-default greenbtn" type=submit
								value="Register Student"
								style="float: right; width: 30%; margin-top: 25px" />
						</div>
					</form>
				</div>

				<!-- REGISTER -->
				<div class="col-sm-12 col-md-12"
					style="padding: 25px; color: white;">
					<div class="titlebar">
						<%-- <h4><%out.println(lang.getString("register"));%></h4> --%>
						<h4>Register as Tutor</h4>
					</div>
					<br />
					<form name="LoginForm" action="registerServlet" method="post">
					<%-- 
						<div class="col-sm-4">
							<img ng-src="https://placehold.it/192x192" alt=""
								src="https://placehold.it/192x192">
						</div>
					
						<div class="col-sm-8">
							<h4>Your Photo</h4>
							<p>Make a first good impression, the better your photo the
								more bookings you will receive. The best photos are professional
								looking headshots, not full-body shots.In other words, just your
								shoulders and up ideally. And make sure it’s just you in the
								photo. Think about which photo you would want to send in to get
								a job interview that is what we need.</p>
							<input class="btn btn-default greenbtn" type=submit value="<% out.println(lang.getString("register")); %>" 
		                    style="float: right; width: 30%; margin-top: 25px"/>
							<input class="btn btn-default greenbtn" type="file" name="file"
								value="Upload image"
								style="float: right; width: 30%; margin-top: 25px" /> <br>
						</div>
 --%>
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
									out.println(lang.getString("email"));
								%>
							</h4>
							<input type=text name=registerUseremail value="" maxlength=100
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
									out.println(lang.getString("password"));
								%>
							</h4>
							<input type=password name=registerUserpassword maxlength=100
								class="form-control" />
						</div>

						<div class="col-md-6">
							<h4>
								<%-- <%
									out.println(lang.getString("email"));
								%> --%>
								Hourly Rate:
							</h4>
							<input type=text name=registerUserhourly value="" maxlength=100
								class="form-control" value="" />
						</div>
						<div class="col-md-6 col-md-offset-6"></div>

						<div class="col-md-6">
							<h4>
								<%-- <%
									out.println(lang.getString("password"));
								%> --%>
								College:
							</h4>
							<input type=text name=registerUsercollege maxlength=100
								class="form-control" />
						</div>
						<div class="col-md-6 col-md-offset-6"></div>
						<div class="col-md-12">
							<br />
							<h4>About me:</h4>
							<textarea name=registerUserprofile class="form-control"
								id="description" rows="8"></textarea>
						</div>
						<div class="col-md-12">
							<input type="hidden" name="registerUserrole" value="tutor">
							<input class="btn btn-default greenbtn" type=submit
								value="<% out.println(lang.getString("register")); %>"
								style="float: right; width: 20%; margin-top: 25px; margin-bottom: 35px" />
						</div>

						<!-- <div class="col-md-4 col-md-offset-6"">
							<div class="btn-group" role="group" aria-label="...">
								<button type="button" class="btn btn-default">1</button>
								<button type="button" class="btn btn-default">2</button>
								<button type="button" class="btn btn-default">3</button>
								<button type="button" class="btn btn-default">...</button>
							</div>
						</div> -->
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