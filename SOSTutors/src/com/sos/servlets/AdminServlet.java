package com.sos.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sos.dao.AdminDAO;
import com.sos.dao.MessageDAO;
import com.sos.dao.StudentDAO;
import com.sos.dao.TutorDAO;


public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int v = -1;

		String subject = "";
		String description = "";
		String language = "";
		
		subject = request.getParameter("catSubject");
		description = request.getParameter("catDescription");
		language = request.getParameter("catLanguage");

		v = AdminDAO.addCategoryDB(subject, description, language);
		if (v == 0) {
			request.setAttribute("errorMessage", "Added!");
			request.getRequestDispatcher("AdminHome.jsp").forward(request, response);
		} else {
			request.setAttribute("errorMessage", "Add Error");
			request.getRequestDispatcher("AdminHome.jsp").forward(request, response);
		}
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int v = 0;
		int id;
		
		if(request.getParameter("msgid")!=null){
			id = Integer.parseInt(request.getParameter("msgid").trim());
			v = MessageDAO.deleteMessageDB(id);
		}
		if(request.getParameter("tutid")!=null){
			id = Integer.parseInt(request.getParameter("tutid").trim());
			v = TutorDAO.deleteTutorDB(id);
		}
		if(request.getParameter("stuid")!=null){
			id = Integer.parseInt(request.getParameter("stuid").trim());
			v = StudentDAO.deleteStudentDB(id);
		}
		if(request.getParameter("sesid")!=null){
			id = Integer.parseInt(request.getParameter("sesid").trim());
			v = AdminDAO.deleteCategoryDB(id);
		}
		if(request.getParameter("catid")!=null){
			id = Integer.parseInt(request.getParameter("catid").trim());
			v = AdminDAO.deleteCategoryDB(id);
		}
		if (v == 0) {
			request.setAttribute("errorMessage", "Deleted!");
			request.getRequestDispatcher("AdminHome.jsp").forward(request, response);
		} else {
			request.setAttribute("errorMessage", "Delete Error");
			request.getRequestDispatcher("AdminHome.jsp").forward(request, response);
		}
	}
}