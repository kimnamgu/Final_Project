package com.company.db;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class JSP022_cookie_test005_login_info
 */
@WebServlet("/login_info")
public class login_info_sevlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public login_info_sevlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	
						
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		Connection conn =null;
		PreparedStatement pstmt =null;
		ResultSet rs =null;
		PrintWriter out = response.getWriter();
		
		String check = request.getParameter("check");
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		
		String sql = "select *from members where mbid=? and mbpass=?";
		DBmanager2 dbmanager = new DBmanager2();
		
		
		
		System.out.println(check); //on,null, checkbox
		if(check !=null) {check = "check";}
		
		try {
			conn=dbmanager.getConnection();
			pstmt = conn.prepareStatement(sql);
			HttpSession session = request.getSession();
			pstmt.setString(1, id);
			pstmt.setString(2, pass);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				Cookie cookie1 = new Cookie("id", id);
				Cookie cookie2 = new Cookie("check", check);
				
				cookie1.setMaxAge(1*60*60*24);
				cookie2.setMaxAge(1*60*60*24);
				
				response.addCookie(cookie1);
				response.addCookie(cookie2);
				// 1. 세션에다가 저장하기 !! 
				
				String id1 = rs.getString("mbid");
				String pass1 = rs.getString("mbpass");
				String email = rs.getString("mbemail");
				String mobile = rs.getString("mbmobile");
				String email_agree= rs.getString("mbemail_agree");
				String like= rs.getString("mblike");
				String address = rs.getString("mbaddress");
				String date = rs.getString("mbdate");
				session.setAttribute("id", id);
				Dto_members dto = new Dto_members(id1,pass1,email,mobile,address,email_agree,like,date);
						
				
				session.setAttribute("dto", dto);
				
				//RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
				//dispatcher.forward(request, response);
				
				out.print("<script>alert('회원님 반갑습니다.'); location.href='Final.jsp';</script>");
			} else {
				out.print("<script>alert('아이디와 비밀번호를 확인해주세요.'); location.href='login_info.jsp';</script>");
			}
		} catch (Exception e) {
		} finally {
			try { rs.close(); } catch (SQLException e) { }
			try { pstmt.close(); } catch (SQLException e) { }
			try { conn.close(); } catch (SQLException e) { }
		}
	}
}
	
	