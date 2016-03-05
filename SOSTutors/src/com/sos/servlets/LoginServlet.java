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
  
public class LoginServlet extends HttpServlet{  
    private static final long serialVersionUID = 1L;  
    
    public void doPost(HttpServletRequest request, HttpServletResponse response){ 
    	Student s = null;
    	Tutor t = null;
    	       
        String email=request.getParameter("loginUseremail");    
        String password=request.getParameter("loginUserpassword"); 
        String role=request.getParameter("loginUserrole");
        
        if(role=="student")
        	s = LoginDAO.validateStudent(email, password);
    	else
    		t = LoginDAO.validateTutor(email, password);
        if(s != null && role=="student"){   
        	
        	request.getSession().setAttribute("currentStudent", s);
        	
        	RequestDispatcher rd=request.getRequestDispatcher("Profile.jsp");    
            
        	try {
				rd.forward(request,response);
			} catch (ServletException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}    
        }
        else if(t != null && role=="tutor")
        {   
        	request.getSession().setAttribute("currentTutor", t);
        	RequestDispatcher rd=request.getRequestDispatcher("~/Tutor/Profile.jsp");
        	try {
				rd.forward(request,response);
			} catch (ServletException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}    
        }    
        else{
	        request.setAttribute("errorMessage", LoginDAO.error);
            RequestDispatcher rd=request.getRequestDispatcher("Index.jsp");    
            try {
				rd.include(request,response);
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        }    
    }    
}   