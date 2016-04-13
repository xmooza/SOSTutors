package com.sos.servlets;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.Gson;
import com.sos.dao.TutorDAO;
import com.sos.to.Calendar;
import com.sos.to.Session;
import com.sos.to.Tutor;

public class TutorUserProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		@SuppressWarnings("rawtypes")
		Iterator it;
		TutorDAO dao = new TutorDAO();
		ArrayList<Calendar> calendarEvents = new ArrayList<Calendar>();
		HashMap<Session, String> temp = new HashMap<Session, String>();
		Tutor t = (Tutor) request.getSession().getAttribute("currentTutor");

		try {
			temp = dao.getTutorSessions(t.getTutorID());
			it = temp.entrySet().iterator();
			
			while (it.hasNext()) {
				@SuppressWarnings("rawtypes")
				Map.Entry me = (Map.Entry) it.next();
				Session c = (Session) me.getKey();
				calendarEvents.add(new Calendar("Session", false, c.getBooking_date(), c.getBooking_date()));
			}
			
			String jsonEvents = new Gson().toJson(calendarEvents);
			
			request.setAttribute("sessions", temp);
			request.setAttribute("calendarEvents", jsonEvents);
			request.getRequestDispatcher("TutorUserProfile.jsp").forward(request, response);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int sessionID = Integer.parseInt(request.getParameter("sessionID"));

		try {
			TutorDAO tdao = new TutorDAO();
			tdao.cancelTutorSession(0, sessionID, 1);
			response.sendRedirect("tutorUserProfile");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
