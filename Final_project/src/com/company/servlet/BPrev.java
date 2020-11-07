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
 * Servlet implementation class BPrev
 */
@WebServlet("/BPrev")
public class BPrev extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BPrev() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		int bno = Integer.parseInt(request.getParameter("bno"));
		String sql="select bno from mvcboard where bno > ? LIMIT 1";
		int prevbno=-1;
		Connection conn =null; PreparedStatement pstmt=null; ResultSet rset= null;
		try { 
			DBmanager1 dbmanager =new DBmanager1();
			conn=dbmanager.getConnection();
			if (conn==null) {throw new Exception("데이터베이스 연결 못합니다.");}
			///////////
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				prevbno = rset.getInt("bno");
				response.sendRedirect("BDetail?bno="+prevbno);
			}
			else {response.sendRedirect("BDetail?bno="+bno+"&noprev=true");
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
