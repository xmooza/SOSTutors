<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="java.util.ArrayList, com.sos.dao.StudentDAO"%>

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
	StudentDAO dao = null;
	session.setAttribute("currentPage","Profile");
	Student s = (Student)session.getAttribute("currentStudent");
	//ArrayList<Comment> studentComments = new ArrayList<Comment>();
	//ArrayList<Session> studentSessions = new ArrayList<Session>();
	
	ArrayList<Comment> studentComments = dao.getStudentComments(s.getStudentID());
	ArrayList<Session> studentSessions = dao.getStudentSessions(s.getStudentID());
%>
<title><%=s.getFname()%> Profile Page</title>
</head>

<body>

	<!-- CONTENT -->
	<div class="content">
		<img class="background-image" src="images/main-wall.jpg">
<div class="col-sm-6 col-md-6" style="padding: 25px;">
		<h1>
			<%=s.getFname()%>
			Profile Page
		</h1>
		<br> Date Joined:
		<%=s.getDate_joined()%>

		<table style="width: 100%;">
			<% if(studentSessions != null){ 
										for(Session ses: studentSessions){%>

			<tr>
				<td style="width: 60%">
					<div class="list-group">
						<li><%= ses.getSubject() %></li>
					</div>
				</td>
			</tr>
			<%		}
								    } else { %>
			<tr>
				<td>
					<div>No Sessions</div>
				</td>
			</tr>
			<%  } %>
		</table>
		<div>Comments:</div>
		<table style="width: 100%;">
			<% if(studentComments != null){ 
										for(Comment com: studentComments){%>

			<tr>
				<td style="width: 60%">
					<div>
						<li><%= com.getSubject() %></li>
					</div>
				</td>
			</tr>
			<%		}
								    } else { %>
			<tr>
				<td>
					<div>No Comments</div>
				</td>
			</tr>
			<%  } %>
		</table>
		</div>
	</div>
</body>

</html>