package com.sos.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sos.dao.LoginDAO;
import com.sos.to.Student;
import com.sos.to.Tutor;

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		Student s = null;
		Tutor t = null;

		String email = request.getParameter("loginUseremail");
		String password = request.getParameter("loginUserpassword");
		try {
			if (LoginDAO.validateStudent(email, password) != null) {
				s = LoginDAO.validateStudent(email, password);
			} else {
				t = LoginDAO.validateTutor(email, password);
			}
		} catch (Exception e2) {
			e2.printStackTrace();
		}

		if (s != null) {

			request.getSession().setAttribute("currentStudent", s);
			response.sendRedirect("studentProfile");
		} else if (t != null) {
			request.getSession().invalidate();
			request.getSession().setAttribute("currentTutor", t);
			RequestDispatcher rd = request.getRequestDispatcher("TutorProfile.jsp");
			try {
				rd.forward(request, response);
			} catch (ServletException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			request.setAttribute("errorMessage", LoginDAO.error);
			RequestDispatcher rd = request.getRequestDispatcher("LoginRegister.jsp");
			try {
				rd.include(request, response);
			} catch (ServletException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
}