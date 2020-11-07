package com.company.servlet;

import java.io.IOException;
import java.net.InetAddress;
import java.sql.Connection;
import java.sql.PreparedStatement;

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
 * Servlet implementation class write1
 */
@WebServlet("/write")
public class write extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public write() {
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
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		
		String savePath = "/upload/";
		ServletContext context = getServletContext();
		String uploadFilePath = context.getRealPath(savePath);
		
		MultipartRequest multi = new MultipartRequest(
				request,
				uploadFilePath,
				5*1024*1024,
				"utf-8",
				new DefaultFileRenamePolicy()
				);
				
		//
		String uri = multi.getParameter("uri");
		System.out.println(uri);
		//
		Connection conn2 =null;
		DBmanager1 dbmanager= new DBmanager1();
		PreparedStatement pstmt = null;
		
		
		String name= multi.getParameter("name");
		String email= multi.getParameter("email");
		String pass = multi.getParameter("pass");
		String title = multi.getParameter("title");
		String content= multi.getParameter("content").replace("\r\n","<br>");
		String fileName = multi.getFilesystemName("file");
 		
		InetAddress local = InetAddress.getLocalHost();
		String ip = local.getHostAddress();
		
		int result=-1;
		String sql = "insert into "+uri+" (name,email,pass,title,content,ip,file) values (?,?,?,?,?,?,?)";
		System.out.println(sql);
		try {
			
			conn2=dbmanager.getConnection();
			pstmt=conn2.prepareStatement(sql);
			
			pstmt.setString(1, name);
			pstmt.setString(2, email);
			pstmt.setString(3, pass);
			pstmt.setString(4, title);
			pstmt.setString(5, content);
			pstmt.setString(6, ip);
			pstmt.setString(7, fileName);
			result=pstmt.executeUpdate();
			
			
			response.sendRedirect(uri+"/list.jsp?result="+result);
		}
		catch(Exception e) {e.printStackTrace();}
		finally {
			if(pstmt!=null) {try {pstmt.close();} catch(Exception e) {}}
			if(conn2!=null) {try {conn2.close();}catch(Exception e) {}}
			
		}
	}
}
