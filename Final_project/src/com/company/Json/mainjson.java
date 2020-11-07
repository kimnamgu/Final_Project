package com.company.Json;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class mainjson
 */
@WebServlet("/mainjson")
public class mainjson extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public mainjson() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		PrintWriter out = response.getWriter();

		try {
			Class.forName("com.mysql.jdbc.Driver");
			//conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mvcboard", "root", "1234");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/skarn3", "skarn3", "rlarn@9506");

			String sql = "select * from healthboard order by no limit 4";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			boolean first = true;

			out.println("{\"healthboard\":");
			out.println("[");
			while (rs.next()) {
				if (!first) {
					out.println(",");
				}
				int no = rs.getInt("no");
				String title = rs.getString("title");
				String date = rs.getString("date");
				String file = rs.getString("file");
				out.println("{\"file\":" + "\"" + file + "\"" + ",\"date\":" + "\"" + date + "\"" + "}");
				first = false;

			}
			out.println("]}");
		} catch (Exception e) {

		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (stmt != null) {
				try {
					stmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
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
