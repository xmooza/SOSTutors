package com.amzi.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.amzi.dao.Register;

public class RegisterServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		String e = request.getParameter("registerUseremail");
		String p = request.getParameter("registerUserpass");
		String fn = request.getParameter("registerUserfname");
		String ln = request.getParameter("registerUserlname");

		if (Register.validate(fn, ln, e, p)) {
			HttpSession session = request.getSession(false);
			if (session != null) {
				session.setAttribute("email", e);
				session.setAttribute("dateRegistered", Register.dateRegistered);
			}
			RequestDispatcher rd = request
					.getRequestDispatcher("TutorSearch.jsp");
			rd.forward(request, response);
		} else {
			out.print("Something went wrong with the registration process");
			response.setContentType("text/plaintext");
			RequestDispatcher rd = request.getRequestDispatcher("Index.jsp");
			rd.include(request, response);
		}
		out.close();
	}
}