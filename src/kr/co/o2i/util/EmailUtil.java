package kr.co.o2i.util;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.o2i.common.Const;
import kr.co.o2i.util.StringUtil;

public class EmailUtil {

	/**
	 * @alias 메일 보내는 기능
	 * @param info.email : 보낼 주소
	 * @param info.title : 메일 제목
	 * @param info.mailContents : 메일 내용
	 * @param title : 메일 제목
	 * @param contents : 메일 내용
	 * @param from : 보내는분 메일 주소
	 * @param to : 받는분 메일 주소
	 * @throws MessagingException
	 * @throws UnsupportedEncodingException 
	 */
	public static void sendMail(Map<String, Object> info) throws AddressException, MessagingException, UnsupportedEncodingException {
		// Create session
		
		System.out.println("이메일: "+info.get("email"));
		System.out.println("제목: "+info.get("mailTitle"));
		System.out.println("내용: "+info.get("mailContent"));
		
		System.out.println("id : "+Const.mailId);
		System.out.println("pwd : "+Const.mailPw);
		
		Properties mailProps = new Properties();
		mailProps.put("mail.smtp.host", "smtp.gmail.com"); 
        mailProps.put("mail.smtp.port", "25"); 
        mailProps.put("mail.debug", "true"); 
        mailProps.put("mail.smtp.auth", "true"); 
        mailProps.put("mail.smtp.starttls.enable","true"); 
        mailProps.put("mail.smtp.EnableSSL.enable","true");
        mailProps.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");   
        mailProps.setProperty("mail.smtp.socketFactory.fallback", "false");   
        mailProps.setProperty("mail.smtp.port", "465");   
        mailProps.setProperty("mail.smtp.socketFactory.port", "465"); 
		
		// 인증
        Authenticator auth = new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(Const.mailId, Const.mailPw);
            }
        };
	
		Session mailSession = Session.getInstance(mailProps, auth);
		//한사람한테 발송
		InternetAddress toAddrs = new InternetAddress(StringUtil.StringNull(info.get("email")));
		//다중메일 발송
		/*InternetAddress[] toAddr = new InternetAddress[2]; 
		toAddr[0] = new InternetAddress ("보내는사람 주소");   
		toAddr[1] = new InternetAddress ("보내는사람 주소");  */
		InternetAddress fromAddr = new InternetAddress(Const.mailSendAddr, Const.mailSendUserName);
		// Create and initialize message
		Message message = new MimeMessage(mailSession);
		message.setFrom(fromAddr);
		message.setRecipient(Message.RecipientType.TO, toAddrs);
		message.setSubject(MimeUtility.encodeText(StringUtil.StringNull(info.get("mailTitle")), "UTF-8", "B"));
		message.setContent(info.get("mailContent").toString().replace("\r\n","<br>"), "text/html; charset=utf-8");
		message.setSentDate(new java.util.Date());
		
		// Send message
		try {
			// System.out.println("mail start==================================================================================================================");
			Transport.send(message);
			
			System.out.println(info.get("mailContent"));
		//	 System.out.println("mail startend================================================================================================================");
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
	
	public static void main(String[] args) {
		
		Map info = new HashMap<String, Object>();
		CommonMap param = new CommonMap();
		info.put("email", "jaet929@o2i.co.kr");
		info.put("mailTitle", "Test Title!!");
		info.put("mailContent", "Test Content!!");
		
		
		EmailUtil eu = new EmailUtil();
		try {
			eu.sendMail(info);
		} catch (AddressException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
