package com.sos.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sos.dao.TutorDAO;

public class TutorProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{   	
    	int tutorID = Integer.parseInt(request.getParameter("tutorID"));
    	TutorDAO dao = new TutorDAO();
    	
    	request.setAttribute("tutor", dao.getTutorFromDatabaseById(tutorID));
    	request.getRequestDispatcher("TutorProfile.jsp").forward(request, response);
    }  
}
