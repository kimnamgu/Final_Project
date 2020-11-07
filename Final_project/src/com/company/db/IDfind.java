package com.company.db;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class JSP024_ajax_findId
 */
@SuppressWarnings("serial")
@WebServlet("/IDfind")
public class IDfind extends HttpServlet {
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IDfind() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String mbid = request.getParameter("mbid");
		String sql = "select count(*) cnt from members where mbid = ?";
		
		
		PrintWriter out = response.getWriter();
		int result=-1;
		
		try {
			
			DBmanager2 dbmanager = new DBmanager2();
			conn = dbmanager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mbid);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {result = rset.getInt("cnt");}
			
			if(result==1) 
				 {out.println("<span style='color:red'>사용불가</span>");
				 }
			
			else {out.println("<span style='color:blue'>사용가능</span>");}
		} catch (Exception e) {
		} finally {
			try { rset.close(); } catch (SQLException e) { }
			try { pstmt.close(); } catch (SQLException e) { }
			try { conn.close(); } catch (SQLException e) { }
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
