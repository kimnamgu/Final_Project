package com.company.Calendar;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

/**
 * Servlet implementation class MyCalendar
 */
@WebServlet("/EventCalendar_ajax")
public class EventCalendar_ajax extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EventCalendar_ajax() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		Calendar today = Calendar.getInstance();
		int year  = today.get(Calendar.YEAR);
		int month = today.get(Calendar.MONTH);  // TODAY MONTH
		
		if(request.getParameter("year") != null) {
			year  = Integer.parseInt(request.getParameter("year"));
			month = Integer.parseInt(request.getParameter("month")); // PARAMETER MONTH
			if( month == 12  ) {  year += 1; month=0;}
			else if( month ==-1  ) {  year -= 1; month=11;}
		} 
		System.out.println(year + " / "+ month );
		//////////////////////////////// 1일 시작일
		Calendar dday = Calendar.getInstance(); 
		dday.set(year, month  , 1); 				    
		int startyoil = dday.get(Calendar.DAY_OF_WEEK); 

		//////////////////////////////// 30일 마지막일
		int lastday = dday.getActualMaximum(Calendar.DATE); 
		dday.set(year, month  , lastday); // 오늘날짜, 마지막일
		int lastyoil = dday.get(Calendar.DAY_OF_WEEK); 
		Gson  gson3 = new Gson();
		JsonObject jobject3 = new JsonObject();
		jobject3.addProperty("year"         , year);
		jobject3.addProperty("month"        , month);
		jobject3.addProperty("startyoil"    , startyoil);
		jobject3.addProperty("lastday"      , lastday);
		jobject3.addProperty("lastyoil"     , lastyoil);
		String json3 = gson3.toJson(jobject3);
		out.println(json3); 

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
