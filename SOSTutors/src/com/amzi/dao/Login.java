package com.amzi.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Login {

	public static String dateRegistered;

	public static boolean validate(String email, String pass) {
		boolean status = true;
		Connection conn = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		String url = "jdbc:mysql://localhost:3306/";
		String dbName = "sostutors";
		String driver = "com.mysql.jdbc.Driver";
		String dbUserName = "root";
		String dbPassword = "password";
		try {
			Class.forName(driver).newInstance();
			conn = DriverManager.getConnection(url + dbName, dbUserName, dbPassword);
			pst = conn.prepareStatement("select * from students where email=? and password=?");
			pst.setString(1, email);
			pst.setString(2, pass);
			rs = pst.executeQuery();
			rs.first();
			dateRegistered = rs.getString("date_joined");
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