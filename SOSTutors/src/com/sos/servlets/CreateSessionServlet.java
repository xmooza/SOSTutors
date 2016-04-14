package com.sos.servlets;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sos.dao.TutorDAO;

public class CreateSessionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int tutorID = Integer.parseInt(request.getParameter("tutorID"));
		String date = request.getParameter("datepicker");
		String time = request.getParameter("time");
		Date tempDate;
		String sTemp;
		Timestamp t = null;
		
		try {
			tempDate = new SimpleDateFormat("MM/dd/yyyy").parse(date);
			sTemp = new SimpleDateFormat("yyyy-MM-dd").format(tempDate);
			
			sTemp = sTemp + " " + time + ":00.0";
			
			t = Timestamp.valueOf(sTemp);
		} catch (ParseException e1) {
			e1.printStackTrace();
		}
		
		try {
			TutorDAO dao = new TutorDAO();
			dao.addTutorSession(request.getParameter("subject"), t, request.getParameter("location"), tutorID);
			response.sendRedirect("tutorUserProfile");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
