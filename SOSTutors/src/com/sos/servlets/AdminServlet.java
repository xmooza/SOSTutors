package com.sos.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sos.dao.MessageDAO;

public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int m = 0;

		int id = Integer.parseInt(request.getParameter("msgid").trim());

		m = MessageDAO.deleteMessageDB(id);

		if (m == 0) {
			request.setAttribute("errorMessage", "Deleted!");
			request.getRequestDispatcher("AdminHome.jsp").forward(request, response);
		} else {
			request.setAttribute("errorMessage", MessageDAO.error);
			request.getRequestDispatcher("AdminHome.jsp").forward(request, response);
		}

	}
}