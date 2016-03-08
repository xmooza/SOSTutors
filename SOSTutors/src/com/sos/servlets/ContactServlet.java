package com.sos.servlets;

import java.io.IOException;  
import javax.servlet.ServletException;  
import javax.servlet.http.HttpServlet;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;

import com.sos.dao.MessageDAO;

public class ContactServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;  
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{ 
	    int m = 0;
	    
	    String email="";
	    String name="";
	    String content="";
	    String subject="";
	    
	    email=request.getParameter("conUseremail");    
	    name=request.getParameter("conUsername");    
	    content=request.getParameter("conUsercontent");
	    subject=request.getParameter("conUsersubject");
	    
	  
	    	m = MessageDAO.addMessageDB(subject, "From: "+name+"("+email+")<br/>" + " Content: " + content + ".", 0, 0, 0);
		    if(m == 0){    		        	
		        request.getRequestDispatcher("Index.jsp").forward(request, response);    
		    }else{
		        request.setAttribute("errorMessage", MessageDAO.error);
		        request.getRequestDispatcher("Index.jsp").forward(request, response);   	            
		   }
	    
	}
}