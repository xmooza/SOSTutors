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
<%
	session.setAttribute("currentPage", "Profile");
%>
<%@include file="Header.jsp"%>

<%
	StudentDAO dao = new StudentDAO();
	session.setAttribute("currentPage", "Profile");
	Student s = (Student) session.getAttribute("currentStudent");
	//List<Comment> studentComments = new ArrayList<Comment>();
	//List<Session> studentSessions = new ArrayList<Session>();
	//List<Message> studentMessages = new ArrayList<Message>();

	List<Comment> studentComments = dao.getStudentComments(s.getStudentID());
	List<Session> studentSessions = dao.getStudentSessions(s.getStudentID());
	List<Message> studentMessages = dao.getStudentMessages(s.getStudentID());
%>
<title>SOSTutors - <%=s.getFname()%>'s <%
	out.println(lang.getString("profilepage"));
%></title>
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
				<%=s.getFname()%>'s
				<%
					out.println(lang.getString("profilepage"));
				%>
			</h1>
			<%
				out.println(lang.getString("joined"));
			%>:
			<%=s.getDate_joined()%><br />
			<%
				out.println(lang.getString("fname"));
			%>:
			<%=s.getFname()%><br />
			<%
				out.println(lang.getString("lname"));
			%>:
			<%=s.getLname()%><br />
			<%
				out.println(lang.getString("email"));
			%>:
			<%=s.getEmail()%>
			<br /> <br />
			<div class="titlebar">
				<h4>
					<%
						out.println(lang.getString("sessions"));
					%>
				</h4>
			</div>
			<table>
				<%
					if (studentSessions.size() > 0) { %>
				<tr>
					<td>
						<%
							out.println(lang.getString("subject"));
						%>
					</td>
					<td>
						<%
							out.println(lang.getString("booking_date"));
						%>
					</td>
					<td>
						<%
							out.println(lang.getString("booking_location"));
						%>
					</td>
					<td>
						<%
							out.println(lang.getString("categories_categoryID"));
						%>
					</td>
					<td>
						<%
							out.println(lang.getString("tutors_tutorID"));
						%>
					</td>
				</tr>
				<%for (Session ses : studentSessions) {
				%>

				<tr>
					<td><%=ses.getSubject()%></td>
				</tr>
				<%
					}
					} else {
				%>
				<tr>
					<td>
						<%
							out.println(lang.getString("nosessions"));
						%>
					</td>
				</tr>
				<%
					}
				%>
			</table>
			<br />
			<div class="titlebar">
				<h4>
					<%
						out.println(lang.getString("messages"));
					%>
				</h4>
			</div>
			<table>
				<%
					if (studentMessages.size() > 0) { %>
				<tr>
					<td>
						<%
							out.println(lang.getString("subject"));
						%>
					</td>
					<td>
						<%
							out.println(lang.getString("content"));
						%>
					</td>
					<td>
						<%
							out.println(lang.getString("posted"));
						%>
					</td>
					<td>
						<%
							out.println(lang.getString("tutorid"));
						%>
					</td>
				</tr>
				<%for (Message com : studentMessages) {
				%>
				<tr>
					<td align="left"><%=com.getSubject()%></td>
					<td align="left"><%=com.getContent()%></td>
					<td align="left"><%=com.getDate_posted()%></td>
					<td align="left"><%=com.getTutors_tutorID()%></td>
				</tr>
				<%
					}
					} else {
				%>
				<tr>
					<td>
						<%
							out.println(lang.getString("nomessages"));
						%>
					</td>
				</tr>
				<%
					}
				%>
			</table>
			<br />
			<div class="titlebar">
				<h4>
					<%
						out.println(lang.getString("comments"));
					%>
				</h4>
			</div>
			<table border="5" cellpadding="10" cellspacing="10">

				<%
					if (studentComments.size() > 0) { %>
				<tr>
					<td>
						<%
							out.println(lang.getString("subject"));
						%>
					</td>
					<td>
						<%
							out.println(lang.getString("content"));
						%>
					</td>
					<td>
						<%
							out.println(lang.getString("posted"));
						%>
					</td>
					<td>
						<%
							out.println(lang.getString("tutorid"));
						%>
					</td>
				</tr>
				<%for (Comment com : studentComments) {
				%>

				<tr>
					<td align="left"><%=com.getSubject()%></td>
					<td align="left"><%=com.getContent()%></td>
					<td align="left"><%=com.getDate_posted()%></td>
					<td align="left"><%=com.getTutors_tutorID()%></td>
				</tr>
				<%
					}
					} else {
				%>

				<tr>
					<td>
						<%
							out.println(lang.getString("nocomments"));
						%>
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