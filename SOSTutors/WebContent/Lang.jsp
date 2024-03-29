<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page language="java"
	import="com.sos.to.Student,com.sos.to.Tutor,com.sos.to.Comment,com.sos.to.Session,com.sos.to.Message,java.util.Locale,java.util.ResourceBundle"%>
<%
	//for generating the french/english page link
	//session.setAttribute("currentPage", "LoginRegister");

	//used to set keep the language consistent between pages
	if (session.getAttribute("language") == null) {
		session.setAttribute("language", "EN");
	}

	ResourceBundle lang = ResourceBundle.getBundle(session.getAttribute("currentPage") + "_EN");

	//if the session language is FR switch to french, otherwise remains english as set above
	if (session.getAttribute("language").toString().equals("FR")) {
		lang = ResourceBundle.getBundle(session.getAttribute("currentPage") + "_FR");
	}

	//if the user clicked change language, set to appropriate language
	if (request.getParameter("language") != null) {
		if (request.getParameter("language").equals("FR")) {
			lang = ResourceBundle.getBundle(session.getAttribute("currentPage") + "_FR");
			session.setAttribute("language", "FR");
		} else {
			lang = ResourceBundle.getBundle(session.getAttribute("currentPage") + "_EN");
			session.setAttribute("language", "EN");
		}
	}
%>