<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
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
<link rel="stylesheet" type="text/css"
	href="styles/jquery-ui-1.9.2.custom.css" />
<link rel="stylesheet" type="text/css" href="styles/fullcalendar.css" />
<link rel="stylesheet" type="text/css" href="styles/view_calendar.css" />
<link rel="stylesheet" type="text/css"
	href="styles/jquery.miniColors.css" />

<body>
	<!-- HEADER -->
	<% session.setAttribute("currentPage", "TutorProfile"); %>
	<%@include file="Header.jsp" %>
    
    <!-- CONTENT -->
	<div class="content">
		<img class="background-image" src="images/main-wall.jpg">
    
	    <div class="container-fluid resultform form blackform">
	
	        <div class="row tutpage">
	
	            <div class="col-md-4">
	                <div class="tutorform form">
	                    <div class="tutimg">
	                        <img src="images/blank_profile.png">
	                    </div>
	                    <div class="tutrating">
	                        <h4><b>$${currentTutor.hourly}/hr</b></h4>
							<h4>
								<c:forEach begin="1" end="5" varStatus="loop">
									<c:if test="${ currentTutor.rating >= loop.index }">
										<i class="fa fa-star"></i>
									</c:if>
									<c:if test="${ currentTutor.rating < loop.index }">
										<i class="fa fa-star-o"></i>
									</c:if>
								</c:forEach>
							</h4>
						</div>
	                    <h3>${ currentTutor.fname } ${ currentTutor.lname }</h3>
	                    <h6><i>${ currentTutor.college }</i></h6>
						<h5><b>No Subjects Currently</b></h5>
						<p>${ currentTutor.profile }</p>
					</div>
	            </div>
	
				<div class="col-md-8">
					<div class="col-md-12">
						<div class="titlebar">
							<h4>Sessions</h4>
						</div>
						<br />
						<div style="text-align: center"><a href="CreateSession.jsp" class="btn  btn-danger">Add a Session</a></div>
						<br/>
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
											<th style="text-align: center">Student</th>
											<th style="text-align: center">Edit</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="session" items="${sessions}">
											<tr>
												<td><fmt:formatDate
														value="${session.key.booking_date}" pattern="EEEEE" /></td>
												<td><fmt:formatDate
														value="${session.key.booking_date}" pattern="MMM-dd" /></td>
												<td><fmt:formatDate
														value="${session.key.booking_date}" pattern="h:mm a" /></td>
												<!--<td>
														<select name="subject" class="form-control">
															<option value="Mathematics">Mathematics</option>
															<option value="Science">Science</option>
															<option value="Physics">Physics</option>
															<option value="Economics">Economics</option>
															<option value="ComputerScience">Computer Science</option>
														</select>
													</td>-->
												<td>${session.key.booking_location}</td>
												<c:if test="${session.value == 'null null'}">
													<td>AVAILABLE</td>
												</c:if>
												<c:if test="${session.value != 'null null'}">
													<td>${session.value}</td>
												</c:if>
												<td>
													<form name="cancelSessionTutor" action="tutorUserProfile"
														method="post">
														<input class="btn btn-danger" type="submit" value="Cancel" />
														<input type="hidden" name="sessionID"
															value="${session.key.sessionID}" />
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
						<br />
						<!-- Calendar Logistics -->
						<input type='hidden' id='calendarEvents' value='${calendarEvents}' />
						<!-- Calendar Div -->
						<div id="calendar"></div>
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
									value="${currentTutor.fname}" maxlength=100
									class="form-control" value="" />

								<h4 style="color: white">
									<%
										out.println(lang.getString("lname"));
									%>
								</h4>
								<input type=text name=loginUseremail
									value="${currentTutor.lname}" maxlength=100
									class="form-control" value="" />

								<h4 style="color: white">
									<%
										out.println(lang.getString("email"));
									%>
								</h4>
								<input type=text name=loginUseremail maxlength=100
									class="form-control" value="${currentTutor.email}" /> <br />
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
	<script type='text/javascript'
		src='http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js'></script>
	<script type='text/javascript' src='js/jquery-ui-1.9.2.custom.min.js'></script>
	<script type='text/javascript' src='js/fullcalendar.js'></script>
	<script type='text/javascript' src='js/view_calendar.js'></script>
</body>

</html>