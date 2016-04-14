package com.sos.to;

import java.util.Properties;

import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

 

public class Mail {


	
	public static void main(String[] args) {
		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp-relay.gmail.com");
		props.put("mail.smtp.socketFactory.port", "465");
		props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.port", "465");

		javax.mail.Session session = javax.mail.Session.getDefaultInstance(props,
			new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication("safinaseem1994@gmail.com","yawer2005!");
				}
			});

		try {

			MimeMessage message = new MimeMessage(session);

			message.setFrom(new InternetAddress("safinaseem1994@gmail.com"));
			message.setRecipients(javax.mail.Message.RecipientType.TO, InternetAddress.parse("safinaseem1994@gmail.com"));
			
			message.setSubject("Testing Subject");
			message.setText("Dear Mail Crawler," + "\n\n No spam to my email, please!");

			Transport.send(message);

			System.out.println("Done");

		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}
	}

}
