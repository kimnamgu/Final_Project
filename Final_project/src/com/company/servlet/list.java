package com.company.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

/**
 * Servlet implementation class list
 */
@WebServlet("/list")
public class list extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public list() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String uri = request.getParameter("uri");
		int total = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			DietDBM dbmanager = new DietDBM();
			conn = dbmanager.getConnection();
			pstmt = conn.prepareStatement("select count(*) cnt from " + uri);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				total = rs.getInt("cnt");
			}
			rs.close();
			pstmt.close();
			
			pstmt = conn.prepareStatement("select * from " + uri + " order by no desc");
			rs = pstmt.executeQuery();
			
			JsonObject jo = new JsonObject();
			JsonArray ja = new JsonArray();
			
			jo.addProperty("total", total);
			ja.add(jo);
			while (rs.next()) {
				jo = new JsonObject();
				jo.addProperty("title", rs.getString("title"));
				jo.addProperty("no", rs.getInt("no"));
				jo.addProperty("hit", rs.getString("hit"));
				jo.addProperty("date", rs.getString("date"));
				jo.addProperty("file", rs.getString("file"));
				jo.addProperty("email", rs.getString("email"));
				
				ja.add(jo);
			}
			
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println(ja);	
		} catch (Exception e) {
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (Exception e) {
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (Exception e) {
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (Exception e) {
				}
			}
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
