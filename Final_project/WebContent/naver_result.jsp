<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>
<%@page import="com.google.gson.JsonParser"%>
<%@page import="com.google.gson.JsonArray"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="com.google.gson.Gson"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		

<%	
		        String token = (String)session.getAttribute("token"); // 네이버 로그인 접근 토큰;
		        System.out.println("\n\n\n"+token);
		        String header = "Bearer " + token; // Bearer 다음에 공백 추가
		        try {
		            String apiURL = "https://openapi.naver.com/v1/nid/me";
		            URL url = new URL(apiURL);
		            HttpURLConnection con = (HttpURLConnection)url.openConnection();
		            con.setRequestMethod("GET");
		            con.setRequestProperty("Authorization", header);
		            int responseCode = con.getResponseCode();
		            BufferedReader br;
		            if(responseCode==200) { // 정상 호출
		                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
		            } else {  // 에러 발생
		                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
		            }
		            String inputLine;
		            StringBuffer response1 = new StringBuffer();
		            while ((inputLine = br.readLine()) != null) {
		                response1.append(inputLine);
		            }
		            br.close();
		            System.out.println(""+response.toString());
		            /////////////////////////////////////////
		            JsonParser jsonParser = new JsonParser();
					JsonObject jsonObject = (JsonObject)jsonParser.parse(response1.toString());
					JsonObject jo = (JsonObject)jsonObject.get("response");
					System.out.println(jsonObject);
	
					String id =jo.get("id").getAsString();
					
					out.println("아이디"+id);
					session.setAttribute("kakaoid", id);
					
					response.sendRedirect("http://skarn3.cafe24.com/Final_project/naver_id");
					
					//response.sendRedirect("http://localhost:8080/Final_project/naver_id");
		        } catch (Exception e) {
		            System.out.println(e);
		        }
		%>
</body>
</html>