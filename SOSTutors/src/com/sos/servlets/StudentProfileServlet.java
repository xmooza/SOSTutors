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
import com.sos.dao.StudentDAO;
import com.sos.to.Calendar;
import com.sos.to.Session;
import com.sos.to.Student;

public class StudentProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		@SuppressWarnings("rawtypes")
		Iterator it;
		StudentDAO dao = new StudentDAO();
		ArrayList<Calendar> calendarEvents = new ArrayList<Calendar>();
		HashMap<String, Session> temp = new HashMap<String, Session>();
		Student s = (Student) request.getSession().getAttribute("currentStudent");

		try {
			temp = dao.getStudentSessions(s.getStudentID());
			it = temp.entrySet().iterator();
			
			while (it.hasNext()) {
				@SuppressWarnings("rawtypes")
				Map.Entry me = (Map.Entry) it.next();
				Session c = (Session) me.getValue();
				calendarEvents.add(new Calendar("Session", false, c.getBooking_date(), c.getBooking_date()));
			}
			
			String jsonEvents = new Gson().toJson(calendarEvents);
			
			request.setAttribute("sessions", temp);
			request.setAttribute("calendarEvents", jsonEvents);
			request.getRequestDispatcher("StudentProfile.jsp").forward(request, response);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int sessionID = Integer.parseInt(request.getParameter("sessionID"));

		try {
			StudentDAO sdao = new StudentDAO();
			sdao.cancelStudentSession(0, sessionID, 1);
			response.sendRedirect("studentProfile");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
