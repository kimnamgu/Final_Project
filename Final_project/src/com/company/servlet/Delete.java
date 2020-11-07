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

import com.company.java.DBmanager1;

/**
 * Servlet implementation class BDelete
 */
@WebServlet("/Delete")
public class Delete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Delete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		response.setCharacterEncoding("utf-8");
		//
		String uri = request.getParameter("uri");
		//
		Connection conn2 =null;
		DBmanager1 dbmanager= new DBmanager1();
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		int result1 =0;
		
	
		PrintWriter out = response.getWriter();
		
		String pass= request.getParameter("pass");
		String dbpass="";
		int no = Integer.parseInt(request.getParameter("no"));
		
		String sql1="select pass from "+uri+" where no=?";
		String sql2="delete from "+uri+" where no= ?";
		
		try {
			
			conn2= dbmanager.getConnection();
			
			pstmt= conn2.prepareStatement(sql1);
			pstmt.setInt(1, no);
			rs= pstmt.executeQuery();
			if(rs.next()) {
				dbpass=rs.getString("pass");
				
			}
			rs.close();
			pstmt.close();
			
			if(pass.equals(dbpass)) {
				pstmt = conn2.prepareStatement(sql2);
				pstmt.setInt(1, no);
				result1=pstmt.executeUpdate();	
				
				response.sendRedirect(uri+"/list.jsp?result1="+result1);
			}else {
				out.println("<script>");
				out.println("alert('비밀번호를 확인해주세요'); history.go(-1);");
				out.println("</script>");
			}			
		}
		catch(Exception e ) {e.printStackTrace();}
		finally {
			try {if(rs!=null) {rs.close();}} catch(Exception e) {}
			try {if(pstmt!=null) {pstmt.close();}} catch(Exception e) {}
			try {if(conn2!=null) {conn2.close();}} catch(Exception e) {}
		}
	}
}

