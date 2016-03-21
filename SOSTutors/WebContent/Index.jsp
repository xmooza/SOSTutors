<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Tutor Scheduling Website">
<meta name="author" content="SOSTutors">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>SOSTutors - Home</title>

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
	<%@include file="Header.jsp"%>
	<div class="content" style="background-color: rgba(33, 33, 33, 0.85);">
		<img class="background-image" src="images/main-wall.jpg">
		<div class="jumbotron">
			<div class="container">
				<h1><%out.println(lang.getString("intro1"));%></h1>
				<a href="LoginRegister.jsp" class="btn btn-danger redbtn btn-lg" style="margin-top: 100px;"><%out.println(lang.getString("intro2"));%></a>
				&nbsp;
				&nbsp;
				<a href="TutorRegistration.jsp" class="btn btn-danger redbtn btn-lg" style="margin-top: 100px;"><%out.println(lang.getString("intro3"));%></a>				
			</div>
		</div>
		
		<!-- <h1 style="text-align:center"><i class="fa fa-chevron-down fa-inverse"></i></h1>
		<h1 style="text-align:center; margin-top: -25px"><i class="fa fa-chevron-down fa-inverse"></i></h1>
		
		<br/>
		<br/> -->
		
		<div class="container homepage" style="margin-top:-25px;">
			<!-- <img class="img-circle" ng-src="https://placehold.it/192x192" alt=""src="https://placehold.it/192x192"> -->
			<h2 style="font-weight: bold;"><%out.println(lang.getString("intro4"));%></h2>
			<hr>
			<p style="color: white"><%out.println(lang.getString("intro5"));%></p>

		</div>

		<div class="container homepage">
			<h2 style="font-weight: bold"><%out.println(lang.getString("intro6"));%></h2>
			<hr>
			<div class="row">
				<div class="col-md-4">
				<br/>
					<span class="fa-stack fa-4x"> <i
						class="fa fa-circle fa-stack-2x"></i> <i
						class="fa fa-user fa-stack-1x fa-inverse"></i>
					</span>
					<h3 style="font-weight: bold;"><%out.println(lang.getString("intro12"));%></h3>
					<p><%out.println(lang.getString("intro7"));%>
					</p>
				</div>
				<div class="col-md-4">
				<br/>
					<span class="fa-stack fa-4x"> <i
						class="fa fa-circle fa-stack-2x"></i> <i
						class="fa fa-pencil fa-stack-1x fa-inverse"></i>
					</span>
					<h3 style="font-weight: bold;"><%out.println(lang.getString("intro11"));%></h3>
					<p><%out.println(lang.getString("intro8"));%></p>
				</div>
				<div class="col-md-4">
				<br/>
					<span class="fa-stack fa-4x"> <i
						class="fa fa-circle fa-stack-2x"></i> <i
						class="fa fa-money fa-stack-1x fa-inverse"></i>
					</span>
					<h3 style="font-weight: bold;"><%out.println(lang.getString("intro10"));%></h3>
					<p><%out.println(lang.getString("intro9"));%>
					</p>
				</div>
			</div>
		</div>
		<br/>
		<br/>
		<!-- End container -->

		<!--<div class="container homepage">
			<h2 style="font-weight: bold;">Don't Stress</h2>
			<hr>
			<div class="row">
				<div class="col-md-8">
					<img alt="" src="images/timer.jpg" style="width: 100%; border-radius: 5px;">
				</div>
				<div class="col-md-4">
					<p style="margin-top: 25px;">When there's too much to catch up
						on, or you just need that extra review to get the grade you
						deserve, out tutors will bring you up to speed in no time and help
						you walk into your exam knowing you'll be at your best.</p>

				</div>

			</div>
		</div>-->

	</div>

</body>

</html>