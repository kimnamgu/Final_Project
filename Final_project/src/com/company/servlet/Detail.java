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
 * Servlet implementation class detail
 */
@WebServlet("/Detail")
public class Detail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Detail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		Connection conn2 = null;
	
		
		PreparedStatement pstmt= null;	
		ResultSet rs = null;
		
		//
		String uri = request.getParameter("uri");
		//
		int no= Integer.parseInt(request.getParameter("no"));
		String hit = "";
		String name="";
		String email ="";
		String title="";
		String content="";
		String file ="";
		
		String sql="select hit , name , email , title , content , file from "+uri+" where no=?";

		String sql1="update "+uri+" set hit=hit+1 where no=?";
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		try {
			DBmanager1 dbmanager =new DBmanager1();
			conn2=dbmanager.getConnection();
			if (conn2==null) {throw new Exception("데이터베이스 연결 못합니다.");}
			
			pstmt=conn2.prepareStatement(sql1);
			pstmt.setInt(1, no);
			int result = pstmt.executeUpdate();
			if(result <1) {System.out.println("조회수 실패");}
			pstmt.close();
			
			pstmt = conn2.prepareStatement(sql);			
			pstmt.setInt(1, no);		
			rs=pstmt.executeQuery();

			
			while(rs.next()) {
				hit= rs.getString("hit");
				name=rs.getString("name");
				email=rs.getString("email");
				title=rs.getString("title");
				content=rs.getString("content");
				file = rs.getString("file");
			}		
			
		}
		catch(Exception e) {e.printStackTrace();}
		finally {
			if(rs !=null) {try {rs.close();} catch(Exception e) {}}
			if(pstmt!=null) {try {pstmt.close();} catch(Exception e) {}}
			if(conn2!=null) {try {conn2.close();}catch(Exception e) {}}
			
		}
		request.setAttribute("no", no);
		request.setAttribute("hit",hit );
		request.setAttribute("name", name);
		request.setAttribute("email", email);
		request.setAttribute("title", title);
		request.setAttribute("content", content);
		request.setAttribute("file", file);
		
		RequestDispatcher dispatcher = 
				request.getRequestDispatcher(uri+"/detail.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}

}
