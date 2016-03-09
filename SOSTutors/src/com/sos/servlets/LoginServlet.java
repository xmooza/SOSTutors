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
        
        if(email=="admin" && password=="rules")
        {
        	request.getSession().invalidate();
        	request.getSession().setAttribute("admin", "true");
        	RequestDispatcher rd=request.getRequestDispatcher("AdminHome.jsp");
        	try {
				rd.forward(request,response);
			} catch (ServletException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}    
        }
        
        try {
			s = LoginDAO.validateStudent(email, password);
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
        try {
			t = LoginDAO.validateTutor(email, password);
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}    
        
        if(s != null){   
        	
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
        else if(t != null)
        {   
        	request.getSession().invalidate();
        	request.getSession().setAttribute("currentTutor", t);
        	RequestDispatcher rd=request.getRequestDispatcher("TutorProfile.jsp");
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
            RequestDispatcher rd=request.getRequestDispatcher("LoginRegister.jsp");    
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