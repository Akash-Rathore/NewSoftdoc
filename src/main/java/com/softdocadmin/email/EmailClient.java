package com.softdocadmin.email;

import java.io.UnsupportedEncodingException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
public class EmailClient {
	
	
     public  void email(String subject,String content,String recipient) throws MessagingException, UnsupportedEncodingException
     {
    		Properties props = new Properties();
    	    Session session = Session.getDefaultInstance(props, null);
      	try{
    		  Message msg = new MimeMessage(session);
    	      msg.setFrom(new InternetAddress("softdoc.developer@gmail.com"));
    	      msg.addRecipient(Message.RecipientType.TO,
    	                       new InternetAddress(recipient));
    	      msg.setSubject(subject);
    	      Multipart mp = new MimeMultipart();
    	      MimeBodyPart htmlPart = new MimeBodyPart();
    	      htmlPart.setContent(content, "text/html");
    	      mp.addBodyPart(htmlPart);
    	      msg.setContent(mp);
    	      Transport.send(msg);
    	      
  	    } catch (AddressException e) {
  	        e.printStackTrace();
  	    } catch (MessagingException e) {
  	    	e.printStackTrace();
  	    }
     }
     
}


