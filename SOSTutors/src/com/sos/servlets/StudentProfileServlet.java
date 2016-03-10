package com.sos.servlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sos.dao.StudentDAO;
import com.sos.to.Student;

public class StudentProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		StudentDAO dao = new StudentDAO();
		Student s = (Student) request.getSession().getAttribute("currentStudent");

		try {
			request.setAttribute("sessions", dao.getStudentSessions(s.getStudentID()));
			request.getRequestDispatcher("StudentProfile.jsp").forward(request, response);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
