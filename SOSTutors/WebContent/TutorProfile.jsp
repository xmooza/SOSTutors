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
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

    <!-- Google -->
    <link href='https://fonts.googleapis.com/css?family=Quicksand|Roboto' rel='stylesheet' type='text/css'>

    <!-- FontAwesome -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">

    <!-- Custom Styles -->
    <link rel="stylesheet" type="text/css" href="styles/styles.css">
</head>

<body>
	<!-- HEADER -->
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
	                        <h4><b>$${tutor.hourly}/hr</b></h4>
							<h4>
								<c:forEach begin="1" end="5" varStatus="loop">
									<c:if test="${ tutor.rating >= loop.index }">
										<i class="fa fa-star"></i>
									</c:if>
									<c:if test="${ tutor.rating < loop.index }">
										<i class="fa fa-star-o"></i>
									</c:if>
								</c:forEach>
							</h4>
						</div>
	                    <h3>${ tutor.fname } ${ tutor.lname }</h3>
	                    <h6><i>${ tutor.college }</i></h6>
						<h5><b>No Subjects Currently</b></h5>
						<p>${ tutor.profile }</p>
					</div>
	            </div>
	
	            <div class="col-md-8">
	
	                <div class="row">
	                    <div class="col-md-12">
	                        <div class="titlebar">
	                            <h4>Calendar</h4>
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
													<td><fmt:formatDate value="${session.booking_date}" pattern="MMMMM-dd"/></td>
													<td><fmt:formatDate value="${session.booking_date}" pattern="h:mm a"/></td>
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
													<td>
														<form>
															<c:if test="${currentUser == null}">
																<input class="btn btn-default greenbtn" type="submit"
																	value="Select" disabled />
															</c:if>
															<c:if test="${currentUser != null}">
																<input class="btn btn-default greenbtn" type="submit"
																	value="Select" />
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
	                        <div class="titlebar">
	                            <h4>Reviews</h4>
	                    	</div>

							<c:if test="${comments.size() < 1}">
								<br />
								<h5 style="text-align: center; color: white">There are no reviews for this tutor yet.</h5>
								<br />
							</c:if>

							<c:forEach var="comment" items="${comments}">
	                        	<blockquote>
	                            	<p>${comment.value.content}</p>
	                            	<footer>${comment.key} | ${comment.value.subject} <i>${comment.value.date_posted}</i></footer>
	                        	</blockquote>
                        	</c:forEach>

	                    </div>
	                </div>
	            </div>
	        </div>
	    
	    </div>
    </div>
    
</body>

</html>