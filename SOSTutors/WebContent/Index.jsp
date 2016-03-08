<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Tutor Scheduling Website">
    <meta name="author" content="SOSTutors">
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

    <title>SOSTutors - Home</title>

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
    
    <!-- Initialization -->
    <%
    	session.setAttribute("currentPage", "Index");	
    	if (getServletContext().getAttribute("errorCode") == null) {
    		getServletContext().setAttribute("errorCode", 0);
    	}

    	if (getServletContext().getAttribute("errorMessage") == null) {
    		getServletContext().setAttribute("errorMessage", "");
    	}
    %>
</head>

<body>
	<!-- HEADER -->
	<%@include file="Header.jsp" %>
    
    <!-- CONTENT -->
	<div class="content">
		<img class="background-image" src="images/main-wall.jpg">
		
		<div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2 col-xs-10 col-xs-offset-1 form blackform" style="text-align: center; padding: 25px">
			<img style="width: 100%; border-radius: 10px;" src="images/grumpy-cat.jpg">
		</div>
	</div>

</body>

</html>