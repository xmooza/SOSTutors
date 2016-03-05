<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="java.util.ArrayList, java.io.IOException,com.sos.to.Tutor,com.sos.to.Session, com.sos.dao.TutorDAO, java.util.Locale,java.util.ResourceBundle"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<%	
	Tutor t = null;
	TutorDAO td = new TutorDAO();
	Boolean tutorProfile;
	
	session.setAttribute("currentPage","Profile");
	ResourceBundle lang = ResourceBundle.getBundle("Profile_EN");
	
	//if the session language is FR switch to french, otherwise remains english as set above
	if (session.getAttribute("language").toString().equals("FR"))
	{
		lang = ResourceBundle.getBundle("Profile_FR");
	} 
	
	//if the user clicked change language, set to appropriate language
	if (request.getParameter("language") != null)
	{	
		if (request.getParameter("language").equals("FR"))
		{
			lang = ResourceBundle.getBundle("Profile_FR");
			session.setAttribute("language","FR");
		} 
		else 
		{
			lang = ResourceBundle.getBundle("Profile_EN");
			session.setAttribute("language","EN");
		}
	}		
	t = (Tutor)session.getAttribute("currentTutor");
	tutorProfile = true;
	
	if(session.getAttribute("currentProfile") != null)
	{
		if(t == null)
		{
			t = (Tutor) session.getAttribute("currentProfile");
			tutorProfile = false;  
		}
		else
		{
			if(t.getEmail().equals(((Tutor) session.getAttribute("currentProfile")).getEmail()) == false)
			{
				t = (Tutor) session.getAttribute("currentProfile");
				tutorProfile= false; 
			}
		}
	}
	ArrayList<Session> tutoringBookings = td.getTutorSessions(t.getTutorID());
%>
</head>
<body>

</body>
</html>