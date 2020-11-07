package com.company.java;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;


import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Mail
 */
@WebServlet("/Mail")
public class Mail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Mail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
														throws ServletException, IOException {
		//////////////////////////////////////////////////////////////////////
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		response.setCharacterEncoding("utf-8");
		
		//////////// 1. 보내는쪽설정(admin)
		String host = "smtp.naver.com";
		final String user = "skarn3@naver.com";  // admin 본인네이버 아이디
		final String password="rlarn9506";   // admin 본인네이버 비밀번호
		
		//////////// 2. 받는쪽 (고객님메일설정)
		String to = "skarn3@naver.com";   // 고객님 주소~
		
		//////////// 3. 설정파일지정
		// Get the session object
		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", 587);
		props.put("mail.smtp.auth", "true");
		
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
		   protected PasswordAuthentication getPasswordAuthentication() {
			   return new PasswordAuthentication(user, password);
		   }
		});
		
		
		 String a= request.getParameter("texta");
		 String b = request.getParameter("textarea");
		 PrintWriter out = response.getWriter();
		//////////////////////////////////////////////////////////////////////
		
		try {
		   MimeMessage message = new MimeMessage(session);
		   message.setFrom(new InternetAddress(user));
		   message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
		   // 3) 메일제목 Subject
		   
		   //message.setSubject("TITLE : 제목");
		   // 4) 메일내용 Text - 1. 일반 텍스트로 메일을 보낼 때
		   //message.setText("TEXT : 내용"); 
		   // send the message 
		   message.setSubject(a);
		   message.setText(b);
		   out.println("<script>alert('상담 문의 되었습니다.'); location.href='Mail.jsp';</script>");
		   Transport.send(message);
		  
		   
		  
		  
		  } catch (MessagingException e) {
		   e.printStackTrace();
		  }
		//////////////////////////////////////////////////////////////////////
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

/**************
 * java mail 보내기
 * #1.  JavaMail 1.4.7
   		jar파일다운로드
   		https://mvnrepository.com/artifact/javax.mail/mail/1.4.7
   		
   		
 * #2.  javax.mail api
   		http://www.javadoc.io/doc/javax.mail/javax.mail-api/1.4.7
**************/ 











