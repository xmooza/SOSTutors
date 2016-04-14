package com.sos.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sos.dao.AES;
import com.sos.dao.StudentDAO;

public class EditStudentProfileServlet  extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditStudentProfileServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String fname = "";
		String lname = "";
		String email = "";
		String password = "";
		String profile = "";
		
		String role = "";
		role = request.getParameter("editStudentRole");
		
		int sessionID = 0;
		int v = -1;
		if (role.contains("student")) {
			sessionID = Integer.parseInt(request.getParameter("editStudentid"));
			fname = request.getParameter("editStudentFname");
			lname = request.getParameter("editStudentLname");
			email = request.getParameter("editStudentEmail");
			profile = request.getParameter("editStudentprofile");
			try {
				password = AES.encrypt((request.getParameter("editNewPassword")));
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			v = StudentDAO.updateStudentDB(sessionID, email, password, fname, lname, profile);
		}
		if (v == 0) {
			request.setAttribute("errorMessage", "Updated!");
			request.getRequestDispatcher("StudentProfile.jsp").forward(request, response);
		} 
		else {
			request.setAttribute("errorMessage", "Error");
			request.getRequestDispatcher("StudentProfile.jsp").forward(request, response);
		}
	}

}

