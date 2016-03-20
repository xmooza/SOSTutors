<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

<!-- Stylesheets etc -->
	<link rel="stylesheet" type="text/css" href="styles/jquery-ui-1.9.2.custom.css" />
	<link rel="stylesheet" type="text/css" href="styles/fullcalendar.css" />
	<link rel="stylesheet" type="text/css" href="styles/view_calendar.css" />
	<link rel="stylesheet" type="text/css" href="styles/jquery.miniColors.css" />
<body>
	<!-- HEADER -->
	<%
		session.setAttribute("currentPage", "StudentProfile");
	%>
	<%@include file="Header.jsp"%>

	<!-- CONTENT -->
	<div class="content">
		<img class="background-image" src="images/main-wall.jpg">

		<div class="container-fluid resultform form blackform">

			<div class="row">

				<!--<div class="col-md-4" style="padding: 25px;">
					
					<div class="titlebar">
						<h4>Profile Detail</h4>
					</div>
					<br/>
					<div class=" form profileContainer col-md-12">
						
							<h1 style="font-weight: bold;">Jordan Gignac</h1>

							<h2>General</h2>
							<i class="fa fa-briefcase fa-lg"> Status</i><br> Student <br>

							<h2>Contact</h2>
							<i class="fa fa-phone fa-lg"> Phone</i><br> 613-890-7047 <br>
							<br> <i class="fa fa-envelope fa-lg"> Email</i><br>
							aboubacarkonde09@gmail.com <br>

							<h2>About me</h2>
							bla bla bla bla bla bla bla bla bla bla bla bla <br>
					</div>
				</div>-->

				<div class="col-md-4">
					<div class="tutorform form col-md-12" style="padding-left: 20px;">
						<h2 style="font-weight: bold">${currentStudent.fname}
							${currentStudent.lname}</h2>
						<br />
						<h5 style="margin-bottom: 20px;">
							<i class="fa fa-briefcase fa-lg"></i>&nbsp;&nbsp;<b>Status :</b>
							Student
						</h5>
						<h5 style="margin-bottom: 20px;">
							<i class="fa fa-envelope fa-lg"></i>&nbsp;&nbsp;<b>Email :</b>
							${currentStudent.email}
						</h5>
						<h5 style="margin-bottom: 20px;">
							<i class="fa fa-clock-o fa-lg"></i>&nbsp;&nbsp;<b>Date Joined
								:</b> ${currentStudent.date_joined}
						</h5>
						<h5 style="margin-bottom: 20px;">
							<i class="fa fa-pencil fa-lg"></i>&nbsp;&nbsp;Description :
							${currentStudent.profile}
						</h5>
					</div>
				</div>

				<div class="col-md-8">
					<div class="col-md-12">
						<div class="titlebar">
							<h4>Sessions</h4>
						</div>

						<c:if test="${sessions.size() > 0}">
							<div class="table-responsive">
								<table class="table table-striped">
									<thead>
										<tr>
											<th style="text-align: center">Day</th>
											<th style="text-align: center">Date</th>
											<th style="text-align: center">Time</th>
											<!--<th style="text-align: center">Subject</th>-->
											<th style="text-align: center">Location</th>
											<th style="text-align: center">Tutor</th>
											<th style="text-align: center">Cancel</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="session" items="${sessions}">
											<tr>
												<td><fmt:formatDate value="${session.value.booking_date}"
														pattern="EEEEE" /></td>
												<td><fmt:formatDate value="${session.value.booking_date}"
														pattern="MMM-dd" /></td>
												<td><fmt:formatDate value="${session.value.booking_date}"
														pattern="h:mm a" /></td>
												<!--<td>
														<select name="subject" class="form-control">
															<option value="Mathematics">Mathematics</option>
															<option value="Science">Science</option>
															<option value="Physics">Physics</option>
															<option value="Economics">Economics</option>
															<option value="ComputerScience">Computer Science</option>
														</select>
													</td>-->
												<td>${session.value.booking_location}</td>
												<td>${session.key}</td>
												<td>
													<form name="cancelSession" action="studentProfile"
														method="post">
														<input class="btn btn-danger" type="submit" value="Cancel" />
														<input type="hidden" name="sessionID"
															value="${session.value.sessionID}" />
													</form>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</c:if>

						<c:if test="${sessions.size() < 1 || sessions == null}">
							<br />
							<h5 style="text-align: center; color: white">You have
								scheduled no sessions yet.</h5>
							<br />
						</c:if>

					</div>
					<div class="col-md-12">
						<div class="titlebar">
							<h4>Calendar</h4>
						</div>
						<c:if
							test="${calendarEntries.size() < 1 || calendarEntries == null}">
							<br />
							<!-- Calendar div -->
							<div id="calendar">
							</div>
				
							<!-- Event generation -->
							<div id="event_generation_wrapper">
								<div class='left'>
									<div class='text'>Background:</div><br /> 	
									<div class='text'>Border:</div><br />
									<div class='text'>Text:</div><br />	
								</div>
								<div class='right'>
									<input id="txt_background_color" type='hidden' class='color_picker' value='#2795C3' /><br />
									<input id="txt_border_color" type='hidden' class='color_picker' value='#6AB3D3' /><br />
									<input id="txt_text_color" type='hidden' class='color_picker' value='#ffffff' /><br />
								</div>
								<input id='txt_title' type='text' value='Title' /><br />
								<textarea id='txt_description'>Description</textarea><br />
								<input id='txt_price' type='text' value='5.00' /><br />
								<input id='txt_available' type='text' value='5' /><br />
								<input id="btn_gen_event" type="button" value="New Template" class='btn' />
								<input id="btn_update_event" type="button" value="Update Event" class='btn'/>
								<input id="txt_current_event" type="hidden" value="" />
							</div>
				
							<!-- Booking types list -->
							<div id='external_events'>
								<div id='external_event_template' class='external-event ui-draggable'>One Hour</div>
							</div>
							<!-- <h5 style="text-align: center; color: white">Coming Soon...</h5> -->
							<br />
						</c:if>
					</div>

					<div class="col-md-12">
						<div class="titlebar">
							<h4>Edit profile</h4>
						</div>
						<div style="padding: 0px 10px 0px 10px;">
							<form name="LoginForm" action="loginServlet" method="post">
								<h4 style="color: white">
									<%
										out.println(lang.getString("fname"));
									%>
								</h4>
								<input type=text name=loginUseremail
									value="${currentStudent.fname}" maxlength=100
									class="form-control" value="" />

								<h4 style="color: white">
									<%
										out.println(lang.getString("lname"));
									%>
								</h4>
								<input type=text name=loginUseremail
									value="${currentStudent.lname}" maxlength=100
									class="form-control" value="" />

								<h4 style="color: white">
									<%
										out.println(lang.getString("email"));
									%>
								</h4>
								<input type=text name=loginUseremail maxlength=100
									class="form-control" value="${currentStudent.email}" /> <br />
								<br />

								<h4 style="color: white">Previous Password</h4>
								<input type=password name=registerUserpassword maxlength=100
									class="form-control" />
								<h4 style="color: white">New Password</h4>
								<input type=password name=registerUserpassword maxlength=100
									class="form-control" /> <br /> <br /> <input
									class="btn btn-default greenbtn buttonPadding" type=submit
									value="Update Profile" style="float: right; width: 25%;" /> <br />
								<br /> <br />
							</form>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
	
	<!-- Include scripts at bottom to aid dom loading and prevent hangs -->
	<script type='text/javascript' src='http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js'></script>
	<script type='text/javascript' src='js/jquery-ui-1.9.2.custom.min.js'></script>
	<script type='text/javascript' src='js/fullcalendar.js'></script>
	<script type='text/javascript' src='js/view_calendar.js'></script>
	<script type='text/javascript' src='js/jquery.miniColors.js'></script>
</body>

</html>