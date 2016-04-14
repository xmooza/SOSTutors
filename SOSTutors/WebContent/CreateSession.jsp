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

<title>SOSTutors - ${currentTutor.fname}'s Session</title>

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


<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAKRdRR12IHYZbO-6jcSXNEmRqjgekDmjA&libraries=places"></script>
<script type="text/javascript" src="js/gps.js"></script>


<!-- Custom Styles -->
<link rel="stylesheet" type="text/css" href="styles/styles.css">


<script>
	$(function() {
		$("#datepicker").datepicker();
	});
	function geoFindMe() {
		var output = document.getElementById("out");

		if (!navigator.geolocation) {
			output.innerHTML = "<p>Geolocation is not supported by your browser</p>";
			return;
		}

		function success(position) {
			var latitude = position.coords.latitude;
			var longitude = position.coords.longitude;
			initMap(latitude, longitude);
		}
		;

		function error() {
			output.innerHTML = "Unable to retrieve your location";
		}
		;

		navigator.geolocation.getCurrentPosition(success, error);
	}
	google.maps.event.addDomListener(window, 'load', geoFindMe);
</script>
</head>

<body>
	<!-- HEADER -->
	<%
		session.setAttribute("currentPage", "TutorRegistration");
	%>
	<%@include file="Header.jsp"%>

	<!-- CONTENT -->
	<div class="content">
		<img class="background-image" src="images/main-wall.jpg">

		<%
			if (session.getAttribute("currentStudent") == null) {
		%>
		<div
			class="container-fluid form blackform col-md-10 col-md-offset-1 col-lg-6 col-lg-offset-3 col-sm-8 col-sm-offset-2 col-xs-10 col-xs-offset-1">
			<div class="row">

				<!-- REGISTER -->
				<div class="col-sm-12 col-md-12"
					style="padding: 25px; color: white;">
					<div class="titlebar">
						<%-- <h4><%out.println(lang.getString("register"));%></h4> --%>
						<h4>Create Your Session</h4>
					</div>
					<br />
					<form name="createForm" action="createSessionServlet" method="post">
						<div class="col-md-6">
							<h4>Subject</h4>
							<select name="subject" class="form-control">
								<option value="AllSub">All Subjects</option>
								<option value="Mathematics"
									${param.subject == "Mathematics" ? "selected='selected'" : ""}>Mathematics</option>
								<option value="Science"
									${param.subject == "Science" ? "selected='selected'" : ""}>Science</option>
								<option value="English"
									${param.subject == "English" ? "selected='selected'" : ""}>English</option>
								<option value="French"
									${param.subject == "French" ? "selected='selected'" : ""}>French</option>
								<option value="Electronics"
									${param.subject == "Electronics" ? "selected='selected'" : ""}>Electronics</option>
							</select>
						</div>
						<div class="col-md-12">
							<h4>Booking Date</h4>
							<input type="text" class="form-control" id="datepicker" />
						</div>

						<div class="col-md-12">
							<h4>Booking Time</h4>
							<input type=text name=time value="" maxlength=100
								class="form-control" value="" />
						</div>
								<div class="col-md-6">
							<h4>Location</h4>
							<input type=text name=location value="" maxlength=100
								class="form-control" value="" id="pac-input"/>
								<div id="map" style="width: 500px; height: 380px;"></div>
						</div>
						<div class="col-md-12">
							<input type="hidden" name="registerUserrole" value="tutor">
							<input type="hidden" name="tutorID" value="${currentTutor.tutorID}">
							<input class="btn btn-default greenbtn" type=submit
								value="Create Session"
								style="float: right; width: 20%; margin-top: 25px;" />
						</div>
					</form>
				</div>

			</div>
		</div>
		<%
			}
		%>
	</div>
</body>

</html>