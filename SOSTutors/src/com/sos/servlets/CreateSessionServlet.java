package com.sos.servlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sos.dao.TutorDAO;

public class CreateSessionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int tutorID = Integer.parseInt(request.getParameter("tutorID"));
		
		try {
			TutorDAO dao = new TutorDAO();
			dao.addTutorSession(request.getParameter("subject"), request.getParameter("location"), tutorID);
			response.sendRedirect("tutorUserProfile");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
