package com.company.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.company.java.DBmanager1;

/**
 * Servlet implementation class BModify
 */
@WebServlet("/Modify")
public class Modify extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Modify() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");	
		response.setContentType("text/html; charset=utf-8");
		response.setCharacterEncoding("utf-8");
		Connection conn2 = null;
		DBmanager1 dbmanager = new DBmanager1();
		
		PreparedStatement pstmt= null;
		ResultSet rs = null;
		
		//
		String uri = request.getParameter("uri");
		
		//
		
		int no = Integer.parseInt(request.getParameter("no"));
		
		
		String name ="";
		String email ="";
		String pass="";
		String title="";
		String content="";
		int hit = 0;
		String sql1 = "select * from "+uri+" where no= ?";
		String file= "";	
		
		
		try {
			conn2= dbmanager.getConnection();
			pstmt=conn2.prepareStatement(sql1);
			pstmt.setInt(1, no);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				no = rs.getInt("no");
				hit= rs.getInt("hit");
				name = rs.getString("name");
				email =rs.getString("email");
				pass = rs.getString("pass");
				title=rs.getString("title");
				content= rs.getString("content").replace("\r\n","<br>");			
				file = rs.getString("file");
			}		

		} 
		catch(Exception e) {e.printStackTrace();}
		finally {
			if(rs!=null) {try {rs.close();} catch(Exception e) {}}
			if(pstmt!=null) {try {pstmt.close();} catch(Exception e) {}}
			if(conn2!=null) {try {conn2.close();}catch(Exception e) {}}
		}
		
		request.setAttribute("no", no);
		request.setAttribute("hit", hit);
		request.setAttribute("name", name);
		request.setAttribute("email", email);
		request.setAttribute("pass", pass);
		request.setAttribute("title", title);
		request.setAttribute("content", content);
		request.setAttribute("file", file);
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(uri+"/modify.jsp");
		dispatcher.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}

}
