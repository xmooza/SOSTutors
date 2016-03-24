package com.sos.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.sos.to.Message;

public class MessageDAO {

	public static String error;

	public List<Message> list() throws SQLException {
		Message message;
		ResultSet rs = null;
		PreparedStatement pst = null;
		List<Message> messages = new ArrayList<Message>();
		DBConnector connectionManager = new DBConnector();

		try {
			pst = connectionManager.getConnection().prepareStatement(
					"select notificationID, subject, content, date_posted, tutors_tutorID, students_studentID, sessions_sessionID from notifications");
			rs = pst.executeQuery();
		} finally {
			while (rs.next()) {
				message = new Message(rs.getInt("notificationID"), rs.getString("subject"), rs.getString("content"),
						rs.getDate("date_posted"), rs.getInt("tutors_tutorID"), rs.getInt("students_studentID"),
						rs.getInt("sessions_sessionID"));
				messages.add(message);
			}
			rs.close();
			pst.close();
		}
		return messages;
	}

	public Message getMessageFromDB(int MessageId) {
		Message m = null;
		ResultSet rs = null;
		PreparedStatement pst = null;
		DBConnector connectionManager = new DBConnector();

		try {
			pst = connectionManager.getConnection()
					.prepareStatement("select * from notifications where notificationID=?");
			pst.setInt(1, MessageId);
			rs = pst.executeQuery();

			if (rs == null) {
				return m;
			}

			rs.first();

			m = new Message(rs.getInt("notificationID"), rs.getString("subject"), rs.getString("content"),
					rs.getDate("date_posted"), rs.getInt("tutors_tutorID"), rs.getInt("students_studentID"),
					rs.getInt("sessions_sessionID"));
		} catch (SQLException sqlE) {
			sqlE.printStackTrace();
			return null;
		} finally {
			try {
				rs.close();
				pst.close();
			} catch (SQLException sqlE) {
				sqlE.printStackTrace();
			}
		}
		return m;
	}

	public static int addMessageDB(String subject, String content, int tutors_tutorID, int students_studentID,
			int sessions_sessionID) {
		PreparedStatement pst = null;
		DBConnector connectionManager = new DBConnector();
		try {
			pst = connectionManager.getConnection().prepareStatement(
					"insert into notifications(subject, content, date_posted, tutors_tutorID, students_studentID, sessions_sessionID) values(?,?,curdate(),?,?,?)");
			pst.setString(1, subject);
			pst.setString(2, content);
			pst.setInt(3, tutors_tutorID);
			pst.setInt(4, students_studentID);
			pst.setInt(5, sessions_sessionID);
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

	public static int deleteMessageDB(int id) {
		PreparedStatement pst = null;
		DBConnector connectionManager = new DBConnector();
		try {
			pst = connectionManager.getConnection()
					.prepareStatement("delete from notifications where notificationID=?");
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

	public List<Message> getMessageByRoleAndID(int id, String role) {
		ResultSet rs = null;
		PreparedStatement pst = null;
		List<Message> messages = new ArrayList<Message>();
		Message message = null;
		DBConnector connectionManager = new DBConnector();

		try {
			if (role == "student") {
				pst = connectionManager.getConnection().prepareStatement("select * from notifications n"
						+ " where n.student_studentID = ?" + " order by c.date_posted desc");
			} else {
				pst = connectionManager.getConnection().prepareStatement("select * from notifications n"
						+ " where n.tutors_tutorID = ?" + " order by c.date_posted desc");

			}
			pst.setInt(1, id);
			rs = pst.executeQuery();
			if (rs == null)
				return null;
			if (rs.next()) {
				rs.beforeFirst();
				while (rs.next()) {
					message = new Message(rs.getInt("notificationID"), rs.getString("subject"), rs.getString("content"),
							rs.getDate("date_posted"), rs.getInt("tutors_tutorID"), rs.getInt("students_studentID"),
							rs.getInt("sessions_sessionID"));
					messages.add(message);
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
		return messages;
	}

	public static List<Message> getAdminMessages() {
		ResultSet rs = null;
		PreparedStatement pst = null;
		List<Message> messages = new ArrayList<Message>();
		Message message = null;
		DBConnector connectionManager = new DBConnector();

		try {
			pst = connectionManager.getConnection().prepareStatement(
					"select * from notifications n" + " where n.subject = ?" + " order by n.date_posted desc");
			pst.setString(1, "admin");
			rs = pst.executeQuery();
			if (rs == null)
				return null;
			if (rs.next()) {
				rs.beforeFirst();
				while (rs.next()) {
					message = new Message(rs.getInt("notificationID"), rs.getString("subject"), rs.getString("content"),
							rs.getDate("date_posted"), rs.getInt("tutors_tutorID"), rs.getInt("students_studentID"),
							rs.getInt("sessions_sessionID"));
					messages.add(message);
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
		return messages;
	}

}
