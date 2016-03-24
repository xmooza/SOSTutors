<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="java.util.List, java.util.ArrayList, com.sos.dao.AdminDAO, com.sos.dao.MessageDAO,com.sos.dao.StudentDAO,com.sos.dao.TutorDAO, com.sos.to.Message, com.sos.to.Tutor, com.sos.to.Student, com.sos.to.Category"%>
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
	
	List<Category> adminCategories= new ArrayList<Category>();
	adminCategories = AdminDAO.getCategoriesDB();
%>

<!-- Custom Styles -->
<TITLE>SOSTutors - Admin Home's</TITLE>
<LINK REL="stylesheet" TYPE="text/css" HREF="styles/styles.css">
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
				<li><a href="#tab1">Messages</a></li>
				<li><a href="#tab2">Tutors</a></li>
				<li><a href="#tab3">Students</a></li>
				<li><a href="#tab4">Subjects</a></li>
			</ul>
			<div class="tabcontent">
				<div id="tab1" class="tab">
					<DIV CLASS="titlebar">
						<H4>Messages</H4>
					</DIV>
					<TABLE STYLE="width: 100%">
						<TR>
							<TD>To</TD>
							<TD>Message</TD>
							<TD>Date Posted</TD>
							<TD>Delete</TD>
							<TD>Reply</TD>
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
					<TABLE STYLE="width: 100%">
						<TR>
							<TD>Name</TD>
							<TD>Email</TD>
							<TD>College</TD>
							<TD>Rating</TD>
							<TD>Date Joined</TD>
							<TD>Delete</TD>
							<TD>Edit</TD>
						</TR>
						<%
							if (adminTutors.size() > 0) {
								for (Tutor tut : adminTutors) {
						%>
						<TR>
							<TD ALIGN="left"><%=tut.getLname()%>, <%=tut.getFname()%></TD>
							<TD ALIGN="left"><%=tut.getEmail()%></TD>
							<TD ALIGN="left"><%=tut.getCollege()%></TD>
							<TD ALIGN="left"><%=tut.getRating()%></TD>
							<TD ALIGN="left"><%=tut.getDate_joined()%></TD>
							<TD><A HREF="adminServlet?tutid=<%=tut.getTutorID()%>"
								ONCLICK="return confirm('Are you sure?')">Delete</A></TD>
							<TD><A HREF="adminEdit?tutid=">Edit</A></TD>
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
					<TABLE STYLE="width: 100%">
						<TR>
							<TD>Name</TD>
							<TD>Email</TD>
							<TD>Date Joined</TD>
							<TD>Delete</TD>
							<TD>Edit</TD>
						</TR>
						<%
							if (adminStudents.size() > 0) {
								for (Student st : adminStudents) {
						%>
						<TR>
							<TD ALIGN="left"><%=st.getLname()%>, <%=st.getFname()%></TD>
							<TD ALIGN="left"><%=st.getEmail()%></TD>
							<TD ALIGN="left"><%=st.getDate_joined()%></TD>
							<TD><A HREF="adminServlet?stuid=<%=st.getStudentID()%>"
								ONCLICK="return confirm('Are you sure?')">Delete</A></TD>
							<TD><A HREF="adminEdit?stuid=">Edit</A></TD>
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
						<H4>Categories</H4>
					</DIV>
					<TABLE STYLE="width: 100%">
						<TR>
							<TD>Subject</TD>
							<TD>Description</TD>
							<TD>Language</TD>
							<TD>Delete</TD>
							<TD>Edit</TD>
						</TR>
						<%
							if (adminCategories.size() > 0) {
								for (Category cat : adminCategories) {
						%>
						<TR>
							<TD ALIGN="left"><%=cat.getSubjectEN()%><%=cat.getSubjectFR()%></TD>
							<TD ALIGN="left"><%=cat.getDescriptionEN()%><%=cat.getDescriptionFR()%></TD>
							<TD ALIGN="left"><%=cat.getLanguage()%></TD>
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