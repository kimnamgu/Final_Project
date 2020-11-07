<%@page import="java.sql.SQLException"%>
<%@page import="com.mysql.jdbc.SQLError"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<%
		Connection conn =null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/skarn3", "skarn3", "rlarn@9506");
			
			//conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mvcboard", "root", "1234");			
			
			String sql = "select * from mvcboard order by no limit 4";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			boolean first = true;
			
			out.println("{\"mvcboard\":");
			out.println("[");
			while (rs.next()) {
				if (!first) {
					out.println(",");
				}
				
				String title = rs.getString("title");
				String date= rs.getString("date");
				int no = rs.getInt("no");
				
				out.println("{\"title\":"+"\""+ title +"\""+",\"date\":"+"\""+ date+"\""+",\"no\":"+"\""+ no+"\""+"}");
				first = false;

			}
			out.println("],");
			rs.close();
	
		rs = stmt.executeQuery("select * from dietboard order by no limit 3");
			first =true;
		out.println("\"dietboard\":");
		out.println("[");
		while(rs.next()){
			
			if(!first) {out.println(",");}
			
			
			String file = rs.getString("file");
			String date = rs.getString("date");
			int no = rs.getInt("no");
			
			out.println("{\"file\":"+"\""+ file +"\""+",\"date\":"+"\""+ date +"\""+",\"no\":"+"\""+ no+"\""+"}");
			first = false;
		}
		
		out.println("]}");
		}
 		catch(Exception e){
		
	} finally{
		if(rs !=null){try{rs.close();}catch(SQLException e){e.printStackTrace();}}
		if(stmt !=null){try{stmt.close();}catch(SQLException e){e.printStackTrace();}}
		if(conn !=null){try{conn.close();}catch(SQLException e){e.printStackTrace();}}
		
	}
	
		
	
	%>
