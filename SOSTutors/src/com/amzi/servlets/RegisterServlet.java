package com.amzi.servlets;

import java.io.IOException;  
import java.io.PrintWriter;  
  


import javax.servlet.RequestDispatcher;  
import javax.servlet.ServletException;  
import javax.servlet.http.HttpServlet;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;  
import javax.servlet.http.HttpSession;

import com.amzi.dao.Register; 

public class RegisterServlet extends HttpServlet {

	 private static final long serialVersionUID = 1L;  
	  
	    public void doPost(HttpServletRequest request, HttpServletResponse response)    
	            throws ServletException, IOException {    
	  
	        response.setContentType("text/html");    
	        PrintWriter out = response.getWriter();    
	          
	        String e=request.getParameter("regEmail");    
	        String p=request.getParameter("regPass");
	        String fn=request.getParameter("regFName");
	        String ln=request.getParameter("regLName");
	            
	        if(Register.validate(fn, ln, e, p)){    
	        	HttpSession session = request.getSession(false);  
	            if(session!=null) {
	            	session.setAttribute("email",e);
	                session.setAttribute("dateRegistered", Register.dateRegistered);
	            }
	            
	            /*
	               * 
	               * 
	               * could use this approach to catch error in event of null.
	               * try{
	               * 
	               * 	if(session == null){
	               * 		throw exception;
	               * 	}
	               * 
	               *  	HttpSession session = request.getSession(false);  
	               *  	session.setAttribute("name",n);
	               *  	session.setAttribute("dateRegistered", Login.dateRegistered);
	               * }catch(Exception e){
	               * 	 System.out.println(e);  
	               *    //load error page once fully implemented
	               * }
	               * 
	               */
	        	
	        	
	        	RequestDispatcher rd=request.getRequestDispatcher("TutorSearch.jsp");    
	            rd.forward(request,response);    
	        }    
	        else{    
	            out.print("<p style=\"color:red\">But they really like appearing here <br> Sorry username or password error on registration</p>"); 
	        	response.setContentType("text/plaintext");
	            
	        	//out.print("<% document.getElementById(\"errorOutput\").innerHTML = \"Sorry username or password error\" /%> ");
	            
	        	/*out.print("<script>");
	        	out.print("function error() { document.getElementById(\"errorOutput\").innerHTML = \"Sorry username or password error\"; }");
	        	out.print("\"error()\";");
	        	out.print("</script>");*/
	       
	            
	            RequestDispatcher rd=request.getRequestDispatcher("Index.jsp");    
	            rd.include(request,response);    
	        }    
	  
	        out.close();    
	    }
}