package com.company.kakao;

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
import javax.servlet.http.HttpSession;

import com.company.db.DBmanager2;

/**
 * Servlet implementation class kakao_id
 */
@WebServlet("/naver_id")
public class naver_id extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		HttpSession session = request.getSession();

		String sql = "select count(*) cnt from members where mbid = ?";
		String kid = (String) session.getAttribute("kakaoid");

		PrintWriter out = response.getWriter();
		int result = -1;

		try {
						
			DBmanager2 dbmanager = new DBmanager2();
			conn = dbmanager.getConnection();
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, kid);

			rset = pstmt.executeQuery();
			
			
			if (rset.next()) {
				result = rset.getInt("cnt");
			}
				
			if (result == 1) {
				
				session.setAttribute("id",kid);
				System.out.println("성공한 아이디"+kid);
				out.println("<script> alert('로그인되었습니다')</script>");
				out.println("<script>location.href='Final.jsp'; </script>");
			
			}

			else {
				session.setAttribute("id",kid);
				System.out.println("성공한 아이디"+kid);
				out.println("<script> alert('로그인되었습니다')</script>");
				out.println("<script>location.href='Final.jsp'; </script>");
			
				/*
				 * session.setAttribute("id",kid); System.out.println("실패한 아이디"+kid);
				 * System.out.println("실패"); response.sendRedirect("join_form.jsp?kid="+kid);
				 */
			}
		} catch (Exception e) {
		} finally {
			try {
				rset.close();
			} catch (SQLException e) {
			}
			try {
				pstmt.close();
			} catch (SQLException e) {
			}
			try {
				conn.close();
			} catch (SQLException e) {
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
