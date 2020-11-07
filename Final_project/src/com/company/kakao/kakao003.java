package com.company.kakao;

import java.io.IOException;
import java.net.*;
import java.io.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

/**
 * Servlet implementation class kakao003
 */
@WebServlet("/kakao003")
public class kakao003 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public kakao003() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		 String token = (String)session.getAttribute("access_token");
	   	 String header = "Bearer " + token; // Bearer 다음에 공백 추가
	    PrintWriter out = response.getWriter();
	   	
	   	 try {
	        String apiURL = "https://kapi.kakao.com/v1/user/me";
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
	        /////////////////jsonParser
	        JsonParser jsonParser = new JsonParser();
			JsonObject jsonObject = (JsonObject)jsonParser.parse(response1.toString());
			String id = jsonObject.get("id").getAsString();
			jsonObject= jsonObject.get("properties").getAsJsonObject();
			
			session.setAttribute("kakaoid", id);
			response.sendRedirect("http://skarn3.cafe24.com/Final_project/kakao_id");
			//response.sendRedirect("http://localhost:8080/Final_project/kakao_id");
	    } catch (Exception e) {
	       e.printStackTrace();
	    }
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
