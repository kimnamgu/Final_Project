package com.company.java;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.ws.RequestWrapper;

import com.company.servlet.DietDBM;
import com.company.servlet.Dto_li;

/**
 * Servlet implementation class search
 */
@WebServlet("/research")
public class research extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public research() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		PrintWriter out = response.getWriter();
		int total = 0;
		ArrayList<Dto_li> list = new ArrayList<Dto_li>();
		
		
		String search= request.getParameter("search");
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			DietDBM dbmanager = new DietDBM();
			conn = dbmanager.getConnection();
			
			
			pstmt = conn.prepareStatement("select * from health where title like '%"+search+"%'");
			
			System.out.println(search);
			
			rs = pstmt.executeQuery();
			while (rs.next()) 
			{	
			
				int no = rs.getInt("no");
				String name = rs.getString("name");
				String email = rs.getString("email");
				String title = rs.getString("title");
				String date = rs.getString("date");
				String file = rs.getString("file");
				
				list.add(new Dto_li(no,name,email,title,date,file));
				
			}
			
			request.setAttribute("search", list);
			RequestDispatcher dispatcher = request.getRequestDispatcher("search.jsp");
			dispatcher.forward(request, response);
			
			
		} catch (Exception e) {
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (Exception e) {
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (Exception e) {
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (Exception e) {
				}
			}
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
