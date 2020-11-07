package com.company.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.company.java.DBmanager1;

/**
 * Servlet implementation class BNext
 */
@WebServlet("/BNext")
public class BNext extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BNext() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		int bno = Integer.parseInt(request.getParameter("bno"));
		String sql = "select bno from mvcboard where bno <? ORDER BY bno DESC LIMIT 1";
		
		int nextbno=-1;
		Connection conn=null;
		PreparedStatement pstmt = null;
		ResultSet rset =null;
		
		try { 
			DBmanager1 dbmanager =new DBmanager1();
			conn=dbmanager.getConnection();
			if (conn==null) {throw new Exception("데이터베이스 연결 못합니다.");}
			///////////
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				nextbno = rset.getInt("bno");
				response.sendRedirect("BDetail?bno="+nextbno);
			}
			else {response.sendRedirect("BDetail?bno="+bno+"&nonext=true");
		} 
	
	}
		catch(Exception e) {e.printStackTrace();}
		finally {
			try { if (rset!=null) {rset.close();}}catch (Exception e) {}
			try { if (pstmt!=null) {pstmt.close();}}catch (Exception e) {}
			try { if (conn!=null) {conn.close();}}catch (Exception e) {}
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
