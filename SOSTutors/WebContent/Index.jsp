<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page language="java"
	import="com.amzi.dao.Student,java.util.Locale,java.util.ResourceBundle"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Tutor Scheduling Website">
<meta name="author" content="SOSTutors">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SOSTutors - Tutors</title>

<!-- Custom Styles-->
<link rel="stylesheet" type="text/css" href="styles/styles.css">

<!-- Bootstrap -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

<!-- FontAwesome-->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">

<!-- Google -->
<link href='https://fonts.googleapis.com/css?family=Quicksand|Roboto'
	rel='stylesheet' type='text/css'>

<!-- initialization variables needed for page -->
<%
	//for generating the french/english page link
	session.setAttribute("currentPage", "Index");

	if (getServletContext().getAttribute("errorCode") == null) {
		getServletContext().setAttribute("errorCode", 0);
	}

	if (getServletContext().getAttribute("errorMessage") == null) {
		getServletContext().setAttribute("errorMessage", "");
	}

	//used to set keep the language consistent between pages
	if (session.getAttribute("language") == null) {
		session.setAttribute("language", "EN");
	}

	ResourceBundle lang = ResourceBundle.getBundle("Index_EN");

	//if the session language is FR switch to french, otherwise remains english as set above
	if (session.getAttribute("language").toString().equals("FR")) {
		lang = ResourceBundle.getBundle("Index_FR");
	}

	//if the user clicked change language, set to appropriate language
	if (request.getParameter("language") != null) {
		if (request.getParameter("language").equals("FR")) {
			lang = ResourceBundle.getBundle("Index_FR");
			session.setAttribute("language", "FR");
		} else {
			lang = ResourceBundle.getBundle("Index_EN");
			session.setAttribute("language", "EN");
		}
	}
%>
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

	<!-- SEARCH & FILTER FORM -->
	<div class="container-fluid filterform">
		<div class="row">
			<div class="col-md-5">
				<input class="form-control input-lg" type="text">
			</div>
			<div class="col-md-3">
				<div class="col-xs-5">
					<select name="subject" class="form-control">
						<option value="AllSub">
							<%
								out.println(lang.getString("ddl.AllSub"));
							%>
						</option>
						<option value="Math">
							<%
								out.println(lang.getString("ddl.Math"));
							%>
						</option>
						<option value="Science">
							<%
								out.println(lang.getString("ddl.Science"));
							%>
						</option>
						<option value="English">
							<%
								out.println(lang.getString("ddl.English"));
							%>
						</option>
						<option value="French">
							<%
								out.println(lang.getString("ddl.French"));
							%>
						</option>
						<option value="Computers">
							<%
								out.println(lang.getString("ddl.Computers"));
							%>
						</option>
					</select>
				</div>
			</div>
			<div class="col-md-2 col-sm-6 col-xs-6">
				<button id="advancedbtn" class="btn btn-default input-lg"
					type="button">
					<%
						out.println(lang.getString("btn.Adv"));
					%>
				</button>
			</div>
			<div class="col-md-2 col-sm-6 col-xs-6">
				<a href="TutorSearch.jsp"><button id="searchbtn"
						class="btn btn-default input-lg" type="submit">
						<%
							out.println(lang.getString("btn.S"));
						%>
					</button></a>
			</div>
		</div>
	</div>

	<div class="container-fluid resultform">
		<h2>
			<%
				out.println(lang.getString("content.1"));
			%>
			<a href="Tutor.jsp"> <%
					out.println(lang.getString("content.2"));
				%>
			</a>.
			<%
				out.println(lang.getString("content.3"));
			%>
			<a href="About.jsp"> <%
					out.println(lang.getString("content.4"));
				%>
			</a>. <a href="Contact.jsp"> <%
					out.println(lang.getString("content.5"));
				%>
			</a>.
		</h2>
	</div>

	<div>
		<!--Output area for error messages related to registration and login -->

		<%
			if (request.getAttribute("errorMessage") != null) {
		%>
		<div class="container">
			<div role="alert">
				<%=lang.getString(request.getAttribute("errorMessage").toString())%>
			</div>
		</div>
		<%
			}
		%>

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
		<div class="container-fluid resultform">
	
			<div class="row">
	
				<div class="col-sm-6 col-md-6">
					<div class="titlebar">
						<h3>
							<%
								out.println(lang.getString("login"));
							%>
						</h3>
					</div>
				</div>
	
				<div class="col-sm-6 col-md-6">
					<div class="titlebar">
						<h3>
							<%out.println(lang.getString("register"));%>
						</h3>
					</div>
				</div>
	
				<div class="col-sm-6 col-md-6">
					<div class="tutorform">
						<form name="LoginForm" action="loginServlet" method="post">
							<h4>
								<%
									out.println(lang.getString("email"));
								%>
							</h4>
							<input type=text name=loginUseremail maxlength=100
								class="form-control input-lg" value="" /><br />
							<h4>
								<%
									out.println(lang.getString("password"));
								%>
							</h4>
							<input type=password name=loginUserpassword maxlength=100
								class="form-control input-lg" /><br /> <input
								class="btn btn-default input-lg" type=submit value="<%out.println(lang.getString("login"));%>" />
						</form>
					</div>
				</div>
	
				<div class="col-sm-6 col-md-6">
					<div class="tutorform">
						<form name="LoginForm" action="registerServlet" method="post">
							<h4>
								<%
									out.println(lang.getString("fname"));
								%>
							</h4>
							<input type=text name=registerUserfname value="" maxlength=100
								class="form-control input-lg" value="" /><br />
							<h4>
								<%
									out.println(lang.getString("lname"));
								%>
							</h4>
							<input type=text name=registerUserlname value="" maxlength=100
								class="form-control input-lg" value="" /><br />
							<h4>
								<%
									out.println(lang.getString("email"));
								%>
							</h4>
							<input type=text name=registerUseremail value="" maxlength=100
								class="form-control input-lg" value="" /><br />
							<h4>
								<% out.println(lang.getString("password")); %>
							</h4>
							<input type=password name=registerUserpassword maxlength=100
								class="form-control input-lg" /><br /> <input
								class="btn btn-default input-lg" type=submit value="<%out.println(lang.getString("register"));%>" />
						</form>
					</div>
				</div>
			</div>
	
		</div>
	<% } %>
</body>

</html>