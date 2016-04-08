<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Tutor Scheduling Website">
<meta name="author" content="SOSTutors">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>SOSTutors - Contact</title>

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
<%session.setAttribute("currentPage", "Contact");%>
</head>

<body>
	<!-- HEADER -->
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
				<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
				<%=lang.getString(request.getAttribute("errorMessage")
						.toString())%>
			</div>
		</div>
		<%
			}
		%>
		<!--Error and Messages End -->
		
		<div
			class="col-lg-6 col-lg-offset-3 col-md-8 col-md-offset-2 col-sm-8 col-sm-offset-2 col-xs-10 col-xs-offset-1 form blackform"
			style="text-align: left; color: white; margin-top: 25px; margin-bottom: 50px;">
			<br />
			<h1 style="font-family: 'Quicksand'; text-align: center">Contact</h1>
			<br />
			<p style="text-align: center"><%out.println(lang.getString("intro"));%></p>
			<br />
			<form class="form-horizontal" action="contactSend" method="post">

				<h4><%out.println(lang.getString("name"));%></h4>
				<input type="text" class="form-control" id="name" name="conUsername">
				<h4><%out.println(lang.getString("email"));%></h4>
				<input type="text" class="form-control" id="email"
					name="conUseremail">
				<h4><%out.println(lang.getString("message"));%></h4>
				<textarea class="form-control" id="message" rows="10"
					name="conUsercontent"></textarea>
				<br> <input type="hidden" name="conUsersubject" value="admin">
				<button id="searchbtn" class="btn btn-default greenbtn"
					type="submit" style="margin: auto; width: 30%; float: right"><%out.println(lang.getString("send"));%></button>
				<br /> <br />
			</form>
			<br />
		</div>
	</div>

	<br />
	<br />
</body>

</html>