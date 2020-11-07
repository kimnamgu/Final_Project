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
 * Servlet implementation class mypagemodify
 */
@WebServlet("/mypagemodify")
public class mypagemodify extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public mypagemodify() {
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
		Dto_members dto = (Dto_members)session.getAttribute("dto");
		
		String mbid=dto.getMbid();
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
	
			if(rs.next()) {
				
				String id = rs.getString("mbid");
				String pass = rs.getString("mbpass");
				String email = rs.getString("mbemail");
				String mobile = rs.getString("mbmobile");
				String email_agree= rs.getString("mbemail_agree");
				String like= rs.getString("mblike");
				String address = rs.getString("mbaddress");
				String date = rs.getString("mbdate");
				
				Dto_members dto1 = new Dto_members(id,pass,email,mobile,address,email_agree,like,date);
						
				request.setAttribute("dto", dto1);
				RequestDispatcher dispatcher = request.getRequestDispatcher("mypage_modify_form.jsp");
				dispatcher.forward(request, response);
			}
			
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
