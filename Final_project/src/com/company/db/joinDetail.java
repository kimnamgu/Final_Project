package com.company.db;

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
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class join_ok_servlet
 */
@WebServlet("/joinDetail")
public class joinDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public joinDetail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		Connection conn = null;
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		HttpSession session = request.getSession();
		
		
		String mbid= request.getParameter("mbid");
		
		if(session.getAttribute("id")!=null) {
			
		mbid=(String)session.getAttribute("id");
		
		}
		
		
		String mbemail = "", mbmobile  = "", mbemail_agree = "", mblike = "";
		String mbaddress = "" , mbdate = "";
		String sql = "select * from members where mbid=?";
		
		try {
			DBmanager2 dbmanager = new DBmanager2();
			conn =dbmanager.getConnection();
			if(conn==null) {throw new Exception("데이터 베이스 연결못합니다.");}
			System.out.println(1);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mbid);
			rs= pstmt.executeQuery();
			Dto_members dto = new Dto_members();

			
			if(rs.next()) {
				dto.setMbid(rs.getString("mbid"));
				dto.setMbemail(rs.getString("mbemail"));
				dto.setMbmobile(rs.getString("mbmobile"));
				if((rs.getString("mbemail_agree")).equals("y")) {mbemail_agree="yes";}
				else {mbemail_agree="no";}
				dto.setMbemail_agree(mbemail_agree);
				dto.setMblike(rs.getString("mblike"));
				dto.setMbaddress(rs.getString("mbaddress"));
				System.out.println(dto.getMbaddress());
				dto.setMbdate(rs.getString("mbdate"));
				
			}
			
			request.setAttribute("dto", dto);
			RequestDispatcher dispatcher = request.getRequestDispatcher("join_ok.jsp");
			dispatcher.forward(request, response);
		}
		catch(Exception e) {}
		finally {
			if(rs !=null) {try {rs.close();} catch(Exception e) {}}
			if(pstmt!=null) {try {pstmt.close();} catch(Exception e) {}}
			if(conn!=null) {try {conn.close();}catch(Exception e) {}}
			
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
