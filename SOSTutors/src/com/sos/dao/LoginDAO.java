package com.sos.dao;

import com.sos.to.*;

public class LoginDAO {

	public static String error = null;

	public static Student validateStudent(String email, String password) throws Exception {
		Student s = null;

		if (email == "") {
			error = "error.invaliduser";
			return null;
		}
		if (password == "") {
			error = "error.invalidpass";
			return null;
		}

		email = email.trim();
		password = AES.encrypt(password.trim());

		s = StudentDAO.getStudentDB(email, password);

		if (s == null) {
			error = "error.invalidlogin";
			return null;
		}
		return s;
	}

	public static Tutor validateTutor(String email, String password) throws Exception {
		Tutor t = null;

		if (email == "") {
			error = "error.invaliduser";
			return null;
		}
		if (password == "") {
			error = "error.invalidpass";
			return null;
		}

		email = email.trim();
		password = AES.encrypt(password.trim());

		t = TutorDAO.getTutorDB(email, password);
		if (t == null || t.getEnabled() == 0) {
			error = "error.invalidlogin";
			return null;
		}
		return t;
	}
}