<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Tutor Scheduling Website">
<meta name="author" content="SOSTutors">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>SOSTutors - ${tutor.fname}'s Profile</title>

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
</head>

<body>
	<!-- HEADER -->
	<%@include file="Header.jsp"%>

	<!-- CONTENT -->
	<div class="content">
		<img class="background-image" src="images/main-wall.jpg">

		<% if (session.getAttribute("currentStudent") == null) {%>
		<div
			class="container-fluid form blackform col-md-10 col-md-offset-1 col-lg-6 col-lg-offset-3 col-sm-8 col-sm-offset-2 col-xs-10 col-xs-offset-1">
			<div class="row">

				<!-- REGISTER -->
				<div class="col-sm-12 col-md-12"
					style="padding: 25px; color: white;">
					<div class="titlebar">
						<%-- <h4><%out.println(lang.getString("register"));%></h4> --%>
						<h4>Create Your profile</h4>
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
							<br /> <br />
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
		<%}%>
	</div>

</body>

</html>