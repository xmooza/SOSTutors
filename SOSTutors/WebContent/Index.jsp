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
    
    <!-- Language Bundles -->
    <%@include file="Lang.jsp" %>
    
    <!-- Initialization -->
    <%
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
                	<li><%
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
					</form></li>
                    <li class="active"><a href="Index.jsp">Home</a></li>
                    <li><a href="About.jsp">About</a></li>
                    <li><a href="TutorSearch.jsp">Tutors</a></li>
                    <li><a href="Contact.jsp">Contact</a></li>
                    <%if (session.getAttribute("currentStudent") != null){%>
                    	<li><a href="#"><%=((Student) session.getAttribute("currentStudent")).getFName()%></a></li>
                    <%}else{%>
                    	<li><a href="#" style="background-color: #424242"><i class="fa fa-user"></i>&nbsp;&nbsp;Harry</a></li>
                    <%}%>
                </ul>
            </div>
        </div>
    </div>
    
    <!-- CONTENT -->
    <div class="content">
    
	    <div class="container-fluid resultform form">
			<h2>
				<%out.println(lang.getString("content.1"));%>
				<a href="Tutor.jsp"> <%out.println(lang.getString("content.2"));%></a>
				<%out.println(lang.getString("content.3"));%>
				<a href="About.jsp"> <%out.println(lang.getString("content.4"));%></a>
				<a href="Contact.jsp"> <%out.println(lang.getString("content.5"));%></a>
			</h2>
		</div>

		<div>
			<!--Output area for error messages related to registration and login -->
			<%if (request.getAttribute("errorMessage") != null) {%>
			<div class="container">
				<div role="alert">
					<%=lang.getString(request.getAttribute("errorMessage").toString())%>
				</div>
			</div>
			<%}%>
		</div>
		
		<!-- If the user is logged in and has navigated back to the home page, display a greeting message that directs them back to their profile -->
		<%if (session.getAttribute("currentStudent") != null){%>
			<div class="FillScreenTextCentered" style="color: LightBlue;">
				<p style="font-size: 18px;">
					<%=lang.getString("content.4")%>,
					<%=((Student) session.getAttribute("currentStudent")).getEmail()%>.<br>
					<%=lang.getString("content.5")%>
				</p>
			</div>
		<%}%>
	
	
		<%if (session.getAttribute("currentStudent") == null) {%>
			<!-- RESULTS FORM -->
			<div class="container-fluid resultform form">
		
				<div class="row">
		
					<div class="col-sm-6 col-md-6">
						<div class="titlebar">
							<h3><% out.println(lang.getString("login")); %></h3>
						</div>
					</div>
		
					<div class="col-sm-6 col-md-6">
						<div class="titlebar">
							<h3><% out.println(lang.getString("register")); %></h3>
						</div>
					</div>
		
					<div class="col-sm-6 col-md-6">
						<div class="tutorform form">
							<form name="LoginForm" action="loginServlet" method="post">
								<h4><% out.println(lang.getString("email")); %></h4>
								<input type=text name=loginUseremail maxlength=100
									class="form-control input-lg" value="" /><br />
								<h4><% out.println(lang.getString("password")); %></h4>
								<input type=password name=loginUserpassword maxlength=100
									class="form-control input-lg" /><br /> <input
									class="btn btn-default input-lg" type=submit value="<% out.println(lang.getString("login")); %>" />
							</form>
						</div>
					</div>
		
					<div class="col-sm-6 col-md-6">
						<div class="tutorform form">
							<form name="LoginForm" action="registerServlet" method="post">
								<h4><% out.println(lang.getString("fname")); %></h4>
								<input type=text name=registerUserfname value="" maxlength=100
									class="form-control input-lg" value="" /><br />
								<h4><% out.println(lang.getString("lname")); %></h4>
								<input type=text name=registerUserlname value="" maxlength=100
									class="form-control input-lg" value="" /><br />
								<h4><% out.println(lang.getString("email")); %></h4>
								<input type=text name=registerUseremail value="" maxlength=100
									class="form-control input-lg" value="" /><br />
								<h4><% out.println(lang.getString("password")); %></h4>
								<input type=password name=registerUserpassword maxlength=100
									class="form-control input-lg" /><br /> <input
									class="btn btn-default input-lg" type=submit value="<% out.println(lang.getString("register")); %>" />
							</form>
						</div>
					</div>
				</div>
		
			</div>
		<%}%>
    </div>

</body>

</html>