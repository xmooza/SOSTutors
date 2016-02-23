<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Tutor Scheduling Website">
    <meta name="author" content="SOSTutors">
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

    <title>SOSTutors - Contact</title>

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
    
    <!-- Language Bundles -->
    <%@include file="Lang.jsp" %>
</head>

<body>

    <!-- HEADER -->
    <div class="navbar navbar-fixed-top">
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#header-collapse" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">SOSTutors</a>
            </div>
            <div class="collapse navbar-collapse" id="header-collapse">
                <ul class="nav navbar-nav navbar-right">
                    <li class="active"><a href="Index.jsp">Home</a></li>
                    <li><a href="About.jsp">About</a></li>
                    <li><a href="TutorSearch.jsp">Tutors</a></li>
                    <li><a href="Contact.jsp">Contact</a></li>
                    <%if (session.getAttribute("currentStudent") != null){%>
                    	<li><a href="#"><%=((Student) session.getAttribute("currentStudent")).getFName()%></a></li>
                    <%}else{%>
                    	<li><a href="#">Login/Register</a></li>
                    <%}%>
                </ul>
            </div>
        </div>
    </div>
    
    <!-- CONTENT -->
    <div class="content">
    
        <img class="background-image" src="images/main-wall.jpg">
        
		<div class="col-lg-6 col-lg-offset-3 col-md-8 col-md-offset-2 col-sm-8 col-sm-offset-2 form blackform" style="text-align: center; color: white; margin-top: 25px;">
		    <br/>
		    <h1 style="font-family: 'Quicksand'">Contact</h1>
		    <br/>
		    <form class="form-horizontal">
		
		            <h4>Name</h4>
		            <input type="text" class="form-control input-lg" id="name">
		            <h4>Email</h4>
		            <input type="email" class="form-control input-lg" id="email">
		            <h4>Message</h4>
		            <textarea class="form-control" id="message" rows="10"></textarea>
		            <br>
		            <button id="searchbtn" class="btn btn-default greenbtn btn-lg input-lg fullwidthbtn" type="submit">Send</button>
		    </form>
		    <br/>
		</div>
    </div>

</body>

</html>