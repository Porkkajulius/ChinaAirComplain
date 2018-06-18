package com.ChinaForm.application.util;

import java.io.File;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Service;
import org.springframework.mail.MailParseException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

@Service("mailService")
public class SendMail {
   @Autowired
   private JavaMailSender mailSender;
   private SimpleMailMessage simpleMailMessage;
   
	public void setSimpleMailMessage(SimpleMailMessage simpleMailMessage) {
		this.simpleMailMessage = simpleMailMessage;
	}

	public void setMailSender(JavaMailSender mailSender) {
		this.mailSender = mailSender;
	}

   /**
    * This method will send compose and send the message
    */
   public void sendMail(String to, String subject, String body) {
	   
	  MimeMessage message = mailSender.createMimeMessage();
	  
	  try{
			MimeMessageHelper helper = new MimeMessageHelper(message, true);
				
			helper.setFrom("teamlilatunnit@gmail.com");
			helper.setTo(to);
			helper.setSubject(subject);
			helper.setText(body);
			File file = new File("/Users/Admin/Desktop/testi.rtf");
			helper.addAttachment(file.getName(), file);

		     }catch (MessagingException e) {
			throw new MailParseException(e);
		     }
		     mailSender.send(message);
	         }


}