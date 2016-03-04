<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="java.util.ArrayList, java.io.IOException,com.amzi.beans.Student,java.util.Locale,java.util.ResourceBundle"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Tutor Scheduling Website">
    <meta name="author" content="SOSTutors">
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

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
	<title><%=s.getFname()%>'s Profile</title>

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

<body class="body">
	<!-- HEADER -->
	<div class="navbar navbar-fixed-top">
		<a class="navbar-brand" href="#">SOSTutors</a>
		<%
			//EN language is the default, then check if needs to be changed to FR
			String languageSwitch = "FR";
			if (session.getAttribute("language") != null) {
				if (session.getAttribute("language").equals("FR")) {
					languageSwitch = "EN";
				}
			}
		%>
		<form name="langForm" action="<%=session.getAttribute("currentPage")%>.jsp" method="post">
			<input type=hidden name=language value="<%=languageSwitch%>" /> <input class="btn btn-default input-lg" type=submit name=langbutton maxlength=100 value="<%=lang.getString("gotolang")%>" />
		</form>
	</div>

	<!-- TITLE -->
	<div
		style="margin-top: 150px; margin-bottom: 25px; text-align: center; font-family: 'Quicksand'">
		<h1>Profile</h1>
	</div>



	<!-- RESULTS FORM -->
	<div class="container-fluid aboutform">
		<h1>
			<%out.println(lang.getString("welcome"));%>,<%=s.getFname()%>!
		</h1>
	</div>

</body>

</html>