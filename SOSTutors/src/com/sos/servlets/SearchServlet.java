package com.sos.servlets;  
 
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;

import com.sos.dao.TutorDAO;
  
public class SearchServlet extends HttpServlet{  
    private static final long serialVersionUID = 1L;

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{   	
    	int page = 1;
    	int perPage = 6;
    	TutorDAO dao = new TutorDAO();
    	
    	if(request.getParameter("page") != null){
    		page = Integer.parseInt(request.getParameter("page"));
    	}
    	
		try {
			request.setAttribute("tutorList", dao.list((page-1) * perPage, perPage, request.getParameter("searchTerm"), request.getParameter("subject")));
			request.setAttribute("noOfRecords", dao.getNoRecords());
			request.setAttribute("noOfPages", (int) Math.ceil(dao.getNoRecords() * 1.0 / perPage * 1.0));
			if (page > (int) Math.ceil(dao.getNoRecords() * 1.0 / perPage * 1.0)){
				request.setAttribute("currentPage", (int) Math.ceil(dao.getNoRecords() * 1.0 / perPage * 1.0));
			}
			else{
				request.setAttribute("currentPage", page);
			}
			request.getRequestDispatcher("TutorSearch.jsp").forward(request, response);
		} catch (SQLException e) {
			e.printStackTrace();
		}
    }
}   
