package com.sos.servlets;

import java.io.IOException;  
import javax.servlet.ServletException;  
import javax.servlet.http.HttpServlet;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;

import com.sos.dao.RegisterDAO;
import com.sos.to.Student;

public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;  
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{ 
	    Student s = null;
	    String email = "";
	    String password = "";
	    String fname = "";
	    String lname = "";
	    	    	      
	    email=request.getParameter("registerUseremail");    
	    password=request.getParameter("registerUserpassword");
	    fname=request.getParameter("registerUserfname");    
	    lname=request.getParameter("registerUserlname");
	         
	    s = RegisterDAO.validate(email, password, fname, lname);
	        
	    if(s != null){    		        	
	        request.getSession().setAttribute("currentStudent", s);
	        request.getRequestDispatcher("Profile.jsp").forward(request, response);    
	    }else{
	        request.setAttribute("errorMessage", RegisterDAO.error);
	        request.getRequestDispatcher("Index.jsp").forward(request, response);   	            
	   }    
	}
}