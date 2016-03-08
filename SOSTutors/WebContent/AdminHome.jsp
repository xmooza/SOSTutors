<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" import="java.util.List, java.util.ArrayList, com.sos.dao.MessageDAO, com.sos.to.Message" %>

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


<%
	MessageDAO dao = new MessageDAO();

	List<Message> adminMessages = new ArrayList<Message>();

	adminMessages = dao.getAdminMessages();
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
		<div
			class="col-lg-6 col-lg-offset-3 col-md-8 col-md-offset-2 col-sm-8 col-sm-offset-2 col-xs-10 col-xs-offset-1 form blackform"
			style="color: white; margin-top: 25px; margin-bottom: 50px;">
			<h1 style="font-family: 'Quicksand'; text-align: center">
		Admin's Page
			</h1>
			<br />
			<div class="titlebar">
				<h4>
				Messages
				</h4>
			</div>
			<table border=5>
			<tr><td>To</td><td>Message</td><td>Date Posted</td></tr>
				<%
					if (adminMessages.size() > 0) {
						for (Message com : adminMessages) {
				%>
				<tr>
					<td><%=com.getSubject()%></td>
						<td align = "left"><%=com.getContent()%></td>
							<td><%= com.getDate_posted() %></td>
				</tr>
				
				<%
					}
					} else {
				%>
				<tr>
					<td>
					No Messages!
					</td>
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