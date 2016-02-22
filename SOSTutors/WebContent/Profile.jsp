<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="java.util.ArrayList, java.io.IOException,com.amzi.dao.Student,java.util.Locale,java.util.ResourceBundle"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Tutor Scheduling Website">
<meta name="author" content="SOSTutors">

<%
	Student s = null;
	Boolean studentProfile;
	
	session.setAttribute("currentPage","Profile");
	ResourceBundle lang = ResourceBundle.getBundle("Profile_EN");
	
	//if the session language is FR switch to french, otherwise remains english as set above
	if (session.getAttribute("language").toString().equals("FR")){
		lang = ResourceBundle.getBundle("Profile_FR");
	} 
	
	//if the user clicked change language, set to appropriate language
	if (request.getParameter("language") != null){	
		if (request.getParameter("language").equals("FR")){
	lang = ResourceBundle.getBundle("Profile_FR");
	session.setAttribute("language","FR");
		} else {
	lang = ResourceBundle.getBundle("Profile_EN");
	session.setAttribute("language","EN");
		}
	}		
	
	s = (Student)session.getAttribute("currentStudent");
	studentProfile = true;
	
	if(session.getAttribute("currentProfile") != null){

		if(s == null){
	s = (Student) session.getAttribute("currentProfile");
	studentProfile = false;  
		}
	else if(s != null){ 
	
	if(s.getEmail().equals(((Student) session.getAttribute("currentProfile")).getEmail()) == false){
		s = (Student) session.getAttribute("currentProfile");
		studentProfile= false; 
	}
		}
	}
	//ArrayList<String> studentBookings = s.getStudentBookings(s.getStudentID());
%>
<title><%=s.getFName()%>'s Profile
</title>


<!-- Custom Styles-->
<link rel="stylesheet" type="text/css" href="styles/styles.css">

<!-- Bootstrap -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
	integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7"
	crossorigin="anonymous">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"
	integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS"
	crossorigin="anonymous"></script>

<!-- Google -->
<link href='https://fonts.googleapis.com/css?family=Quicksand|Roboto'
	rel='stylesheet' type='text/css'>
</head>

<body class="body">
	<!-- HEADER -->
	<div class="navbar navbar-fixed-top">
		<a class="navbar-brand" href="#">SOSTutors</a>
	</div>

	<!-- TITLE -->
	<div
		style="margin-top: 150px; margin-bottom: 25px; text-align: center; font-family: 'Quicksand'">
		<h1>Profile</h1>
	</div>



	<!-- RESULTS FORM -->
	<div class="container-fluid aboutform">
		<h1>
			<%out.println(lang.getString("welcome"));%>, <%=s.getFName()%>!
		</h1>
	</div>

</body>

</html>