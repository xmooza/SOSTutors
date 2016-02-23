<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Tutor Scheduling Website">
    <meta name="author" content="SOSTutors">
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

    <title>SOSTutors - Tutor</title>

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


    <!--CONTENT-->
    <div class="content">
    
	    <div class="container-fluid resultform form">
	
	        <div class="row tutpage">
	
	            <div class="col-md-4">
	                <div class="tutorform form">
	                    <div class="tutimg">
	                        <img src="images/pic1_thumb.png">
	                    </div>
	                    <div class="tutrating">
	                        <h4><b>$9/hr</b></h4>
	                        <h4><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star-o"></i><i class="fa fa-star-o"></i></h4>
	                    </div>
	                    <h3>Barry Trotts</h3>
	                    <h6><i>Waterloo University</i></h6>
	                    <h5><b>Mathematics, Science, Physics, Economics, Computer Science</b></h5>
	                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas a faucibus ipsum, sit amet luctus massa. Ut gravida est ac.</p>
	                </div>
	            </div>
	
	            <div class="col-md-8">
	
	                <div class="row">
	                    <div class="col-md-12">
	                        <div class="titlebar">
	                            <h4>Calendar</h4>
	                        </div>
	                    </div>
	
	                    <div class="col-md-12">
	                        <div class="table-responsive">
	                            <table class="table table-striped">
	                                <thead>
	                                    <tr>
	                                        <th style="text-align: center">Day</th>
	                                        <th style="text-align: center">Timeslot</th>
	                                        <th style="text-align: center">Subject</th>
	                                        <th style="text-align: center">Book</th>
	                                    </tr>
	                                </thead>
	                                <tbody>
	                                    <tr>
	                                        <td>Monday</td>
	                                        <td>11:00 - 12:00</td>
	                                        <td>
	                                            <select name="subject" class="form-control">
	                                                <option value="Mathematics">Mathematics</option>
	                                                <option value="Science">Science</option>
	                                                <option value="Physics">Physics</option>
	                                                <option value="Economics">Economics</option>
	                                                <option value="ComputerScience">Computer Science</option>
	                                            </select>
	                                        </td>
	                                        <td>
	                                            <button class="btn btn-default greenbtn" type="submit">Select</button>
	                                        </td>
	                                    </tr>
	                                    <tr>
	                                        <td>Monday</td>
	                                        <td>12:00 - 13:00</td>
	                                        <td>
	                                            <select name="subject" class="form-control">
	                                                <option value="Mathematics">Mathematics</option>
	                                                <option value="Science">Science</option>
	                                                <option value="Physics">Physics</option>
	                                                <option value="Economics">Economics</option>
	                                                <option value="ComputerScience">Computer Science</option>
	                                            </select>
	                                        </td>
	                                        <td>
	                                            <button class="btn btn-default greenbtn" type="submit">Select</button>
	                                        </td>
	                                    </tr>
	                                    <tr>
	                                        <td>Tuesday</td>
	                                        <td>11:00 - 12:00</td>
	                                        <td>
	                                            <select name="subject" class="form-control">
	                                                <option value="Mathematics">Mathematics</option>
	                                                <option value="Science">Science</option>
	                                                <option value="Physics">Physics</option>
	                                                <option value="Economics">Economics</option>
	                                                <option value="ComputerScience">Computer Science</option>
	                                            </select>
	                                        </td>
	                                        <td>
	                                            <button class="btn btn-default greenbtn" type="submit">Select</button>
	                                        </td>
	                                    </tr>
	                                    <tr>
	                                        <td>Tuesday</td>
	                                        <td>15:00 - 16:00</td>
	                                        <td>
	                                            <select name="subject" class="form-control">
	                                                <option value="Mathematics">Mathematics</option>
	                                                <option value="Science">Science</option>
	                                                <option value="Physics">Physics</option>
	                                                <option value="Economics">Economics</option>
	                                                <option value="ComputerScience">Computer Science</option>
	                                            </select>
	                                        </td>
	                                        <td>
	                                            <button class="btn btn-default greenbtn" type="submit">Select</button>
	                                        </td>
	                                    </tr>
	                                    <tr>
	                                        <td>Friday</td>
	                                        <td>14:00 - 15:00</td>
	                                        <td>
	                                            <select name="subject" class="form-control">
	                                                <option value="Mathematics">Mathematics</option>
	                                                <option value="Science">Science</option>
	                                                <option value="Physics">Physics</option>
	                                                <option value="Economics">Economics</option>
	                                                <option value="ComputerScience">Computer Science</option>
	                                            </select>
	                                        </td>
	                                        <td>
	                                            <button class="btn btn-default greenbtn" type="submit">Select</button>
	                                        </td>
	                                    </tr>
	                                </tbody>
	                            </table>
	                        </div>
	                    </div>
	
	                    <div class="col-md-12">
	                        <div class="titlebar">
	                            <h4>Reviews</h4>
	                        </div>
	                        <blockquote>
	                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.</p>
	                            <footer>Aboubacar Konde</footer>
	                        </blockquote>
	                        <blockquote>
	                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.</p>
	                            <footer>Aboubacar Konde</footer>
	                        </blockquote>
	                        <blockquote>
	                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.</p>
	                            <footer>Aboubacar Konde</footer>
	                        </blockquote>
	                        <blockquote>
	                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.</p>
	                            <footer>Aboubacar Konde</footer>
	                        </blockquote>
	                    </div>
	                </div>
	            </div>
	        </div>
	    
	    </div>
    </div>
    
</body>

</html>