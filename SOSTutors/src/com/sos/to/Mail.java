package com.sos.to;

import org.apache.commons.mail.DefaultAuthenticator;
import org.apache.commons.mail.Email;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.SimpleEmail;

public class Mail {

	public static void send(String emailTo, String emailFrom, String subject, String message, String username,String password) {

		Email email = new SimpleEmail();
		email.setHostName("smtp.gmail.com");
		email.setSmtpPort(465);
		email.setStartTLSEnabled(true);
		email.setAuthenticator(new DefaultAuthenticator(username, password));
		email.setSSLOnConnect(true);
		try {
			email.setFrom(emailFrom);
		} catch (EmailException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		email.setSubject(subject);
		try {
			email.setMsg(message);
		} catch (EmailException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			email.addTo(emailTo);
		} catch (EmailException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			email.send();
			System.out.println("email has sent");
		} catch (EmailException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public static void main(String [] args)
	{
		 send("safinaseem1994@gmail.com","safinaseem1994@gmail.com","testing","this is a testing email","safinaseem1994@gmail.com","****");
	}

}
