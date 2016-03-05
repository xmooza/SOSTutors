<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!-- Language Bundles -->
<%@include file="Lang.jsp"%>

<!-- Initialization -->
<%
	//EN language is the default, then check if needs to be changed to FR
	String languageSwitch = "FR";
	if (session.getAttribute("language") != null) {
		if (session.getAttribute("language").equals("FR")) {
			languageSwitch = "EN";
		}
	}
%>

<!-- HEADER -->
<div class="navbar navbar-fixed-top">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#header-collapse"
				aria-expanded="false">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand">SOSTutors</a>
			<form name="langForm" action="<%=session.getAttribute("currentPage")%>.jsp" method="post">
				<input class="langbtn" type=hidden name=language value="<%=languageSwitch%>" />
				<input class="langbtn" type=submit name=language value="<%=session.getAttribute("language").toString()%>" />
			</form>
		</div>
		<div class="collapse navbar-collapse" id="header-collapse">
			<ul class="nav navbar-nav navbar-right">
				<li class="active"><a href="Index.jsp">Home</a></li>
				<li><a href="About.jsp">About</a></li>
				<li><a href="Contact.jsp">Contact</a></li>
				<li><a href="TutorSearch.jsp">Tutor Search</a></li>
				<%
					if (session.getAttribute("currentStudent") != null) {
				%>
				<li><a id="userbtn" href="Profile.jsp"><%=((Student) session.getAttribute("currentStudent")).getFname()%></a></li>
				<%
					} else {
				%>
				<li><a href="LoginRegister.jsp">Login / Register</a></li>
				<%
					}
				%>
			</ul>
		</div>
	</div>
</div>
