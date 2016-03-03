package com.amzi.dao;  
  
public class Login { 
	
	public static String error = null;
	
    public static Student validate(String email, String password) {          
        Student s = null;

        email = email.trim();
        password = password.trim();
            
        if(email == ""){
            error = "error.invlaidusername";
            return null;
        }
        if(password == ""){
        	error = "error.invalidpass";
            return null;
        }
            
        s = Student.getStudentDB(email, password);
            
        if(s == null){
            error = "error.invalidlogin";
            return null;
        }
        return s;   
    }  
}  