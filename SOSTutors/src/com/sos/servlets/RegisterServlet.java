package com.sos.servlets;

import java.io.IOException;  

import javax.servlet.ServletException;  
import javax.servlet.http.HttpServlet;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;

import com.sos.dao.RegisterDAO;
import com.sos.to.Student;
import com.sos.to.Tutor;

public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;  
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{ 
	    Student s = null;
	    Tutor t = null;
	    
	    String email="";    
	    String password="";
	    String fname="";    
	    String lname="";
	    String profile="";
	    String role="";
	    
	    email=request.getParameter("registerUseremail");    
	    password=request.getParameter("registerUserpassword");
	    fname=request.getParameter("registerUserfname");    
	    lname=request.getParameter("registerUserlname");
	    profile=request.getParameter("registerUserprofile");
	    role=request.getParameter("registerUserrole");
	    
	    if(role.contains("student"))
	    {
	    	try {
				s = RegisterDAO.validateStudent(email, password, fname, lname, profile);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		    if(s != null){  
		    	request.getSession().invalidate();
		        request.getSession().setAttribute("currentStudent", s);
		        request.getRequestDispatcher("Profile.jsp").forward(request, response);    
		    }else{
		        request.setAttribute("errorMessage", RegisterDAO.error);
		        request.getRequestDispatcher("LoginRegister.jsp").forward(request, response);   	            
		   }   
	    }
	    else if(role.contains("tutor"))
	    {
	    	String hourly = "";
	    	String image = "";
	    	String college = "";
	 
	      	hourly = request.getParameter("registerUserhourly");
	    	image = "blank_profile.png";
	    	college = request.getParameter("registerUsercollege");

	    	try {
				t = RegisterDAO.validateTutor(email, password, fname, lname, hourly, image, college, profile);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		    if(t != null){
		    	request.getSession().invalidate();
		        request.getSession().setAttribute("currentTutor", t);
		        request.getRequestDispatcher("TutorProfile.jsp").forward(request, response);    
		    }else{
		        request.setAttribute("errorMessage", RegisterDAO.error);
		        request.getRequestDispatcher("LoginRegister.jsp").forward(request, response);   	            
		   }
		    
	    }
	    else{
	        request.setAttribute("errorMessage", RegisterDAO.error);
	        request.getRequestDispatcher("LoginRegister.jsp").forward(request, response);   	            
	   }
	    
	}
}