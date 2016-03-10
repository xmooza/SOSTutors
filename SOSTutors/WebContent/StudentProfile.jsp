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
								:</b> ${currentStudent.email}
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
												<td><fmt:formatDate value="${session.booking_date}"
														pattern="EEEEE" /></td>
												<td><fmt:formatDate value="${session.booking_date}"
														pattern="MMM-dd" /></td>
												<td><fmt:formatDate value="${session.booking_date}"
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
												<td>${session.booking_location}</td>
												<td>TODO: SQL JOIN</td>
												<td>
													<form name="cancelSession" action="studentProfile"
														method="post">
														<input class="btn btn-danger" type="submit" value="Cancel" />
														<input type="hidden" name="sessionID"
															value="${session.sessionID}" />
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
							<h5 style="text-align: center; color: white">Coming Soon...</h5>
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
</body>

</html>