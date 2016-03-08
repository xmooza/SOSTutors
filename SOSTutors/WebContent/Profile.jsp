<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="java.util.List, java.util.ArrayList, com.sos.dao.StudentDAO"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Student Scheduling Website">
<meta name="author" content="SOSStudents">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

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
<!-- HEADER -->
<%@include file="Header.jsp"%>

<%
	StudentDAO dao = new StudentDAO();
	session.setAttribute("currentPage", "Profile");
	Student s = (Student) session.getAttribute("currentStudent");
	List<Comment> studentComments = new ArrayList<Comment>();
	List<Session> studentSessions = new ArrayList<Session>();
	List<Message> studentMessages = new ArrayList<Message>();

	studentComments = dao.getStudentComments(s.getStudentID());
	studentSessions = dao.getStudentSessions(s.getStudentID());
	studentMessages = dao.getStudentMessages(s.getStudentID());
%>
<title><%=s.getFname()%>'s Profile Page</title>
</head>

<body>

	<!-- CONTENT -->
	<div class="content">
		<img class="background-image" src="images/main-wall.jpg">
		<div
			class="col-lg-6 col-lg-offset-3 col-md-8 col-md-offset-2 col-sm-8 col-sm-offset-2 col-xs-10 col-xs-offset-1 form blackform"
			style="color: white; margin-top: 25px; margin-bottom: 50px;">
			<h1 style="font-family: 'Quicksand'; text-align: center">
				<%=s.getFname()%>'s Profile Page
			</h1>
			Date Joined: <%=s.getDate_joined()%><br/>
			First Name: <%=s.getFname()%><br/>
			Last Name: <%=s.getLname()%><br/>
			Email: <%=s.getEmail()%>
			<br/><br/>
			<div>Sessions:</div>
			<table>
				<%
					if (studentSessions.size() > 0) {
						for (Session ses : studentSessions) {
				%>

				<tr>
					<td>
						<%=ses.getSubject()%>
					</td>
				</tr>
				<%
					}
					} else {
				%>
				<tr>
					<td>No tutoring sessions scheduled!</td>
				</tr>
				<%
					}
				%>
			</table>
			<br/>
			<div>Messages:</div>
			<table>
				<%
					if (studentMessages.size() > 0) {
						for (Message com : studentMessages) {
				%>
				<tr><td>Subject</td><td>Content</td><td>Date Posted</td><td>Tutor</td></tr>
				<tr>
					<td>
						<%=com.getSubject()%>
					</td>
				</tr>
				<%
					}
					} else {
				%>
				<tr>
					<td>No messages!</td>
				</tr>
				<%
					}
				%>
			</table>
			<br/>
			<div>Comments:</div>
			<table border = "1" cellpadding="10" cellspacing="10">
				<%
					if (studentComments.size() > 0) {
						for (Comment com : studentComments) {
				%>
				<tr>
					<td align = "left">
						<%=com.getSubject()%>
					</td>
					<td align = "left">
						<%=com.getContent()%>
					</td>
					<td align = "left">
						<%=com.getDate_posted()%>
					</td>
					<td align = "left">
						<%=com.getTutors_tutorID()%>
					</td>
				</tr>
				<%
					}
					} else {
				%>
				<tr>
					<td>No comments made about tutors!</td>
				</tr>
				<%
					}
				%>
			</table>
			<br/>
			<br/>
		</div>
	</div>
</body>

</html>