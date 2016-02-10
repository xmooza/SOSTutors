<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Tutor Scheduling Website">
    <meta name="author" content="SOSTutors">
    <title>SOSTutors - <%= session.getAttribute("name") %>'s Profile</title>


    <!-- Custom Styles-->
    <link rel="stylesheet" type="text/css" href="styles/styles.css">

    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>

    <!-- Google -->
    <link href='https://fonts.googleapis.com/css?family=Quicksand|Roboto' rel='stylesheet' type='text/css'>
</head>

<body class="body">
    <!-- HEADER -->
    <div class="navbar navbar-fixed-top">
        <a class="navbar-brand" href="#">SOSTutors</a>
    </div>
    
    <!-- TITLE -->
    <div style="margin-top: 150px; margin-bottom: 25px; text-align: center; font-family: 'Quicksand'"><h1>Profile</h1></div>
    
   
    
    <!-- RESULTS FORM -->
    <div class="container-fluid aboutform">
        <h1>Welcome, <%= session.getAttribute("name") %>!</h1>
</div>

</body>

</html>