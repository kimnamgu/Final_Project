package com.company.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.company.java.DBmanager1;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;



/**
 * Servlet implementation class BUpdate
 */
@WebServlet("/Update")
public class Update extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Update() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		response.setCharacterEncoding("utf-8");
		Connection conn =null;
		DBmanager1 dbmanager = new DBmanager1();
	
		PreparedStatement pstmt= null;
		ResultSet rs= null;
		
		int result2=0;
		String savePath = "/upload/";
		ServletContext context = getServletContext();
		String uploadFilePath = context.getRealPath(savePath);
		
		//
		//
		MultipartRequest multi = new MultipartRequest(
				request,
				uploadFilePath,
				5*1024*1024,
				"utf-8",
				new DefaultFileRenamePolicy()
				
				);
		
		String uri = multi.getParameter("uri");
		
		String email = multi.getParameter("email");
		String pass=multi.getParameter("pass");
		String dbpass="";
		String title=multi.getParameter("title");
		String content=multi.getParameter("content").replace("\r\n", "<br>");
		
		
		String file = multi.getFilesystemName("file");
		String backupfile = multi.getParameter("backupFile");
		String a ="";
		
		if (file==null) {
			a= backupfile;
		} else {
			a=file;
		}
	
		
		int no=Integer.parseInt(request.getParameter("no"));
		System.out.println(no);
		String sql1 ="select pass from "+uri+" where no= ?";
		String sql2="update "+uri+" set email=?, title=?,content=? where no=?";
		
	
		
		
		PrintWriter out = response.getWriter();
		
		try {
			conn=dbmanager.getConnection();
			pstmt=conn.prepareStatement(sql1);
			pstmt.setInt(1, no);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				dbpass=rs.getString("pass");
			}
			rs.close();
			pstmt.close();
			
			if(pass.equals(dbpass)) {
				
				pstmt = conn.prepareStatement(sql2);
				pstmt.setString(1, email);
				pstmt.setString(2, title);
				pstmt.setString(3, content);
				pstmt.setInt(4, no);
				result2= pstmt.executeUpdate();
				response.sendRedirect("Detail?no="+no+"&result2="+result2+"&uri="+uri);
			
			}
			else {
				out.println("<script>");
				out.println("alert('비밀번호를 확인해주세요'); history.go(-1);");
				out.println("</script>");
			}
		}
		catch(Exception e) {e.printStackTrace();}
		finally {
			try {if(rs!=null) {rs.close();}}catch(Exception e) {}
			try {if(pstmt!=null) {pstmt.close();}}catch(Exception e) {}
			try {if(conn!=null) {conn.close();}}catch(Exception e) {}
		}
		

	}

}
