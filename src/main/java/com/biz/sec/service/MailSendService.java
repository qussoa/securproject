package com.biz.sec.service;

import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.biz.sec.domain.UserDetailsVO;
import com.biz.sec.utils.PBEEncyptor;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class MailSendService {

	private final JavaMailSender javaMailSender;

	private final String from_email = "qussoa@naver.com";

	public MailSendService(@Qualifier("naverMailHandler") JavaMailSender javaMailSender) {
		super();
		this.javaMailSender = javaMailSender;
	}

	public void sendMail() {

		String to_email = "qussoa@naver.com";
		String subject = "test";
		String content = "고양이 고장";
		
		this.sendMail(to_email,subject,content);
	}
	
	public void sendMail(String to_email, String subject, String content) {

		
		MimeMessage message = javaMailSender.createMimeMessage();
		MimeMessageHelper mHelper;
		mHelper = new MimeMessageHelper(message, "UTF-8");
		try {
			mHelper.setFrom(from_email);
			mHelper.setTo(to_email);
			mHelper.setSubject(subject);
			mHelper.setText(content, true);
			// true : 메일 본문에 html 효과 주기
			javaMailSender.send(message);
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	/**
	 * 회원가입된 사용자에게 인증 mail 전송
	 * 
	 * username을 암호화 시키고 email 인증을 수행할 수 있는 링크를 email 본문에 작성하여 전송
	 * 
	 * @param userVO
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	//public boolean join_send(UserDetailsVO userVO) {
		
		public String join_send(UserDetailsVO userVO) throws UnsupportedEncodingException {

		String username = userVO.getUsername();
		String email = userVO.getEmail();

		String encUsername = PBEEncyptor.getEncrypt(username);
		String encEmail = PBEEncyptor.getEncrypt(email);
		
		/*
		 * jasypt를 사용하여 username과 email을 암호화 하였더니
		 * 슬래시(/) 등 URL을 통해서 보내면 문제를 발생시키는 
		 * 특수문자들이 포함이된다
		 * 이 특수문자를 URL을 통해서 정상적으로 보낼 수 있도록
		 * 암호화된 문자열을 URLEncoder.encode() method를 이용해서
		 * encoding을 수행해 주여야 한다
		 */
		
		StringBuilder email_link = new StringBuilder();
		email_link.append("http://localhost:8080/sec/");
		email_link.append("join/emailok");
		email_link.append("?username="+URLEncoder.encode(encUsername,"UTF-8"));
		email_link.append("&email="+URLEncoder.encode(encEmail,"UTF-8"));

		StringBuilder email_message = new StringBuilder();
		email_message.append("<h3>환영합니다<br/></h3>");
		email_message.append("<p>계정활성화 하려면 ");
		email_message.append("email 인증 <br/>");
		email_message.append("<p>email 인증 링크 클릭");
		email_message.append("<p><a href='%s'>email 인증</a>");

		String send_message = String.format(email_message.toString(), email_link.toString());

		String to_email = email;
		String subject = "회원 인증";
		
		this.sendMail(to_email, subject, send_message);
		
		return send_message;
	}

		/**
		 * @since 2020-04-21
		 *  이메일 인증을 위한 token정보를 email로 전송하기
		 * @param email_token
		 */
	public void email_auth(String email_token, UserDetailsVO userVO) {

		StringBuilder email_content = new StringBuilder();
		email_content.append("<style>");
		email_content.append(".biz-token { ");
		email_content.append("border : 1px solid black,");
		email_content.append("background-color : gray,");
		email_content.append("color : white,");
		email_content.append("font-weight : bold;");
		email_content.append("}");
		email_content.append("</style>");
		
		email_content.append("<h2>회원 가입을 환영합니다</h2>");
		email_content.append("<p>다음의 인증코드를 회원가입 인증코드 란에 입력</p>");
		
		email_content.append("<div class='biz-token'>");
		email_content.append(email_token);
		email_content.append("</div>");
		
		String subject = "회원인증 코드";
		this.sendMail(userVO.getEmail(), subject, email_content.toString());
	}

}






















