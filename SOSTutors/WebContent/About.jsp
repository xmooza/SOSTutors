<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Tutor Scheduling Website">
    <meta name="author" content="SOSTutors">
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

    <title>SOSTutors - About</title>

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
	<% session.setAttribute("currentPage", "About"); %>
	<%@include file="Header.jsp" %>
    
    <!-- CONTENT -->
	<div class="content">
		<img class="background-image" src="images/main-wall.jpg">

		<div
			class="col-lg-6 col-lg-offset-3 col-md-8 col-md-offset-2 col-sm-8 col-sm-offset-2 col-xs-10 col-xs-offset-1 form blackform"
			style="text-align: center; color: white; margin-top: 25px; margin-bottom: 50px;">
			<br />
			<h1 style="font-family: 'Quicksand'">About</h1>
			<br />
			<p>
             At SOSTutors we strive to match you with a tutor that will suit your specific needs and help you 
             succeed in the areas of study that you are struggling in. Students can find tutors that fit their 
             specific schedule and have any number of sessions with them. After a session don’t forget to rate 
             the tutor in order to help other students find which tutors fit their specific style of studying. 
			 SOSTutors was originally developed a group of five students from Algonquin College, who felt that no 
			 tools existed for students who were looking for tutors to help them with their classes. To counter this 
			 issue, SOSTutors was developed in 2016 and has been helping students since. The original founders include
			 Jordan Gignac, Harry Hidayat, Aboubacar Konde, Muzammil Mirza, and Safi Naseem. We wish you luck with your 
			 studies, and don’t forget, SOSTutors is here to help you build your future.
 <br /> <br />
			</p>
			<br />
		</div>
	</div>
	
	<br />
	<br />
</body>

</html>