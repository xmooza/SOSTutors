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
        	System.out.println("Username was not entered.");
        	error = "errorregister.nousername";
        	return null;
        }
        	
        if(password.equals("")){
        	System.out.println("Password was not entered.");
        	error = "errorregister.nopass";
        	return null;
        }
        
        if(fname.equals("")){
        	System.out.println("First name was not entered.");
        	error = "errorregister.nousername";
        	return null;
        }
        	
        if(lname.equals("")){
        	System.out.println("Last name was not entered.");
        	error = "errorregister.nopass";
        	return null;
        }
        	
        errorCode = Student.insertUserIntoDatabase(email, password, fname, lname);
        
        if(errorCode == -1){
        	System.out.println("Unable to establish connection with database.");
        	error = "errorregister.sqlconnection";
        	return null;
        }
        
        if(errorCode == -2){
        	System.out.println("A user with the same name already exists within SOSTutors.");
        	error = "errorregister.userexists";
        	return null;
        }
        
        if(errorCode == -3){
        	System.out.println("Error with database interaction.");
        	error = "errorregister.sql";
        	return null;
        }
        
        s = Student.getUserFromDatabaseByCredentials(email, password);
          
        return s;  
    }  
}  