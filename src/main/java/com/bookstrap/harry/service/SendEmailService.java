package com.bookstrap.harry.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class SendEmailService {

	@Autowired
	private JavaMailSender mailSender;
	
	public void sendSimpleEmail(String toEmail, 
			String body, String subject) {
	
				SimpleMailMessage message = new SimpleMailMessage();
				message.setFrom("bookstrap157@gmail.com");
				message.setTo(toEmail);
				message.setText(subject);
				message.setSubject(subject);
				
				mailSender.send(message);
				System.out.println("Mail sended");
	
	}
	
}   
