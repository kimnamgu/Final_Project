package com.company.kakao;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
/**
 * Servlet implementation class Klogin
 */
@WebServlet("/kakaologin_call_back")
public class kakaologin_call_back extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public kakaologin_call_back() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8;");
		PrintWriter out=response.getWriter();
		String clientId ="dd5341dfb866a1f6aa0ab50dfadcc04c";
	    String code = request.getParameter("code");
	   // String redirectURI = URLEncoder.encode("http://localhost:8080/Final_project/kakaologin_call_back","UTF-8");
	    String redirectURI = URLEncoder.encode("http://skarn3.cafe24.com/Final_project/kakaologin_call_back","UTF-8");
		  System.out.println("clientId:::::"+clientId);   System.out.println("code:::::"+code);
		  System.out.println("redirectURI:::::"+redirectURI);
		 
	    /////////////////[2] 토큰 가져오려고 URL 작성
	    
	    String requestURL = "https://kauth.kakao.com/oauth/token?" +
	    "grant_type=authorization_code"+
	    "&client_id="+clientId +
	    "&redirect_uri="+redirectURI +
	    "&code="+code;
	    
	    
	    //3. url
	    out.println(requestURL);
	    //4. HttpURLConnection 연결.
	    
	    //5. post방식으로 데이터 넘기기 - 설정.
	   try {
	     URL url = new URL(requestURL);
	     HttpURLConnection conn = (HttpURLConnection)url.openConnection();
	     conn.setRequestMethod("POST");
	     conn.setDoInput(true);
	     conn.setDoOutput(true);
	     conn.setRequestProperty("Content-Type", "application/json;charset=UTF-8");
	     
	     int responseCode = conn.getResponseCode(); // 200 정상 호출.
	     BufferedReader br = null;
	     if(responseCode ==200) {
	    	 br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	     }
	     else {
	    	 br = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
	     }
	     String inputLines=null;
	     StringBuffer res = new StringBuffer();
	     
	     while((inputLines= br.readLine())!= null) {
	    	 res.append(inputLines);
	     }
	     br.close();
	     ////////////////////////////////////////////[3] 토큰 가져와서 파싱하기 !!
	     String access_token = "";
	 
	    // System.out.println(responseCode);
	     if(responseCode == 200) {
	    	 System.out.println(res.toString());
	    	 /////////////////gson
	    	JsonParser jsonParser = new JsonParser();
	    	JsonObject jsonObject = (JsonObject) jsonParser.parse(res.toString());
	    	//System.out.println("access_token: "+ jsonObject.get("access_token"));
	    		access_token = jsonObject.get("access_token").getAsString();
				
	    		/*
				 * String token_type = jsonObject.get("token_type").getAsString(); String
				 * refresh_token = jsonObject.get("refresh_token").getAsString(); String scope =
				 * jsonObject.get("scope").getAsString();
				 */
			 
	    	  System.out.println("토큰받아오는거."+access_token);
	    	
			
			  HttpSession session = request.getSession();
			  
			  session.setAttribute("access_token", access_token);
			  response.sendRedirect("http://skarn3.cafe24.com/Final_project/kakao003");
			  //response.sendRedirect("http://localhost:8080/Final_project/kakao003");
	     }
	   }catch(Exception e) {e.printStackTrace();} 
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
