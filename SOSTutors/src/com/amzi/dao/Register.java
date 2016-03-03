package com.amzi.dao;  
    
public class Register {  
	
	public static String error = null;
	
	public static Student validate(String email, String password, String fname, String lname) {          
        Student s = null;
        int errorCode = 0;
        
        email = email.trim();
        password = password.trim();
        fname = fname.trim();
        lname = lname.trim();
        	
        if(email.equals("")){
        	error = "errorregister.nousername";
        	return null;
        }
        	
        if(password.equals("")){
        	error = "errorregister.nopass";
        	return null;
        }
        
        if(fname.equals("")){
        	error = "errorregister.nousername";
        	return null;
        }
        	
        if(lname.equals("")){
        	error = "errorregister.nopass";
        	return null;
        }
        	
        errorCode = Student.addStudentDB(email, password, fname, lname);
        
        if(errorCode == -1){
        	error = "errorregister.sqlconnection";
        	return null;
        }
        
        if(errorCode == -2){
        	System.out.println("Error with database interaction.");
        	error = "errorregister.sql";
        	return null;
        }
        
        s = Student.getStudentDB(email, password);
          
        return s;  
    }  
}  