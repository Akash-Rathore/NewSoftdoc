package com.customeradmin.email;

import javax.mail.MessagingException;
import javax.mail.Multipart;

//[START simple_includes]
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
//[END simple_includes]
//import com.softdocadmin.email.Email;
import javax.mail.internet.MimeMultipart;
 
public class EmailClient
{
	
	
     public  void email(String subject,String content,String recipient) throws MessagingException, UnsupportedEncodingException
     {
    	 
  	    // [START simple_example]
    		Properties props = new Properties();
    	    Session session = Session.getDefaultInstance(props, null);
      	try{
    		  Message msg = new MimeMessage(session);
    	      msg.setFrom(new InternetAddress("softdoc.developer@gmail.com", "Softdoc Team"));
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
    	    // [END simple_example]
    	 
     }
}
