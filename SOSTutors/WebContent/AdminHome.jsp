<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="java.util.List, java.util.ArrayList, com.sos.dao.MessageDAO,com.sos.dao.StudentDAO,com.sos.dao.TutorDAO, com.sos.to.Message, com.sos.to.Tutor, com.sos.to.Student"%>

<!DOCTYPE html>
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


<%
	List<Message> adminMessages = new ArrayList<Message>();
	adminMessages = MessageDAO.getAdminMessages();
	
	List<Tutor> adminTutors = new ArrayList<Tutor>();
	adminTutors = TutorDAO.getAdminTutors();
	
	List<Student> adminStudents= new ArrayList<Student>();
	adminStudents = StudentDAO.getAdminStudents();
%>
<title>SOSTutors - Admin Home's</title>
</head>

<body>

	<%-- <c:import url="/studentProfile" />

<c:set var="studentMessages" value="${requestScope.messages}" />

<h1>List of products from servlet</h1>
<c:forEach var="message" items= "${studentMessages}" varStatus="i">
${message}<br>
</c:forEach>
 --%>

	<!-- CONTENT -->
	<div class="content">
		<img class="background-image" src="images/main-wall.jpg">
		<!--Error and Messages -->
		<%
			if (request.getAttribute("errorMessage") != null) {
		%>
		<div class="container">
			<div class="alert alert-danger">
				<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
				<%=request.getAttribute("errorMessage").toString()%>
			</div>
		</div>
		<%
			}
		%>
		<!--Error and Messages End -->
		<div
			class="col-lg-6 col-lg-offset-3 col-md-8 col-md-offset-2 col-sm-8 col-sm-offset-2 col-xs-10 col-xs-offset-1 form blackform"
			style="color: white; margin-top: 25px; margin-bottom: 50px;">
			<h1 style="font-family: 'Quicksand'; text-align: center">
				Admin's Page</h1>
			<br />
			<div class="titlebar">
				<h4>Messages</h4>
			</div>
			<table style="width: 100%">
				<tr>
					<td>To</td>
					<td>Message</td>
					<td>Date Posted</td>
					<td>Delete</td>
				</tr>
				<%
					if (adminMessages.size() > 0) {
						for (Message com : adminMessages) {
				%>
				<tr>
					<td><%=com.getSubject()%></td>
					<td align="left"><%=com.getContent()%></td>
					<td><%=com.getDate_posted()%></td>
					<td><a href="adminDelete?msgid=<%=com.getNotificationID()%>">Delete</a></td>

				</tr>

				<%
					}
					} else {
				%>
				<tr>
					<td>No Messages!</td>
				</tr>
				<%
					}
				%>
			</table>
			<br /> <br />
			<div class="titlebar">
				<h4>Tutors</h4>
			</div>
			<table style="width: 100%">
				<tr>
					<td>Name</td>
					<td>Email</td>
					<td>College</td>
					<td>Rating</td>
					<td>Date Joined</td>
					<td>Delete</td>
				</tr>
				<%
					if (adminTutors.size() > 0) {
						for (Tutor tut : adminTutors) {
				%>
				<tr>
					<td align="left"><%= tut.getLname() %>, <%= tut.getFname() %></td>
					<td align="left"><%= tut.getEmail() %></td>
					<td align="left"><%= tut.getCollege() %></td>
					<td align="left"><%= tut.getRating() %></td>
					<td align="left"><%= tut.getDate_joined() %></td>
					<td><a href="adminDelete?msgid=">Delete</a></td>
				</tr>

				<%
					}
					} else {
				%>
				<tr>
					<td>No Tutors!</td>
				</tr>
				<%
					}
				%>
			</table>
			<br /> <br />
			<div class="titlebar">
				<h4>Students</h4>
			</div>
			<table style="width: 100%">
				<tr>
					<td>Name</td>
					<td>Email</td>
					<td>Date Joined</td>
					<td>Delete</td>
				</tr>
				<%
					if (adminStudents.size() > 0) {
						for (Student st : adminStudents) {
				%>
				<tr>
					<td align="left"><%= st.getLname() %>, <%= st.getFname() %></td>
					<td align="left"><%= st.getEmail() %></td>
					<td align="left"><%= st.getDate_joined() %></td>
					<td><a href="adminDelete?msgid=">Delete</a></td>

				</tr>

				<%
					}
					} else {
				%>
				<tr>
					<td>No Students!</td>
				</tr>
				<%
					}
				%>
			</table>
			<br /> <br />
		</div>
	</div>
</body>

</html>