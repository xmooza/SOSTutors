package com.sos.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.sos.to.Comment;
import com.sos.to.Session;
import com.sos.to.Tutor;

public class TutorDAO {
	private int noOfRecords;

	public List<Tutor> list(int offset, int noOfRecords) throws SQLException {
		Tutor tutor;
		PreparedStatement pst = null;
		List<Tutor> tutors = new ArrayList<Tutor>();
		DBConnector connectionManager = new DBConnector();

		try {
			pst = connectionManager.getConnection().prepareStatement(
					"SELECT SQL_CALC_FOUND_ROWS tutorID, email, password, fname, lname, profile, hourly, date_joined, image, college, rating FROM TUTORS limit "
							+ offset + ", " + noOfRecords);
		} finally {
			ResultSet rs = pst.executeQuery();
			if (rs == null) {
				pst.close();
				connectionManager.closeConnection();
				return tutors;
			}
			while (rs.next()) {
				tutor = new Tutor(rs.getInt("tutorID"), rs.getString("email"), rs.getString("password"),
						rs.getString("fname"), rs.getString("lname"), rs.getString("profile"), rs.getString("hourly"),
						rs.getInt("rating"), rs.getDate("date_joined"), rs.getString("image"), rs.getString("college"));
				tutors.add(tutor);
			}
			rs = pst.executeQuery("SELECT FOUND_ROWS()");
			if (rs.next()) {
				this.noOfRecords = rs.getInt(1);
			}
			pst.close();
			rs.close();
		}
		return tutors;
	}

	public List<Tutor> list(int offset, int noOfRecords, String sTerm, String sSubject) throws SQLException {
		Tutor tutor;
		PreparedStatement pst = null;
		List<Tutor> tutors = new ArrayList<Tutor>();
		DBConnector connectionManager = new DBConnector();

		if ((sTerm == "" && sSubject == "") || (sTerm == null && sSubject == null)) {
			return this.list(offset, noOfRecords);
		} else if (sTerm == "" && sSubject.equals("AllSub")) {
			return this.list(offset, noOfRecords);
		} else if (sSubject.equals("AllSub")) {
			try {
				pst = connectionManager.getConnection().prepareStatement(
						"SELECT SQL_CALC_FOUND_ROWS tutorID, email, password, fname, lname, profile, hourly, date_joined, image, college, rating FROM tutors WHERE fname=? OR lname=? OR profile LIKE '% "
								+ sTerm + " %' OR profile LIKE '%" + sTerm + "%' OR profile LIKE '% " + sTerm
								+ "' OR profile LIKE '" + sTerm + " %' OR college LIKE '% " + sTerm
								+ " %' OR college LIKE '%" + sTerm + "%' OR college LIKE '% " + sTerm
								+ "' OR college LIKE '" + sTerm + " %'  LIMIT " + offset + ", " + noOfRecords);
			} finally {
				pst.setString(1, sTerm);
				pst.setString(2, sTerm);
				ResultSet rs = pst.executeQuery();

				if (rs == null) {
					return tutors;
				}

				while (rs.next()) {
					tutor = new Tutor(rs.getInt("tutorID"), rs.getString("email"), rs.getString("password"),
							rs.getString("fname"), rs.getString("lname"), rs.getString("profile"),
							rs.getString("hourly"), rs.getInt("rating"), rs.getDate("date_joined"),
							rs.getString("image"), rs.getString("college"));
					tutors.add(tutor);
				}
				rs = pst.executeQuery("SELECT FOUND_ROWS()");
				if (rs.next()) {
					this.noOfRecords = rs.getInt(1);
				}
				rs.close();
				pst.close();
			}
		} else if (sTerm == "") {
			try {
				pst = connectionManager.getConnection().prepareStatement(
						"SELECT SQL_CALC_FOUND_ROWS t.tutorID, t.email, t.password, t.fname, t.lname, t.profile, t.hourly, t.date_joined, t.image, t.college, t.rating FROM tutors t LEFT JOIN sessions s ON t.tutorID = s.tutors_tutorID WHERE s.subject=? LIMIT "
								+ offset + ", " + noOfRecords);
			} finally {
				pst.setString(1, sSubject);
				ResultSet rs = pst.executeQuery();

				if (rs == null) {
					return tutors;
				}

				while (rs.next()) {
					int dflag = 0;
					tutor = new Tutor(rs.getInt("t.tutorID"), rs.getString("t.email"), rs.getString("t.password"),
							rs.getString("t.fname"), rs.getString("t.lname"), rs.getString("t.profile"),
							rs.getString("t.hourly"), rs.getInt("t.rating"), rs.getDate("t.date_joined"),
							rs.getString("t.image"), rs.getString("t.college"));

					for (int i = 0; i < tutors.size(); i++) {
						if (tutors.get(i).getEmail().equals(tutor.getEmail())) {
							dflag = 1;
						}
					}

					if (dflag == 0) {
						tutors.add(tutor);
					}
				}
				rs = pst.executeQuery("SELECT FOUND_ROWS()");
				if (rs.next()) {
					this.noOfRecords = rs.getInt(1);
				}
				rs.close();
				pst.close();
			}
		} else {
			try {
				pst = connectionManager.getConnection().prepareStatement(
						"SELECT SQL_CALC_FOUND_ROWS t.tutorID, t.email, t.password, t.fname, t.lname, t.profile, t.hourly, t.date_joined, t.image, t.college, t.rating FROM tutors t LEFT JOIN sessions s ON t.tutorID = s.tutors_tutorID WHERE s.subject=? AND (fname=? OR lname=? OR profile LIKE '% "
								+ sTerm + " %' OR profile LIKE '%" + sTerm + "%' OR profile LIKE '% " + sTerm
								+ "' OR profile LIKE '" + sTerm + " %' OR college LIKE '% " + sTerm
								+ " %' OR college LIKE '%" + sTerm + "%' OR college LIKE '% " + sTerm
								+ "' OR college LIKE '" + sTerm + " %') LIMIT " + offset + ", " + noOfRecords);
			} finally {
				pst.setString(1, sSubject);
				pst.setString(2, sTerm);
				pst.setString(3, sTerm);
				ResultSet rs = pst.executeQuery();

				if (rs == null) {
					return tutors;
				}

				while (rs.next()) {
					int dflag = 0;
					tutor = new Tutor(rs.getInt("t.tutorID"), rs.getString("t.email"), rs.getString("t.password"),
							rs.getString("t.fname"), rs.getString("t.lname"), rs.getString("t.profile"),
							rs.getString("t.hourly"), rs.getInt("t.rating"), rs.getDate("t.date_joined"),
							rs.getString("t.image"), rs.getString("t.college"));

					for (int i = 0; i < tutors.size(); i++) {
						if (tutors.get(i).getEmail().equals(tutor.getEmail())) {
							dflag = 1;
						}
					}

					if (dflag == 0) {
						tutors.add(tutor);
					}
				}
				rs = pst.executeQuery("SELECT FOUND_ROWS()");
				if (rs.next()) {
					this.noOfRecords = rs.getInt(1);
				}
				rs.close();
				pst.close();
			}
		}
		return tutors;
	}

	public int getNoRecords() {
		return noOfRecords;
	}

	public static Tutor getTutorDB(String email, String password) {
		Tutor tutor = null;
		ResultSet rs = null;
		PreparedStatement pst = null;
		DBConnector connectionManager = new DBConnector();

		try {
			pst = connectionManager.getConnection()
					.prepareStatement("select * from tutors where email=? and password=?");
			pst.setString(1, email);
			pst.setString(2, password);

			rs = pst.executeQuery();

			if (!rs.first()) {
				return null;
			}

			tutor = new Tutor(rs.getInt("tutorID"), rs.getString("email"), rs.getString("password"),
					rs.getString("fname"), rs.getString("lname"), rs.getString("profile"), rs.getString("hourly"),
					rs.getInt("rating"), rs.getDate("date_joined"), rs.getString("image"), rs.getString("college"));
		} catch (SQLException sqlE) {
			System.out.println("TUTORDAO GETUTORDB");
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
		return tutor;
	}

	public static int addTutorDB(String email, String password, String fname, String lname, String hourly, String image,
			String college, String profile) {
		PreparedStatement pst = null;
		DBConnector connectionManager = new DBConnector();

		try {
			pst = connectionManager.getConnection().prepareStatement(
					"insert into tutors(email, password, fname, lname, hourly, date_joined, image, college, rating, profile) values(?,?,?,?,?,curdate(),?,?,0,?)");
			pst.setString(1, email);
			pst.setString(2, password);
			pst.setString(3, fname);
			pst.setString(4, lname);
			pst.setString(5, hourly);
			pst.setString(6, image);
			pst.setString(7, college);
			pst.setString(8, profile);
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

	public static int updateTutorDB(int studentID, String email, String password, String fname, String lname,
			String profile, String hourly, int rating, String image, String college) {

		PreparedStatement pst = null;
		DBConnector connectionManager = new DBConnector();

		try {
			pst = connectionManager.getConnection().prepareStatement(
					"update tutors set email=?, password=?, fname=?, lname=?, profile=?, hourly=?, rating=?, image=?, college=? where tutorID=?");
			pst.setString(1, email);
			pst.setString(2, password);
			pst.setString(3, fname);
			pst.setString(4, lname);
			pst.setString(5, profile);
			pst.setString(6, hourly);
			pst.setInt(7, rating);
			pst.setString(8, image);
			pst.setString(9, college);
			pst.setInt(10, studentID);
			pst.executeUpdate();
			pst.close();
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

	public HashMap<String, Comment> getTutorComments(int tutorID) throws SQLException {
		Comment comment;
		String studentInfo = "";
		PreparedStatement pst = null;
		HashMap<String, Comment> tutorComments = new HashMap<String, Comment>();
		DBConnector connectionManager = new DBConnector();

		try {
			pst = connectionManager.getConnection().prepareStatement(
					"SELECT c.commentID, c.subject, c.content, c.date_posted, c.tutors_tutorID, c.students_studentID, s.studentID, s.fname, s.lname FROM comments c LEFT JOIN students s ON c.students_studentID = s.studentID WHERE c.tutors_tutorID=?");
		} finally {
			pst.setInt(1, tutorID);
			ResultSet rs = pst.executeQuery();

			if (rs == null) {
				return tutorComments;
			}
			while (rs.next()) {
				comment = new Comment(rs.getInt("c.commentID"), rs.getString("c.subject"), rs.getString("c.content"),
						rs.getDate("c.date_posted"), rs.getInt("c.tutors_tutorID"), rs.getInt("c.students_studentID"));
				studentInfo = rs.getString("s.fname") + " " + rs.getString("s.lname");
				tutorComments.put(studentInfo, comment);
			}
			rs.close();
			pst.close();
		}
		return tutorComments;
	}

	public Tutor getTutorFromDatabaseById(int tutorId) {
		Tutor tutor = null;
		ResultSet rs = null;
		PreparedStatement pst = null;
		DBConnector connectionManager = new DBConnector();

		try {
			pst = connectionManager.getConnection().prepareStatement("select * from tutors where tutorID=?");
			pst.setInt(1, tutorId);
			rs = pst.executeQuery();

			if (rs == null) {
				return tutor;
			}

			rs.first();

			tutor = new Tutor(rs.getInt("tutorID"), rs.getString("email"), rs.getString("password"),
					rs.getString("fname"), rs.getString("lname"), rs.getString("profile"), rs.getString("hourly"),
					rs.getInt("rating"), rs.getDate("date_joined"), rs.getString("image"), rs.getString("college"));
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
		return tutor;
	}

	public HashMap<Session, String> getTutorSessions(int tutorID) throws SQLException {
		ResultSet rs = null;
		PreparedStatement pst = null;
		String studentInfo = "";
		HashMap<Session, String> studentSessions = new HashMap<Session, String>();
		Session session = null;
		DBConnector connectionManager = new DBConnector();

		try {
			pst = connectionManager.getConnection().prepareStatement(
					"SELECT * FROM sessions s LEFT JOIN students ON  s.students_studentID = studentID where s.tutors_tutorID = ?");

			pst.setInt(1, tutorID);
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
					studentInfo = rs.getString("fname") + " " + rs.getString("lname");
					studentSessions.put(session, studentInfo);
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

	public static List<Tutor> getAdminTutors() {
		ResultSet rs = null;
		PreparedStatement pst = null;
		List<Tutor> tutors = new ArrayList<Tutor>();
		Tutor tutor = null;
		DBConnector connectionManager = new DBConnector();

		try {
			pst = connectionManager.getConnection().prepareStatement("select * from tutors");
			rs = pst.executeQuery();
			if (rs == null)
				return null;
			if (rs.next()) {
				rs.beforeFirst();
				while (rs.next()) {
					tutor = new Tutor(rs.getInt("TutorID"), rs.getString("email"), rs.getString("password"),
							rs.getString("fname"), rs.getString("lname"), rs.getString("profile"),
							rs.getString("hourly"), rs.getInt("rating"), rs.getDate("date_joined"),
							rs.getString("image"), rs.getString("college"));
					tutors.add(tutor);
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
		return tutors;
	}

	public static int deleteTutorDB(int id) {
		PreparedStatement pst = null;
		DBConnector connectionManager = new DBConnector();
		try {
			pst = connectionManager.getConnection().prepareStatement("delete from tutors where TutorID=?");
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

	public void addTutorSession(String subject, String location, int tutorID) throws SQLException {
		PreparedStatement pst = null;
		DBConnector connectionManager = new DBConnector();

		try {
			pst = connectionManager.getConnection().prepareStatement(
					"insert into sessions(subject, booking_available, booking_date, booking_location, tutors_tutorID, categories_categoryID, students_studentID) "
							+ "values(?,?,curDate(),?,?,?,?)");
			pst.setString(1, subject);
			pst.setInt(2, 1);
			pst.setString(3, location);
			pst.setInt(4, tutorID);
			pst.setInt(5, 0);
			pst.setInt(6, 0);
			pst.executeUpdate();
			pst.close();
		} finally {
			try {
				pst.close();
			} catch (SQLException sqlE) {
				sqlE.printStackTrace(); 
			}
		}

	}

}
