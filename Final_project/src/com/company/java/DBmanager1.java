
package com.company.java;
import java.sql.*;

public class DBmanager1 {

	public static Connection conn;

	public DBmanager1() {
		conn = null;
	}
	public static Connection getInstance() {
		return conn;
	}
	
	public Connection getConnection() throws Exception{
		try {
			Class.forName("com.mysql.jdbc.Driver");
			//conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mvcboard", "root", "1234");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/skarn3", "skarn3", "rlarn@9506");
			if (conn == null) {
				System.out.println("Db연결 실패");}
			
		} catch (Exception e) {}
		return conn;
	}
}

