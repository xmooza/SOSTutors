package com.amzi.servlets;  
  
import java.io.IOException;  
import javax.servlet.RequestDispatcher;  
import javax.servlet.ServletException;  
import javax.servlet.http.HttpServlet;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;  
import com.amzi.dao.Login; 
import com.amzi.dao.Student;
  
public class LoginServlet extends HttpServlet{  
    private static final long serialVersionUID = 1L;  

    public LoginServlet() {
		 super();
	}
    
    public void doPost(HttpServletRequest request, HttpServletResponse response){ 
    	Student s = null;
    	       
        String email=request.getParameter("loginUseremail");    
        String password=request.getParameter("loginUserpassword");   
            
        s = Login.validate(email, password);
        
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
        else{

	        request.setAttribute("errorMessage", Login.error);
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