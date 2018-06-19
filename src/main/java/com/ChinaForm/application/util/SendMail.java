package com.ChinaForm.application.util;

import java.io.File;
import java.nio.charset.StandardCharsets;
import java.util.Base64;

import javax.activation.DataSource;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.mail.util.ByteArrayDataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Service;

import com.itextpdf.text.Image;

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
   public void sendMail(String to, String subject, String body, File file) {
	   
	  MimeMessage message = mailSender.createMimeMessage();
	  
	  try{
			//String data = base64Str;			
		  //	byte[] decodedImg = Base64.getDecoder().decode(data.getBytes(StandardCharsets.UTF_8));
		  //  DataSource source = new ByteArrayDataSource(Base64.getDecoder().decode(data),"application/pdf");	
			MimeMessageHelper helper = new MimeMessageHelper(message, true);
			helper.setFrom("teamlilatunnit@gmail.com");
			helper.setTo(to);
			helper.setSubject(subject);
			helper.setText(body);

		//	File file = new File("/Users/Admin/Desktop/testi.rtf");
			helper.addAttachment(file.getName(), file);

		     }catch (MessagingException e) {
			throw new MailParseException(e);
		     }
		     mailSender.send(message);
	         }


}