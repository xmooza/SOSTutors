<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Tutor Scheduling Website">
    <meta name="author" content="SOSTutors">
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

    <title>SOSTutors - TutorSearch</title>

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
	<c:import url="Header.jsp"></c:import>
	
	<!-- CONTENT -->
	<div class="content">
		<img class="background-image" src="images/main-wall.jpg">
		
		<!-- SEARCH & FILTER FORM -->
	    <div class="container-fluid searchform form blackform">
	        <div class="row">
	            <div class="col-md-5">
	                <input class="form-control input-lg" type="text">
	            </div>
	            <div class="col-md-3">
	                <div class="col-xs-5">
	                    <select name="subject" class="form-control">
	                        <option value="AllSub">All Subjects</option>
	                        <option value="Math">Mathematics</option>
	                        <option value="Science">Science</option>
	                        <option value="English">English</option>
	                        <option value="French">French</option>
	                        <option value="Computers">Computer Science</option>
	                    </select>
	                </div>
	            </div>
	            <div class="col-md-2 col-sm-6 col-xs-6">
	                <button class="btn btn-default input-lg whitebtn fullwidthbtn" type="button">Advanced</button>
	            </div>
	            <div class="col-md-2 col-sm-6 col-xs-6">
	                <button class="btn btn-default input-lg greenbtn fullwidthbtn" type="button">Search</button>
	            </div>
	        </div>
	    </div>
	
	    <!-- RESULTS FORM -->
	    <div class="container-fluid resultform form blackform">
	
	        <div class="row">
	        	
	        	<c:forEach items="${tutorList}" var="tutor">
	        		
		        	<div class="col-sm-6 col-md-6">
		                <div class="tutorform form">
		                    <div class="row">
		                        <div class="col-md-4">
		                            <div class="tutimg">
		                                <img src="images/pic1_thumb.png">
		                            </div>
		                            <div class="tutrating">
		                                <h4><b>$${ tutor.hourly }/hour</b></h4>
		                                <h4><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star-o"></i><i class="fa fa-star-o"></i></h4>
		                            </div>
		                        </div>
		                        <div class="col-md-8 tutdesc">
		                            <h3>${ tutor.fname } ${ tutor.lname }</h3>
		                            <h6><i>${ tutor.college }</i></h6>
		                            <h5><b>No Subjects Currently</b></h5>
		                            <p>${ tutor.profile }</p>
		                        </div>
		                        <div class="col-md-8 col-sm-12 col-xs-12 tutinfo">
		                            <a class="btn btn-default fullwidthbtn whitebtn" role="button" href="Tutor.jsp">More Info</a>
		                        </div>
		                    </div>
		                </div>
		            </div>
		            
	        	</c:forEach>
	            
	        	<h5 style="text-align: center; color: white">Showing 4 of 4 results.</h5>
	        </div>
	    </div>
	</div>

</body>

</html>