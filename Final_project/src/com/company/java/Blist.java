// 190503
// 작업내용 : 게시판 dto 분리
package com.company.java;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

//public : ArrayList showAllList
	// 1. DB연동해서 게시판 내용들 준다.
	// return : ArrayList
	// parameter : x
	// 전체리스트 얻기

public class Blist {
	
	ArrayList<Dto_list> list = new ArrayList<Dto_list>();
	int cnt =0;
	Connection conn;
	Statement stmt;
	ResultSet rs;
	String sql;

	public ArrayList<Dto_list> showAllList() {
	
	
		try {
			DBmanager1 dbmanager =new DBmanager1();
			conn=dbmanager.getConnection();
			if (conn==null) {throw new Exception("데이터베이스 연결 못합니다.");}
			
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select * from mvcboard order by bno desc");
			while (rs.next()) {
				int bno = rs.getInt("bno");
				String bname = rs.getString("bname");
				String btitle = rs.getString("btitle");
				String bdate = rs.getString("bdate");
				String bhit = rs.getString("bhit");
				String bfile = rs.getString("bfile");
				list.add(new Dto_list(bname, btitle, bno, bhit, bdate,bfile));
			} 
			System.out.println(" 저장 성공!");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (stmt != null)
					stmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
			}
		}
		return list;
	}

	public int showAllListCnt() {
			
		try {
			
			DBmanager1 dbmanager =new DBmanager1();
			conn=dbmanager.getConnection();
			if (conn==null) {throw new Exception("데이터베이스 연결 못합니다.");}
			
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select count(*) cnt from mvcboard");
			if (rs.next())
				cnt = rs.getInt("cnt");
		} catch (Exception e) {
			System.out.println("DB연동 실패");
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (stmt != null)
					stmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		return cnt;
	} 
}
