package com.sos.dao;

import com.sos.to.Student;
import com.sos.to.Tutor;

public class RegisterDAO {  
	
	public static String error = null;
	
	public static Student validateStudent(String email, String password, String fname, String lname, String profile) throws Exception {          
        Student s = null;
	    
        int errorCode = 0;
        email = email.trim();
        password =  AES.encrypt(password.trim());
        fname = fname.trim();
        lname = lname.trim();
        profile = profile.trim();
        	
        if(email.equals("")){
        	error = "errorregister.empty";
        	return null;
        }
        	
        if(password.equals("")){
        	error = "errorregister.empty";
        	return null;
        }
        
        if(fname.equals("")){
        	error = "errorregister.empty";
        	return null;
        }
        	
        if(lname.equals("")){
        	error = "errorregister.empty";
        	return null;
        }
        
        if(profile.equals("")){
        	profile = "";
        }
        	
        errorCode = StudentDAO.addStudentDB(email, password, fname, lname, profile);
        
        if(errorCode == -1){
        	error = "errorregister.sqlconnection";
        	return null;
        }
        
        if(errorCode == -2){
        	error = "errorregister.sql";
        	return null;
        }
        
        s = StudentDAO.getStudentDB(email, password);
          
        return s;  
    }  
	
	public static Tutor validateTutor(String email, String password, String fname, String lname, String hourly, String image, String college, String profile) throws Exception {          
        Tutor t = null;
        int errorCode = 0;
        
        email = email.trim();
        password =  AES.encrypt(password.trim());
        fname = fname.trim();
        lname = lname.trim();
        hourly = lname.trim();
        image = image.trim();
        college = college.trim();
        profile = profile.trim();
        
        
        if(email.equals("")){
        	error = "errorregister.empty";
        	return null;
        }
        	
        if(password.equals("")){
        	error = "errorregister.empty";
        	return null;
        }
        
        if(fname.equals("")){
        	error = "errorregister.empty";
        	return null;
        }
        	
        if(lname.equals("")){
        	error = "errorregister.empty";
        	return null;
        }
        
        if(hourly.equals("")){
        	error = "errorregister.empty";
        	return null;
        }
        
        if(image.equals("")){
        	//error = "errorregister.empty";
        	//return null;
        }
        
        if(college.equals("")){
        	error = "errorregister.empty";
        	return null;
        }
        
        if(profile.equals("")){
        	error = "errorregister.empty";
        	return null;
        }
        	
        errorCode = TutorDAO.addTutorDB(email, password, fname, lname, hourly, image, college, profile);
        
        if(errorCode == -1){
        	error = "errorregister.sqlconnection";
        	return null;
        }
        
        if(errorCode == -2){
        	error = "errorregister.sql";
        	return null;
        }
        
        t = TutorDAO.getTutorDB(email, password);
          
        return t;  
    }  
}  