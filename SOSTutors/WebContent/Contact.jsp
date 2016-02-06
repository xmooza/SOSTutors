<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Tutor Scheduling Website">
    <meta name="author" content="SOSTutors">
    <title>SOSTutors - Contact</title>


    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>

    <!-- Google -->
    <link href='https://fonts.googleapis.com/css?family=Quicksand|Roboto' rel='stylesheet' type='text/css'>
    
    <!-- Custom Styles-->
    <link rel="stylesheet" type="text/css" href="styles/styles.css">
</head>

<body class="body">
    <!-- HEADER -->
    <div class="navbar navbar-fixed-top">
        <a class="navbar-brand" href="#">SOSTutors</a>
        
    </div>
    
    <!-- TITLE -->
    <div style="margin-top: 150px; margin-bottom: 25px; text-align: center; font-family: 'Quicksand'"><h2>Contact Us</h2></div>
    
   
    
    <!-- RESULTS FORM -->
    <div class="container-fluid contactResolution">
        
        <!--   contact form goes here  -->
              <form class="form-horizontal">

                <div class="tutorform">
					<h4>Name</h4>
					<input type="text" class="form-control input-lg" id="name" >
					<h4>Email</h4>
					<input type="email" class="form-control input-lg" id="email">
					<h4>Message</h4>
					<textarea class="form-control" id="message" rows="10"></textarea><br>
					<button id="searchbtn" class="btn btn-default greenbtn btn-lg input-lg"
						type="submit">Send</button>
				</div>

              </form>
    </div>

</body>

</html>