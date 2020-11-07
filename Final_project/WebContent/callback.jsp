<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>
<%@page import="com.google.gson.JsonParser"%>
<%@page import="com.google.gson.JsonArray"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="com.google.gson.Gson"%>
<html>
  <head>
    <title>네이버로그인</title>
  </head>
  <body>
  <%
    String clientId = "ZOipB4AwlQn_T0jZ55IK";
    String clientSecret = "Kxk9pvNPNV";
    String code = request.getParameter("code");
    String state = request.getParameter("state");
    String redirectURI = URLEncoder.encode("http://skarn3.cafe24.com/Final_project/naver_result.jsp", "UTF-8");
    String apiURL;
    apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
    apiURL += "client_id=" + clientId;
    apiURL += "&client_secret=" + clientSecret;
    apiURL += "&redirect_uri=" + redirectURI;
    apiURL += "&code=" + code;
    apiURL += "&state=" + state;
    String access_token = "";
    String refresh_token = "";
    System.out.println("apiURL="+apiURL);
    try {
      URL url = new URL(apiURL);
      HttpURLConnection con = (HttpURLConnection)url.openConnection();
      con.setRequestMethod("GET");
      int responseCode = con.getResponseCode();
      BufferedReader br;
      System.out.print("responseCode="+responseCode);
      if(responseCode==200) { // 정상 호출
        br = new BufferedReader(new InputStreamReader(con.getInputStream()));
      } else {  // 에러 발생
        br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
      }
      String inputLine;
      StringBuffer res = new StringBuffer();
      while ((inputLine = br.readLine()) != null) {
        res.append(inputLine);
      }
      br.close();
      if(responseCode==200) {
        out.println(res.toString());
        //사용자 프로필 가져오려고
        //넘겨준형식이 json형식이므로 access_token 파싱
        /////////////////////////////////////////////GSON
        //1. jsonpaser
   		
        	JsonParser jsonParser = new JsonParser();
			JsonObject jsonObject = (JsonObject)jsonParser.parse(res.toString());	
			String token =jsonObject.get("access_token").getAsString();
		//////////////////////////////////////////////////
		session.setAttribute("token", token);
		//response.sendRedirect("http://localhost:8080/Final_project/naver_result.jsp");
		response.sendRedirect("http://skarn3.cafe24.com/Final_project/naver_result.jsp");
        
		//2. JsonObject
        // access_token 출력해주기
        //
      }
    } catch (Exception e) {
      System.out.println(e);
    }
  %>
  </body>
</html>