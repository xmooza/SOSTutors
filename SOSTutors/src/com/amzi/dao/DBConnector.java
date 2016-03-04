package com.amzi.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnector {
	
	private String url = "jdbc:mysql://localhost:3306/";  
    private String dbName = "sostutors";  
    private String driver = "com.mysql.jdbc.Driver";  
    private String dbUserName = "root";  
    private String dbPassword = "Vegeta99";
    
    private Connection conn = null;  
    private static DBConnector connectionHelper = null;
	
	public DBConnector() {
		try {
			Class.forName(driver).newInstance();
			conn = DriverManager.getConnection(url + dbName, dbUserName, dbPassword);
		} catch (SQLException sqlE) {
			sqlE.printStackTrace();
		} catch (IllegalAccessException iaE) {
			iaE.printStackTrace();
		} catch (InstantiationException iE) {
			iE.printStackTrace();
		} catch (ClassNotFoundException cnfE) {
			cnfE.printStackTrace();
		}
	}
	
	public int closeConnection(){
		try{
    		conn.close();
    		connectionHelper = null;
    		
    	}catch(SQLException sqlCloseE){
    		sqlCloseE.printStackTrace();
    		return -1;
    	}
		return 0;
	}
	
	public synchronized DBConnector getInstance() {
		if(connectionHelper == null) {
			connectionHelper = new DBConnector();
			if(connectionHelper.conn == null){
				connectionHelper = null;
			}
		}
		return connectionHelper;
	}
	
	public Connection getConnection(){
		if(conn == null){
			return null;
		}
		return this.conn;
	}
	
	public synchronized boolean testConnection(DBConnector connectionManager){
		if(connectionManager == null){
			return false;
		}
		try {
     		if(connectionManager.getConnection().isValid(0) == false){
     			connectionManager.closeConnection();
     			return false;
     		}
		} catch (SQLException sqlConE) {
     		sqlConE.printStackTrace();
     	}
		return true;
	}
	
}