package com.sos.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.sos.to.Category;
import com.sos.to.Session;

public class AdminDAO {

	public static List<Category> getCategoriesDB() {
		ResultSet rs = null;
		PreparedStatement pst = null;
		List<Category> categories = new ArrayList<Category>();
		Category category = null;
		DBConnector connectionManager = new DBConnector();

		try {
			pst = connectionManager.getConnection().prepareStatement(
					"select * from categories");
			rs = pst.executeQuery();
			if (rs == null)
				return null;
			if (rs.next()) {
				rs.beforeFirst();
				while (rs.next()) {
					category = new Category(rs.getInt("categoryID"),
							rs.getString("subjectEN"),
							rs.getString("subjectFR"),
							rs.getString("descriptionEN"),
							rs.getString("descriptionFR"),
							rs.getString("language"));
					categories.add(category);
				}
			}
			rs.close();
			pst.close();

		} catch (SQLException sqlE) {
			sqlE.printStackTrace();
			return null;
		} finally {
			try {
				rs.close();
				pst.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return categories;
	}

	public static int addCategoryDB(String subject, String description,
			String language) {
		PreparedStatement pst = null;
		DBConnector connectionManager = new DBConnector();

		String subjectEN = "";
		String subjectFR = "";
		String descriptionEN = "";
		String descriptionFR = "";

		if (language.contains("English")) {
			subjectEN = subject;
			descriptionEN = description;

		} else if (language.contains("French")) {
			subjectFR = subject;
			descriptionFR = description;
		}

		try {
			pst = connectionManager
					.getConnection()
					.prepareStatement(
							"insert into categories(subjectEN, subjectFR, descriptionEN, descriptionFR, language) values(?,?,?,?,?)");
			pst.setString(1, subjectEN);
			pst.setString(2, subjectFR);
			pst.setString(3, descriptionEN);
			pst.setString(4, descriptionFR);
			pst.setString(5, language);
			pst.executeUpdate();
			pst.close();
		} catch (SQLException sqlE) {
			sqlE.printStackTrace();
			return -3;
		} finally {
			try {
				pst.close();
			} catch (SQLException sqlE) {
				sqlE.printStackTrace();
			}
		}
		return 0;
	}

	public static int updateCategoryDB(int categoryID, String subjectEN,
			String subjectFR, String descriptionEN, String descriptionFR,
			String language) {
		PreparedStatement pst = null;
		DBConnector connectionManager = new DBConnector();

		try {
			pst = connectionManager
					.getConnection()
					.prepareStatement(
							"update categories set subjectEN=?, subjectFR=?, descriptionEN=?, descriptionFR=?, language=? where categoryID=?");
			pst.setString(1, subjectEN);
			pst.setString(2, subjectFR);
			pst.setString(3, descriptionEN);
			pst.setString(4, descriptionFR);
			pst.setString(5, language);
			pst.setString(6, Integer.toString(categoryID));
		} catch (SQLException sqlE) {
			sqlE.printStackTrace();
			return -2;
		} finally {
			try {
				pst.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return 0;
	}

	public static int deleteCategoryDB(int id) {
		PreparedStatement pst = null;
		DBConnector connectionManager = new DBConnector();
		try {
			pst = connectionManager.getConnection().prepareStatement(
					"delete from categories where categoryID=?");
			pst.setInt(1, id);
			pst.executeUpdate();
			pst.close();
		} catch (SQLException sqlE) {
			sqlE.printStackTrace();
			return -3;
		} finally {
			try {
				pst.close();
			} catch (SQLException sqlE) {
				sqlE.printStackTrace();
			}
		}
		return 0;
	}

	public static List<Session> getSessionsDB() {

		ResultSet rs = null;
		PreparedStatement pst = null;
		List<Session> sessions = new ArrayList<Session>();
		Session session = null;
		DBConnector connectionManager = new DBConnector();

		try {
			pst = connectionManager.getConnection().prepareStatement(
					"select * from sessions");
			rs = pst.executeQuery();
			if (rs == null)
				return null;
			if (rs.next()) {
				rs.beforeFirst();
				while (rs.next()) {
					session = new Session(rs.getInt("sessionID"),
							rs.getString("subject"),
							rs.getBoolean("booking_available"),
							rs.getTimestamp("booking_date"),
							rs.getString("booking_location"),
							rs.getInt("tutors_tutorID"),
							rs.getInt("categories_categoryID"),
							rs.getInt("students_studentID"));
					sessions.add(session);
				}
			}
			rs.close();
			pst.close();

		} catch (SQLException sqlE) {
			sqlE.printStackTrace();
			return null;
		} finally {
			try {
				rs.close();
				pst.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return sessions;
	}

	public static int deleteSessionDB(int id) {
		PreparedStatement pst = null;
		DBConnector connectionManager = new DBConnector();
		try {
			pst = connectionManager.getConnection().prepareStatement(
					"delete from sessions where sessionID=?");
			pst.setInt(1, id);
			pst.executeUpdate();
			pst.close();
		} catch (SQLException sqlE) {
			sqlE.printStackTrace();
			return -3;
		} finally {
			try {
				pst.close();
			} catch (SQLException sqlE) {
				sqlE.printStackTrace();
			}
		}
		return 0;
	}

}
