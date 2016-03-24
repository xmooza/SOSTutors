package com.sos.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.sos.to.Comment;
import com.sos.to.Message;
import com.sos.to.Session;
import com.sos.to.Student;

public class StudentDAO {

	public List<Student> list() throws SQLException {
		Student student;
		ResultSet rs = null;
		PreparedStatement pst = null;
		List<Student> students = new ArrayList<Student>();
		DBConnector connectionManager = new DBConnector();

		try {
			pst = connectionManager.getConnection().prepareStatement(
					"SELECT tutorID, email, password, fname, lname, profile, hourly, date_joined, image, college, rating FROM STUDENTS");
			rs = pst.executeQuery();
		} finally {
			while (rs.next()) {
				student = new Student(rs.getInt("studentID"), rs.getString("email"), rs.getString("password"),
						rs.getString("fname"), rs.getString("lname"), rs.getString("profile"), rs.getString("language"),
						rs.getDate("date_joined"));
				students.add(student);
			}
			rs.close();
			pst.close();
		}
		return students;
	}

	public static Student getStudentDB(String email, String password) {
		Student student = null;
		ResultSet rs = null;
		PreparedStatement pst = null;
		DBConnector connectionManager = new DBConnector();

		try {
			pst = connectionManager.getConnection()
					.prepareStatement("select * from students where email=? and password=?");
			pst.setString(1, email);
			pst.setString(2, password);

			rs = pst.executeQuery();

			if (!rs.first()) {
				return null;
			}

			student = new Student(rs.getInt("studentID"), rs.getString("email"), rs.getString("password"),
					rs.getString("fname"), rs.getString("lname"), rs.getString("profile"), rs.getString("language"),
					rs.getDate("date_joined"));
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
		return student;
	}

	public Student getStudentFromDatabaseById(int StudentId) {
		Student s = null;
		ResultSet rs = null;
		PreparedStatement pst = null;
		DBConnector connectionManager = new DBConnector();

		try {
			pst = connectionManager.getConnection().prepareStatement("select * from Students where StudentID=?");
			pst.setInt(1, StudentId);
			rs = pst.executeQuery();

			if (rs == null) {
				return s;
			}

			rs.first();

			s = new Student(rs.getInt("StudentID"), rs.getString("email"), rs.getString("password"),
					rs.getString("fname"), rs.getString("lname"), rs.getString("profile"), rs.getString("language"),
					rs.getDate("date_joined"));
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
		return s;
	}

	public static int addStudentDB(String email, String password, String fname, String lname, String profile) {
		PreparedStatement pst = null;
		DBConnector connectionManager = new DBConnector();

		try {
			pst = connectionManager.getConnection().prepareStatement(
					"insert into students(email, password, fname, lname, profile, date_joined) values(?,?,?,?,?,curdate())");
			pst.setString(1, email);
			pst.setString(2, password);
			pst.setString(3, fname);
			pst.setString(4, lname);
			pst.setString(5, profile);
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

	public static int updateStudentDB(String role, String newEmail, String newPass, int studentID) {
		PreparedStatement pst = null;
		DBConnector connectionManager = new DBConnector();

		try {
			pst = connectionManager.getConnection()
					.prepareStatement("update students set email=?, password=? where studentID=?");
			pst.setString(1, newEmail);
			pst.setString(2, newPass);
			pst.setString(3, Integer.toString(studentID));
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

	public HashMap<Session, String> getStudentSessions(int studentID) throws SQLException {
		ResultSet rs = null;
		PreparedStatement pst = null;
		String tutorInfo = "";
		HashMap<Session, String> studentSessions = new HashMap<Session, String>();
		Session session = null;
		DBConnector connectionManager = new DBConnector();

		try {
			pst = connectionManager.getConnection().prepareStatement(
					"SELECT * FROM sessions s LEFT JOIN tutors ON  s.tutors_tutorID = tutorID where s.students_studentID = ?");

			pst.setInt(1, studentID);
			rs = pst.executeQuery();
			if (rs == null)
				return null;
			if (rs.next()) {
				rs.beforeFirst();
				while (rs.next()) {
					session = new Session(rs.getInt("sessionID"), rs.getString("subject"),
							rs.getBoolean("booking_available"), rs.getTimestamp("booking_date"),
							rs.getString("booking_location"), rs.getInt("tutors_tutorID"),
							rs.getInt("categories_categoryID"), rs.getInt("students_studentID"));
					tutorInfo = rs.getString("fname") + " " + rs.getString("lname");
					studentSessions.put(session, tutorInfo);
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
		return studentSessions;
	}

	public List<Comment> getStudentComments(int studentID) {
		ResultSet rs = null;
		PreparedStatement pst = null;
		List<Comment> studentComments = new ArrayList<Comment>();
		Comment comment = null;
		DBConnector connectionManager = new DBConnector();

		try {
			pst = connectionManager.getConnection().prepareStatement(
					"select * from comments c" + " where c.students_studentID = ?" + " order by c.date_posted desc");

			pst.setInt(1, studentID);
			rs = pst.executeQuery();
			if (rs == null)
				return null;
			if (rs.next()) {
				rs.beforeFirst();
				while (rs.next()) {
					comment = new Comment(rs.getInt("commentID"), rs.getString("subject"), rs.getString("content"),
							rs.getDate("date_posted"), rs.getInt("tutors_tutorID"), rs.getInt("students_studentID"));
					studentComments.add(comment);
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
		return studentComments;
	}

	public List<Message> getStudentMessages(int studentID) {
		ResultSet rs = null;
		PreparedStatement pst = null;
		List<Message> studentMessages = new ArrayList<Message>();
		Message Message = null;
		DBConnector connectionManager = new DBConnector();

		try {
			pst = connectionManager.getConnection().prepareStatement("select * from notifications n"
					+ " where n.students_studentID = ?" + " order by n.date_posted desc");

			pst.setInt(1, studentID);
			rs = pst.executeQuery();
			if (rs == null)
				return null;
			if (rs.next()) {
				rs.beforeFirst();
				while (rs.next()) {
					Message = new Message(rs.getInt("NotificationID"), rs.getString("subject"), rs.getString("content"),
							rs.getDate("date_posted"), rs.getInt("tutors_tutorID"), rs.getInt("students_studentID"),
							rs.getInt("sessions_sessionID"));
					studentMessages.add(Message);
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
		return studentMessages;
	}

	public void updateStudentSession(int tutorID, int studentID, int sessionID, int avail) throws SQLException {
		PreparedStatement pst = null;
		DBConnector connectionManager = new DBConnector();

		try {
			pst = connectionManager.getConnection().prepareStatement(
					"UPDATE sessions SET students_studentID=?, booking_available=? WHERE tutors_tutorID=? AND sessionID=?");
		} finally {
			pst.setInt(1, studentID);
			pst.setInt(2, avail);
			pst.setInt(3, tutorID);
			pst.setInt(4, sessionID);

			pst.executeUpdate();

			pst.close();
		}
	}

	public void cancelStudentSession(int studentID, int sessionID, int avail) throws SQLException {
		PreparedStatement pst = null;
		DBConnector connectionManager = new DBConnector();

		try {
			pst = connectionManager.getConnection().prepareStatement(
					"UPDATE sessions SET students_studentID=?, booking_available=? WHERE sessionID=?");
		} finally {
			pst.setInt(1, studentID);
			pst.setInt(2, avail);
			pst.setInt(3, sessionID);

			pst.executeUpdate();

			pst.close();
		}
	}

	public static List<Student> getAdminStudents() {
		ResultSet rs = null;
		PreparedStatement pst = null;
		List<Student> students = new ArrayList<Student>();
		Student student = null;
		DBConnector connectionManager = new DBConnector();

		try {
			pst = connectionManager.getConnection().prepareStatement("select * from students");
			rs = pst.executeQuery();
			if (rs == null)
				return null;
			if (rs.next()) {
				rs.beforeFirst();
				while (rs.next()) {
					student = new Student(rs.getInt("StudentID"), rs.getString("email"), rs.getString("password"),
							rs.getString("fname"), rs.getString("lname"), rs.getString("profile"),
							rs.getString("language"), rs.getDate("date_joined"));
					students.add(student);
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
		return students;
	}
	
	public static int deleteStudentDB(int id) {
		PreparedStatement pst = null;
		DBConnector connectionManager = new DBConnector();
		try {
			pst = connectionManager.getConnection()
					.prepareStatement("delete from students where StudentID=?");
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
