<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="java.util.List, java.util.ArrayList, com.sos.dao.AdminDAO, com.sos.dao.MessageDAO,com.sos.dao.StudentDAO,com.sos.dao.TutorDAO, com.sos.to.Message, com.sos.to.Tutor, com.sos.to.Student, com.sos.to.Category, com.sos.to.Session"%>
<!DOCTYPE html>
<HTML>
<HEAD>
<META NAME="viewport" CONTENT="width=device-width, initial-scale=1">
<META NAME="description" CONTENT="Student Scheduling Website">
<META NAME="author" CONTENT="SOSStudents">
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">

<!-- Bootstrap -->
<LINK REL="stylesheet"
	HREF="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<SCRIPT
	SRC="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"
	TYPE="text/javascript"></SCRIPT>
<SCRIPT
	SRC="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"
	TYPE="text/javascript"></SCRIPT>

<!-- Google -->
<LINK HREF='https://fonts.googleapis.com/css?family=Quicksand|Roboto'
	REL='stylesheet' TYPE='text/css'>

<!-- FontAwesome -->
<LINK REL="stylesheet"
	HREF="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">

<!-- Custom Styles -->
<LINK REL="stylesheet" TYPE="text/css" HREF="styles/styles.css">


<%
	List<Message> adminMessages = new ArrayList<Message>();
	adminMessages = MessageDAO.getAdminMessages();
	
	List<Tutor> adminTutors = new ArrayList<Tutor>();
	adminTutors = TutorDAO.getAdminTutors();
	
	List<Student> adminStudents= new ArrayList<Student>();
	adminStudents = StudentDAO.getAdminStudents();
	
	List<Session> adminSessions = new ArrayList<Session>();
	adminSessions = AdminDAO.getSessionsDB();
	
	List<Category> adminCategories= new ArrayList<Category>();
	adminCategories = AdminDAO.getCategoriesDB();
%>

<!-- Custom Styles -->
<TITLE>SOSTutors - Admin Home's</TITLE>

<SCRIPT TYPE="text/javascript">
	$(document).ready(function() {
		$(".tabbable").find(".tab").hide();
		$(".tabbable").find(".tab").first().show();
		$(".tabbable").find(".tabs li").first().find("a").addClass("active");
		$(".tabbable").find(".tabs").find("a").click(function() {
			tab = $(this).attr("href");
			$(".tabbable").find(".tab").hide();
			$(".tabbable").find(".tabs").find("a").removeClass("active");
			$(tab).show();
			$(this).addClass("active");
			return false;
		});
	});
</SCRIPT>
</HEAD>

<BODY BGCOLOR="white">
	<!-- CONTENT -->
	<DIV CLASS="content">
		<!--Error and Messages -->
		<%
			if (request.getAttribute("errorMessage") != null) {
		%>
		<DIV CLASS="container">
			<DIV CLASS="alert alert-danger">
				<A HREF="#" CLASS="close" DATA-DISMISS="alert" ARIA-LABEL="close">&times;</A>
				<%=request.getAttribute("errorMessage").toString()%>
			</DIV>
		</DIV>
		<%
			}
		%>
		<!--Error and Messages End -->
		<H1 STYLE="font-family: 'Quicksand'; text-align: center">Admin's
			Page</H1>
		<BR />

		<div class="tabbable">
			<ul class="tabs">
				<li><a href="#tab1"><B>Messages</B></a></li>
				<li><a href="#tab2"><B>Tutors</B></a></li>
				<li><a href="#tab3"><B>Students</B></a></li>
				<li><a href="#tab4"><B>Sessions</B></a></li>
				<li><a href="#tab5"><B>Subjects</B></a></li>
			</ul>
			<div class="tabcontent">
				<div id="tab1" class="tab">
					<DIV CLASS="titlebar">
						<H4>Messages</H4>
					</DIV>
					<TABLE STYLE="width: 100%" BORDER="1">
						<TR>
							<TD><B>To</B></TD>
							<TD><B>Message</B></TD>
							<TD><B>Date Posted</B></TD>
							<TD><B>Delete</B></TD>
							<TD><B>Reply</B></TD>
						</TR>
						<%
							if (adminMessages.size() > 0) {
								for (Message com : adminMessages) {
						%>
						<TR>
							<TD><%=com.getSubject()%></TD>
							<TD ALIGN="left"><%=com.getContent()%></TD>
							<TD><%=com.getDate_posted()%></TD>
							<TD><A
								HREF="adminServlet?msgid=<%=com.getNotificationID()%>"
								ONCLICK="return confirm('Are you sure?')">Delete</A></TD>
							<TD><A HREF="adminReply?msgid=<%=com.getNotificationID()%>">Reply</A></TD>
						</TR>
						<%
							}
							} else {
						%>
						<TR>
							<TD>No Messages!</TD>
						</TR>
						<%
							}
						%>
					</TABLE>
				</DIV>
				<div id="tab2" class="tab">
					<DIV CLASS="titlebar">
						<H4>Tutors</H4>
					</DIV>
					<TABLE STYLE="width: 100%" BORDER="1">
						<TR>
							<TD><B>Name</B></TD>
							<TD><B>Email</B></TD>
							<TD><B>College</B></TD>
							<TD><B>Rating</B></TD>
							<TD><B>Date Joined</B></TD>
							<TD><B>Delete</B></TD>
							<TD><B>Edit</B></TD>
						</TR>
						<%
							if (adminTutors.size() > 0) {
								for (Tutor tut : adminTutors) {
						%>
						<TR>
							<TD ALIGN="left"><%=tut.getLname()%>, <%=tut.getFname()%></TD>
							<TD ALIGN="left"><a href=mailto:<%=tut.getEmail()%>><%=tut.getEmail()%></a></TD>
							<TD ALIGN="left"><%=tut.getCollege()%></TD>
							<TD><%=tut.getRating()%></TD>
							<TD><%=tut.getDate_joined()%></TD>
							<TD><A HREF="adminServlet?tutid=<%=tut.getTutorID()%>"
								ONCLICK="return confirm('Are you sure?')">Delete</A></TD>
							<TD><A HREF="editServlet?tutid=<%=tut.getTutorID()%>">Edit</A></TD>
						</TR>

						<%
							}
							} else {
						%>
						<TR>
							<TD>No Tutors!</TD>
						</TR>
						<%
							}
						%>
					</TABLE>

				</DIV>
				<div id="tab3" class="tab">
					<DIV CLASS="titlebar">
						<H4>Students</H4>
					</DIV>
					<TABLE STYLE="width: 100%" BORDER="1">
						<TR>
							<TD><B>Name</B></TD>
							<TD><B>Email</B></TD>
							<TD><B>Date Joined</B></TD>
							<TD><B>Delete</B></TD>
							<TD><B>Edit</B></TD>
						</TR>
						<%
							if (adminStudents.size() > 0) {
								for (Student st : adminStudents) {
						%>
						<TR>
							<TD ALIGN="left"><%=st.getLname()%>, <%=st.getFname()%></TD>
							<TD ALIGN="left"><a href=mailto:<%=st.getEmail()%>><%=st.getEmail()%></a></TD>
							<TD><%=st.getDate_joined()%></TD>
							<TD><A HREF="adminServlet?stuid=<%=st.getStudentID()%>"
								ONCLICK="return confirm('Are you sure?')">Delete</A></TD>
							<TD><A HREF="editServlet?stuid=<%=st.getStudentID()%>">Edit</A></TD>
						</TR>

						<%
							}
							} else {
						%>
						<TR>
							<TD>No Students!</TD>
						</TR>
						<%
							}
						%>
					</TABLE>
				</DIV>
				
				<div id="tab4" class="tab">
					<DIV CLASS="titlebar">
						<H4>Sessions</H4>
					</DIV>
					<TABLE STYLE="width: 100%" BORDER="1">
						<TR>
							<TD><B>Subject</B></TD>
							<TD><B>Booked</B></TD>
							<TD><B>Date</B></TD>
							<TD><B>Delete</B></TD>
						</TR>
						<%
							if (adminSessions.size() > 0) {
								for (Session ses : adminSessions) {
						%>
						<TR>
							<TD ALIGN="left"><%=ses.getSubject()%></TD>
							<TD><%=ses.isBooking_available()%></TD>
							<TD><%=ses.getBooking_date()%></TD>
							<TD><A HREF="adminServlet?sesid=<%=ses.getSessionID()%>" ONCLICK="return confirm('Are you sure?')">Delete</A></TD>
						</TR>

						<%
							}
							} else {
						%>
						<TR>
							<TD>No Categories!</TD>
						</TR>
						<%
							}
						%>
					</TABLE>
					<BR/>
				</DIV>
				

				<div id="tab5" class="tab">
					<DIV CLASS="titlebar">
						<H4>Categories</H4>
					</DIV>
					<TABLE STYLE="width: 100%" BORDER="1">
						<TR>
							<TD><B>Subject</B></TD>
							<TD><B>Description</B></TD>
							<TD><B>Language</B></TD>
							<TD><B>Delete</B></TD>
							<TD><B>Edit</B></TD>
						</TR>
						<%
							if (adminCategories.size() > 0) {
								for (Category cat : adminCategories) {
						%>
						<TR>
							<TD ALIGN="left"><%=cat.getSubjectEN()%><%=cat.getSubjectFR()%></TD>
							<TD ALIGN="left"><%=cat.getDescriptionEN()%><%=cat.getDescriptionFR()%></TD>
							<TD><%=cat.getLanguage()%></TD>
							<TD><A HREF="adminServlet?catid=<%=cat.getCategoryID()%>"
								ONCLICK="return confirm('Are you sure?')">Delete</A></TD>
							<TD><A HREF="adminEdit?catid=">Edit</A></TD>
						</TR>

						<%
							}
							} else {
						%>
						<TR>
							<TD>No Categories!</TD>
						</TR>
						<%
							}
						%>
					</TABLE>
					<br />
					<form class="form-horizontal" action="adminServlet" method="post">
						<h4>Subject</h4>
						<input type="text" class="form-control" id="subject"
							name="catSubject">
						<h4>Description</h4>
						<input type="text" class="form-control" id="desciption"
							name="catDescription">
						<h4>Language</h4>
						<input type="radio" name="catLanguage" value="English"
							checked="checked" /> English <input type="radio"
							name="catLanguage" value="French" /> French <br />
						<button id="addcathbtn" class="btn btn-default greenbtn"
							type="submit" style="margin: auto; width: 30%; float: right">Add</button>
						<br />
					</form>
					<br />
				</DIV>
				
			</DIV>
		</DIV>
	</DIV>
</BODY>
</HTML>