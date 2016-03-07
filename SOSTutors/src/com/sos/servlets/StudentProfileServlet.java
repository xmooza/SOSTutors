package com.sos.servlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sos.dao.StudentDAO;

public class StudentProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{   	
    	int tutorID = Integer.parseInt(request.getParameter("tutorID"));
    	StudentDAO dao = new StudentDAO();
    	
    	if (request.getSession().getAttribute("currentStudent") == null && request.getSession().getAttribute("currentTutor") == null){
    		response.sendRedirect("errors/403.jsp");
    		return;
    	}
    	
    	try {
    		request.setAttribute("student", dao.getStudentFromDatabaseById(tutorID));
    		request.setAttribute("sessions", dao.getStudentSessions(tutorID));
			request.setAttribute("comments", dao.getStudentComments(tutorID));
			request.setAttribute("messages", dao.getStudentMessages(tutorID));
			request.getRequestDispatcher("Profile.jsp").forward(request, response);
		} catch (SQLException e) {
			e.printStackTrace();
		}
    }  
}
