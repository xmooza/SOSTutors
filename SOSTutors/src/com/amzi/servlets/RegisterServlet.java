package com.amzi.servlets;

import java.io.IOException;  
import javax.servlet.RequestDispatcher;  
import javax.servlet.ServletException;  
import javax.servlet.http.HttpServlet;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;  
import com.amzi.dao.Register; 
import com.amzi.dao.Student;

public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;  
	 
	public RegisterServlet() {
		 super();
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response){ 
	    Student s = null;
	    String email = "";
	    String password = "";
	    String fname = "";
	    String lname = "";
	    	    	      
	    email=request.getParameter("registerUseremail");    
	    password=request.getParameter("registerUserpassword");
	    fname=request.getParameter("registerUserfname");    
	    lname=request.getParameter("registerUserlname");
	         
	    s = Register.validate(email, password, fname, lname);
	        
	    if(s != null){    		        	
	        request.getSession().setAttribute("currentStudent", s);
	        	
	        //Add user most used data into session.
	        request.getSession().setAttribute("email",email);
	        request.getSession().setAttribute("fname",fname);
	        request.getSession().setAttribute("fname",lname);
	        RequestDispatcher rd=request.getRequestDispatcher("Profile.jsp");    
	        try {
	        	rd.forward(request,response);
			} catch (ServletException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}    
	    }else{
	        request.setAttribute("errorMessage", Register.error);
	        	
	        RequestDispatcher rd=request.getRequestDispatcher("Index.jsp");    
	            
	        try {
				rd.include(request,response);
			} catch (ServletException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}    
	   }    
	}
}