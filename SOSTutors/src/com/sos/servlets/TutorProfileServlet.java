package com.sos.servlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sos.dao.StudentDAO;
import com.sos.dao.TutorDAO;
import com.sos.to.Student;

public class TutorProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int tutorID = Integer.parseInt(request.getParameter("tutorID"));
		TutorDAO dao = new TutorDAO();

		if (request.getSession().getAttribute("currentStudent") == null
				&& request.getSession().getAttribute("currentTutor") == null) {
			response.sendRedirect("errors/403.jsp");
			return;
		}

		try {
			request.setAttribute("tutor", dao.getTutorFromDatabaseById(tutorID));
			request.setAttribute("sessions", dao.getTutorSessions(tutorID));
			request.setAttribute("comments", dao.getTutorComments(tutorID));
			request.getRequestDispatcher("TutorProfile.jsp").forward(request, response);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int tutorID = Integer.parseInt(request.getParameter("tutorID"));
		int sessionID = Integer.parseInt(request.getParameter("sessionID"));

		try {
			StudentDAO sdao = new StudentDAO();
			sdao.updateStudentSession(tutorID,
					((Student) request.getSession().getAttribute("currentStudent")).getStudentID(), sessionID, 0);
			response.sendRedirect("tutorProfile?tutorID=" + tutorID);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
