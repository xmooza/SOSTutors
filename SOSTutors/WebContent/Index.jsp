<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Tutor Scheduling Website">
<meta name="author" content="SOSTutors">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>SOSTutors - Home</title>

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

<!-- Initialization -->
<%
	session.setAttribute("currentPage", "Index");
%>
</head>

<body>
	<!-- HEADER -->
	<%@include file="Header.jsp"%>
	<div class="jumbotron">
    	<div class="container">
    		<h1 style="margin-top: 150px;">YOU TEACH, WE TAKE CARE OF THE REST</h1>
	        <a href="TutorRegistration.jsp" class="btn btn-danger btn-lg" style="margin-top: 100px;" role="button">Become a  Tutor</a>
		     <!-- <img src="images/main-wall.jpg"> -->
		     <!-- <a href="#" class="btn btn-primary ng-binding" >Become a  Tutor</a> -->
    	</div>
    </div>
    
    <div class="container homepage">
      	<!-- <img class="img-circle" ng-src="https://placehold.it/192x192" alt=""src="https://placehold.it/192x192"> -->
        <h2 style="font-weight: bold; margin-top: 50px;">Who We Are</h2>
        <hr>
        <p>Ever since we started this compagny, we only had one thing in mind help student not only people but also Ever since we started this compagny, 
        we only had one thing in mind help student not only people but also .</p>

    </div>

     <div class="container homepage">
      <h2 style="font-weight: bold; margin-top: 100px;">Tutoring services</h2>
      <hr>	
        <div class="row">
          <div class="col-md-4">
  	  <span class="fa-stack fa-4x">
    	      <i class="fa fa-circle fa-stack-2x"></i>
    	      <i class="fa fa-user fa-stack-1x fa-inverse"></i>
  	  </span>
            <h2 style="font-weight: bold;">One to One</h2>
            <p>Finish assignments, prep for tests and make sense out of the most far-fetched course material with our tutors 
            at your side. Every private tutoring session is tailored to your current academic needs. Solving 
            problems becomes as easy as pie.</p>
            <p><a class="btn btn-default" href="TutorSearch.jsp" role="button">Start Learning &raquo;</a></p>
          </div>
          <div class="col-md-4">
  	  <span class="fa-stack fa-4x">
    	      <i class="fa fa-circle fa-stack-2x"></i>
    	      <i class="fa fa-pencil fa-stack-1x fa-inverse"></i>
  	  </span>
            <h2 style="font-weight: bold;">One to Many</h2>
            <p>Private sessions are closed while mini-groups are open sessions that any student taking the 
            course can join. The more who attend, the less it costs for everyone there! </p>
            <p><a class="btn btn-default" href="#" role="button">Join a group &raquo;</a></p>
         </div>
          <div class="col-md-4">
  	  <span class="fa-stack fa-4x">
    	      <i class="fa fa-circle fa-stack-2x"></i>
    	      <i class="fa fa-money fa-stack-1x fa-inverse"></i>
  	  </span>
            <h2 style="font-weight: bold;" >Senoir Discount</h2>
            <p>We understand that for many student paying for a tutor might hurt your finances. However every time you get tutored by one of our elite and qualified teachers
            you can accumulate credit that will eventually get redeem on a free tutoring for you or yourself </p>
            <p><a class="btn btn-default" href="#" target="_blank" role="button">Apply now &raquo;</a></p>
          </div>
        </div>
	</div> <!-- End container -->
	
	<div class="container homepage">
		<h2 style="font-weight: bold; padding-top: 80px;" >Don't Stress</h2>
		<hr>
		<div class="row">
			<div class="col-md-8">
				<img alt="" src="images/timer.jpg">
			</div>
			<div class="col-md-4">
				<!-- <h2 style="font-weight: bold; padding-top: 100px;" >Don't Stress</h2> -->
	            <p style=" margin-top: 100px;">When there's too much to catch up on, or you just need that extra review to get the grade
	            you deserve, out tutors will bring you up to speed in no time and help you walk into your exam 
	            knowing you'll be at your best. </p>
			
			</div>
			
		</div>
	</div>
	 

</body>

</html>