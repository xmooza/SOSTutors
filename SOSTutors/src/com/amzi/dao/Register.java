package com.amzi.dao;  
  
import java.sql.Connection;  
import java.sql.DriverManager;  
import java.sql.PreparedStatement;  
import java.sql.SQLException;  
import java.sql.ResultSet;
  
public class Register {  
	public static String dateRegistered;
	
	public static boolean validate(String fname, String lname, String email, String pass) {          
        boolean status = true;  
        Connection conn = null;  
        PreparedStatement pst = null; 
        ResultSet rs = null;
        Exception ex = new Exception();
  
        String url = "jdbc:mysql://localhost:3306/";  
        String dbName = "sostutors";  
        String driver = "com.mysql.jdbc.Driver";  
        String dbUserName = "root";  
        String dbPassword = "Vegeta99";
        
        try {  
           
        	fname = fname.trim();
        	lname = lname.trim();
        	email = email.trim();
        	pass = pass.trim();
        	
        	if(email.equals("")){
        		System.out.println("No email entered, throwing Java.lang.exception");
        		throw ex;
        	}
        	
        	if(pass.equals("")){
        		System.out.println("No password entered, throwing Java.lang.exception");
        		throw ex;
        	}
        	
        	
        	Class.forName(driver).newInstance();  
            conn = DriverManager  
                    .getConnection(url + dbName, dbUserName, dbPassword);  
  
            pst = conn  
                    .prepareStatement("insert into students values('"+fname+"','"+email+"','"+pass+"', curdate(), '"+lname+"' );");  
           
            pst.executeUpdate(); 
            
            pst.close();
            
            pst = conn.prepareStatement("select * from students where email=? and password=?"); 
            
            pst.setString(1, email);  
            pst.setString(2, pass);  
  
            rs = pst.executeQuery(); 
            
            rs.first();
            //if the query works,this should never be null. But do we wanna check just because??
            dateRegistered = rs.getString("DateRegistered");
  
        } catch (Exception e) {  
            System.out.println(e);  
            status = false;
        } finally {  
            if (conn != null) {  
                try {  
                    conn.close();  
                } catch (SQLException e) {  
                    e.printStackTrace();  
                }  
            }  
            if (pst != null) {  
                try {  
                    pst.close();  
                } catch (SQLException e) {  
                    e.printStackTrace();  
                }  
            }  
            if (rs != null) {  
                try {  
                    rs.close();  
                } catch (SQLException e) {  
                    e.printStackTrace();  
                }  
            }  
        }  
        return status;  
    }  
}  