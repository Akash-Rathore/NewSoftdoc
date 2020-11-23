package com.subadminindexing.email;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class IndexingEmailClient {
	
	
     public  void email(String subject,String content,String recipient) throws MessagingException
     {
    	    Properties props = new Properties();
		    Session session = Session.getDefaultInstance(props, null);
		    try{
		        Message msg = new MimeMessage(session);
		        msg.setFrom(new InternetAddress("softdoc.developer@gmail.com"));
		 	        msg.addRecipient(Message.RecipientType.TO,new InternetAddress(recipient));
		 	        msg.setSubject(subject);
		 	        msg.setText(content);
		 	        Transport.send(msg);
		 	    } catch (AddressException e) {
		 	        e.printStackTrace();
		 	    } catch (MessagingException e) {
		 	    	e.printStackTrace();
		 	    }
		   }
     }
     



