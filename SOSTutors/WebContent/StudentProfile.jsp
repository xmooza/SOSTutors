<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Tutor Scheduling Website">
    <meta name="author" content="SOSTutors">
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

    <title>SOSTutors - ${tutor.fname}'s Profile</title>

    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

    <!-- Google -->
    <link href='https://fonts.googleapis.com/css?family=Quicksand|Roboto' rel='stylesheet' type='text/css'>

    <!-- FontAwesome -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">

    <!-- Custom Styles -->
    <link rel="stylesheet" type="text/css" href="styles/styles.css">
    <link rel="stylesheet" type="text/css" href="styles/fullcalendar.css">
    <link rel="stylesheet" type="text/css" href="styles/fullcalendar.print.css" media="print">
    
    <!-- Custom Script -->
    <script type="text/javascript" src="scripts/fullcalendar.js"></script>
    <script type="text/javascript" src="scripts/gcal.js"></script>
</head>

<body>
	<!-- HEADER -->
	<%@include file="Header.jsp" %>
    
    <!-- CONTENT -->
	<div class="content">
		<img class="background-image" src="images/main-wall.jpg">
    
	    <div class="container-fluid resultform form blackform">
	
	        <div class="row">
	        
				<div class="col-md-4" style="padding: 25px;">
					
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
				</div>
				<div class="col-md-8" style="padding: 25px;">
					<div class="col-md-12">
						<div class="titlebar" style="margin-bottom: 25px;">
							<h4>Edit profile</h4>
						</div>
						<form name="LoginForm" action="loginServlet" method="post">
							<h4 style="color: white"><%out.println(lang.getString("fname"));%></h4>
							<input type=text name=loginUseremail value="" maxlength=100 
								class="form-control" value="" />
								
							<h4 style="color: white"><%out.println(lang.getString("lname"));%></h4>
							<input type=text name=loginUseremail value="" maxlength=100
									class="form-control" value="" />
							
							<h4 style="color: white"><%out.println(lang.getString("email"));%></h4>
							<input type=text name=loginUseremail maxlength=100 class="form-control" value="" />
							<br />
							<br />
							<br />
							
							<h4 style="color: white">Previous Password</h4>
								<input type=password name=registerUserpassword maxlength=100
									class="form-control" />
							<br />
							<h4 style="color: white">New Password</h4>
								<input type=password name=registerUserpassword maxlength=100
									class="form-control" />
							<br />
							<br />
							<input class="btn btn-default greenbtn buttonPadding" type=submit value="Update Profile" style="float: right; width: 25%; margin-bottom: 100px;"/>
							<br />
							<br />
							<br />
						</form>
					</div>
					<!-- <div class="titlebar">
						<div class="collapse navbar-collapse " id="header-collapse">
							<ul class="nav navbar-nav ">
								<li class="active"><a href="Index.jsp">Edit profile</a></li>
								<li><a href="#">Course</a></li>
								<li><a href="#">Contact</a></li>
								<li><a href="#">Calendar</a></li>
							</ul>
						</div>
					</div> -->
					<!-- <div id="calendar"></div>
						<div id="createEventModal" class="modal hide" tabindex="-1" role="dialog" aria-labelledby="myModalLabel1" aria-hidden="true">
						    <div class="modal-header">
						        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
						        <h3 id="myModalLabel1">Create Appointment</h3>
						    </div>
						    <div class="modal-body">
						    <form id="createAppointmentForm" class="form-horizontal">
						        <div class="control-group">
						            <label class="control-label" for="inputPatient">Patient:</label>
						            <div class="controls">
						                <input type="text" name="patientName" id="patientName" tyle="margin: 0 auto;" data-provide="typeahead" data-items="4" data-source="[&quot;Value 1&quot;,&quot;Value 2&quot;,&quot;Value 3&quot;]">
						                  <input type="hidden" id="apptStartTime"/>
						                  <input type="hidden" id="apptEndTime"/>
						                  <input type="hidden" id="apptAllDay" />
						            </div>
						        </div>
						        <div class="control-group">
						            <label class="control-label" for="when">When:</label>
						            <div class="controls controls-row" id="when" style="margin-top:5px;">
						            </div>
						        </div>
						    </form>
						    </div>
						    <div class="modal-footer">
						        <button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button>
						        <button type="submit" class="btn btn-primary" id="submitButton">Save</button>
						    </div>
						</div> -->
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
		                                        <th style="text-align: center">Book</th>
		                                    </tr>
		                                </thead>
		                                <tbody>             
											<c:forEach var="session" items="${sessions}">
												<tr>
													<td><fmt:formatDate value="${session.booking_date}" pattern="EEEEE"/></td>
													<td><fmt:formatDate value="${session.booking_date}" pattern="MMM-dd"/></td>
													<td><fmt:formatDate value="${session.booking_date}" pattern="h:mm a"/></td>
													<td>
														<select name="subject" class="form-control">
															<option value="Mathematics">Mathematics</option>
															<option value="Science">Science</option>
															<option value="Physics">Physics</option>
															<option value="Economics">Economics</option>
															<option value="ComputerScience">Computer Science</option>
														</select>
													</td>
													<td>${session.booking_location}</td>
													<td>
														<form name="selectSession" action="tutorProfile" method="post">
															<c:if test="${currentStudent == null}">
																<input class="btn btn-default greenbtn" type="submit" value="Select" disabled />
															</c:if>
															<c:if test="${currentStudent != null}">
																<input class="btn btn-default greenbtn" type="submit" value="Select" />
																<input type="hidden" name="sessionID" value="${session.sessionID}" />
																<input type="hidden" name="tutorID"	value="${tutor.tutorID}" />
															</c:if>
														</form>
													</td>
												</tr>
											</c:forEach>
										</tbody>
		                            </table>
								</div>
	                        </c:if>
	                        
							<c:if test="${sessions.size() < 1}">
								<br />
								<h5 style="text-align: center; color: white">There are no available sessions for this tutor yet.</h5>
								<br />
							</c:if>
					</div>
					<div class="col-md-12">
                        <div class="titlebar" style="margin-top: 50px;">
                            <h4>Calendar</h4>
                        </div>
					
					
					
					
					
				</div>
				
				
					
			</div>
				
				
					
	        </div>
 
	    </div>
    </div>
    
</body>

</html>