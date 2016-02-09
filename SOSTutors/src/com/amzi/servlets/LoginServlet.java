package com.amzi.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.amzi.dao.Login;

public class LoginServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		String e = request.getParameter("loginUseremail");
		String p = request.getParameter("loginUserpass");

		if (Login.validate(e, p)) {
			HttpSession session = request.getSession(false);
			if (session != null) {
				session.setAttribute("name", e);
				session.setAttribute("dateRegistered", Login.dateRegistered);
			}

			RequestDispatcher rd = request.getRequestDispatcher("TutorSearch.jsp");
			rd.forward(request, response);
		} else {
			out.print("Sorry username or password error on login.");
			RequestDispatcher rd = request.getRequestDispatcher("Index.jsp");
			rd.include(request, response);
		}
		out.close();
	}
}