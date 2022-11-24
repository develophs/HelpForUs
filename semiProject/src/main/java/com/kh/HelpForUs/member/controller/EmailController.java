package com.kh.HelpForUs.member.controller;

import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kh.HelpForUs.common.exception.MemberException;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RestController
@RequiredArgsConstructor
public class EmailController {
	
	@Autowired
	private final JavaMailSender mailSender;
	
	public String makeRandomNumber() {
	   String randomNumber = "";
	   Random random = new Random();
	   random.setSeed(System.currentTimeMillis());
	   
	   for(int i = 0 ; i < 6 ; i ++) {
	      randomNumber += random.nextInt(10);
	   }
	      return randomNumber;
	   }
	
    private String sendMail = "javachild@naver.com";
    private String username = "javachild";
    private String password = "J1a2v3a_4c5h6i7!";

    @RequestMapping("email.me")
    public String mailSend(@RequestParam("email")String memberEmail){
    	String authNumber = null;
    	sendMail = memberEmail;
    	
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.naver.com");
        props.put("mail.smtp.port", 465);
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.ssl.enable", "true");
        props.put("mail.smtp.ssl.trust", "smtp.naver.com");
        Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });
        session.setDebug(true);

        try {
        	authNumber = makeRandomNumber();
            Message mimeMessage = new MimeMessage(session);
            mimeMessage.setFrom(new InternetAddress(sendMail));	
            mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(memberEmail));
            mimeMessage.setSubject("Help For Us 이메일 인증 번호 입니다.");
            mimeMessage.setContent("인증번호 : " + authNumber, "text/html;charset=UTF-8");
            Transport.send(mimeMessage);
            return authNumber;
        } catch (Exception e){
            e.printStackTrace();
        }
        throw new MemberException("이메일 인증 전송 실패");
    }
}
	
	 
	   

