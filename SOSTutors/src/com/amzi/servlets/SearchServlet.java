package com.amzi.servlets;  
 
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;

import com.amzi.dao.TutorDAO;
  
public class SearchServlet extends HttpServlet{  
    private static final long serialVersionUID = 1L;

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{   	
		try {
			request.setAttribute("tutorList", new TutorDAO().list());
			request.getRequestDispatcher("TutorSearch.jsp").forward(request, response);
		} catch (SQLException e) {
			e.printStackTrace();
		}
    }    
}   
