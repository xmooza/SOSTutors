package com.amzi.dao;  
  
public class Login { 
	
	public static String error = null;
	
	//could return a user object instead, and if null then there was an error.
    public static Student validate(String email, String password) {          
        Student s = null;

        email = email.trim();
        password = password.trim();
            
        if(email == ""){
            System.out.println("Username was not entered\n");
            error = "error.nousername";
            return null;
        }
            
        if(password == ""){
        	System.out.println("Password was not entered\n");
        	error = "error.nopass";
            return null;
        }
            
        s = Student.getUserFromDatabaseByCredentials(email, password);
            
        if(s == null){
        	System.out.println("The entered username and password do not match registered users, throwing SQLException\n");
            error = "error.wrongcredentials";
            return null;
        }
        return s;   
    }  
}  