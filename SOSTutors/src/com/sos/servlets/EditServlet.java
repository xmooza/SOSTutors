package com.sos.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sos.dao.AES;
import com.sos.dao.TutorDAO;
import com.sos.dao.StudentDAO;
import com.sos.to.Tutor;
import com.sos.to.Student;
import com.sos.to.Mail;

public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) {
		StudentDAO sdao = null;
		TutorDAO tdao = null;
		Tutor t = null;
		Student s = null;

		if (request.getParameter("stuid") != null) {
			sdao = new StudentDAO();
			s = sdao.getStudentFromDatabaseById(Integer.parseInt(request
					.getParameter("stuid")));
		} else if (request.getParameter("tutid") != null) {
			tdao = new TutorDAO();
			t = tdao.getTutorFromDatabaseById(Integer.parseInt(request
					.getParameter("tutid")));
		}
		if (s != null) {
			request.setAttribute("student", s);
			try {
				request.getRequestDispatcher("AdminEditStudent.jsp").forward(
						request, response);
			} catch (ServletException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if (t != null) {
			request.setAttribute("tutor", t);
			try {
				request.getRequestDispatcher("AdminEditTutor.jsp").forward(
						request, response);
			} catch (ServletException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = "";
		String password = "";
		String fname = "";
		String lname = "";
		String profile = "";
		String hourly = "";
		int rating = 0;
		String image = "";
		String college = "";
		int enabled = 0;
		Mail m = new Mail();
		
		String role = "";
		
		int id = 0;
		int v = -1;
		
		role = request.getParameter("editRole");
		if (role.contains("student")) {
			id = Integer.parseInt(request.getParameter("editStudentid"));
			email = request.getParameter("editStudentemail");
			try {
				password = AES.encrypt((request.getParameter("editStudentpassword")));
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			fname = request.getParameter("editStudentfname");
			lname = request.getParameter("editStudentlname");
			profile = request.getParameter("editStudentprofile");
			v = StudentDAO.updateStudentDB(id, email, password, fname, lname, profile);
		}
		if (role.contains("tutor")) {
			id = Integer.parseInt(request.getParameter("editTutorid"));
			email = request.getParameter("editTutoremail");
			try {
				password = AES.encrypt((request.getParameter("editTutorpassword")));
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			fname = request.getParameter("editTutorfname");
			lname = request.getParameter("editTutorlname");
			profile = request.getParameter("editTutorprofile");
			hourly = request.getParameter("editTutorhourly");
			rating = Integer.parseInt(request.getParameter("editTutorrating"));
			image = request.getParameter("editTutorimage");
			college = request.getParameter("editTutorcollege");
			enabled = Integer.parseInt(request.getParameter("editTutorenabled"));
			
			v = TutorDAO.updateTutorDB(id, email, password, fname, lname, profile, hourly, rating, image, college, enabled);
			if(v==0)
				m.send("SOSTutors", email, "Your SOSTutors Status", "Your account is: " + enabled + ". (0=disabled (sorry), 1=enabled (^_^)");
		}
		
		
		
		if (v == 0) {
			request.setAttribute("errorMessage", "Updated!");
			request.getRequestDispatcher("AdminHome.jsp").forward(request, response);
		} 
		else {
			request.setAttribute("errorMessage", "Error");
			request.getRequestDispatcher("AdminHome.jsp").forward(request, response);
		}

	}
}
