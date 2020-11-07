package com.company.db;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.InetAddress;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class JoinProcess_servlet
 */
@WebServlet("/JoinProcess_servlet")
public class JoinProcess_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JoinProcess_servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		Connection conn =null;
		PreparedStatement pstmt = null;
		
		
		String mbid = request.getParameter("mbid");
		String mbpass= request.getParameter("mbpass");
		String []mbemail_a = request.getParameterValues("mbemail");
		String []mbmobile_a= request.getParameterValues("mbmobile");
		String []mbaddress_a = request.getParameterValues("mbaddress");
		String mbemail_agree = request.getParameter("mbemail_agree");
		String [] mblike_a = request.getParameterValues("mblike");
		String mbemail="", mbmobile="", mbaddress="", mblike="";
		
		for(int i=0; i<mbemail_a.length;i++) {mbemail += mbemail_a[i] +"_";}
		for(int i=0; i<mbmobile_a.length;i++) {mbmobile += mbmobile_a[i]+"_";}
		for(int i=0; i<mbemail_a.length;i++)  {mbemail =mbemail_a[i]+"@"+mbemail_a[i];}
		
		//
		
		for(int i=0; i<mbaddress_a.length;i++) {mbaddress+=mbaddress_a[i]+"_";}
		
		for(int i=0; i<mblike_a.length;i++) {mblike += mblike_a[i]+"_";}
		
		String sql = "insert into members " + 
				"(mbid, mbpass, mbemail, mbmobile, mbaddress, mbemail_agree,mblike, mbip) values (?,?,?,?,?,?,?,?)";
		//ip 주소!
				InetAddress local = InetAddress.getLocalHost();
				String mbip=local.getHostAddress();				
				int result =-1;
		/*
		 * System.out.println(mbid); System.out.println(mbpass);
		 * System.out.println(mbemail); System.out.println( mbmobile);
		 * System.out.println(mbaddress); System.out.println(mbemail_agree);
		 * System.out.println( mblike); System.out.println( mbip);
		 */
				
		try {
		
			DBmanager2 dbmanager = new DBmanager2();
			conn = dbmanager.getConnection();
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, mbid);
			pstmt.setString(2, mbpass);
			pstmt.setString(3, mbemail);
			pstmt.setString(4, mbmobile);
			pstmt.setString(5, mbaddress);
			pstmt.setString(6, mbemail_agree);
			pstmt.setString(7, mblike);
			pstmt.setString(8, mbip);
			
	
			
			result = pstmt.executeUpdate();
			/*
			if(result>0) {out.println("<script>alert('회원가입에 성공하였습니다'.);</script>");}
			else {out.println("<script> alert('관리자에게 문의바랍니다.');</script>");}
			} 
			//out.println("<script>location.href='joinDetail?mbid="+mbid+"';</script>");
			*/
			if(result>0) {
				out.println("<script>alert('회원가입성공');  location.href='joinDetail?mbid="+mbid+"';  </script>");
			 
			}else {
				out.println("<script>alert('회원가입실패');  location.href='joinDetail?mbid="+mbid+"';  </script>");
			}
		
		}catch (Exception e) {e.printStackTrace();}
		finally {
			if(pstmt!=null) {try {pstmt.close();} catch(Exception e) {}}
			if(conn!=null) {try {conn.close();}catch(Exception e) {}}		
		}
			

	
	}
}

