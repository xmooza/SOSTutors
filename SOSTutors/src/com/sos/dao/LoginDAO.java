package com.sos.dao;
import com.sos.to.*;

public class LoginDAO { 
	
	public static String error = null;
	
    public static Student validateStudent(String email, String password) {          
        Student s = null;

        email = email.trim();
        password = password.trim();
            
        if(email == ""){
            error = "error.invaliduser";
            return null;
        }
        if(password == ""){
        	error = "error.invalidpass";
            return null;
        }
            
        s = StudentDAO.getStudentDB(email, password);
            
        if(s == null){
            error = "error.invalidlogin";
            return null;
        }
        return s;   
    }  
    public static Tutor validateTutor(String email, String password) {          
        Tutor t = null;

        email = email.trim();
        password = password.trim();
            
        if(email == ""){
            error = "error.invaliduser";
            return null;
        }
        if(password == ""){
        	error = "error.invalidpass";
            return null;
        }
            
        t = TutorDAO.getTutorDB(email, password);
            
        if(t == null){
            error = "error.invalidlogin";
            return null;
        }
        return t;   
    }  
}  