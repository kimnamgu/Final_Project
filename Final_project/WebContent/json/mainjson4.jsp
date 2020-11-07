<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<% 
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;


		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/skarn3", "skarn3", "rlarn@9506");
			//conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mvcboard", "root", "1234");
		
			String sql = "select * from clothes order by no limit 8";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			boolean first = true;

			out.println("{\"clothes\":");
			out.println("[");
			while (rs.next()) {
				if (!first) {
					out.println(",");
				}
				int no = rs.getInt("no");
				String title = rs.getString("title");	
				String file = rs.getString("file");
				String date = rs.getString("date");
				out.println("{\"no\":"+"\""+ no +"\""+ ",\"file\":" +"\""+ file +"\""+",\"title\":"+"\""+title+"\""+"}");
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

	
	%>
