<%@page import="com.company.servlet.DietDBM"%>
<%@page import="com.company.servlet.Dto_li"%>
<%@page import="com.company.java.*"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.company.java.Dto_list"%>
<%@page import="com.company.java.DBmanager1"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/header.jsp"%>

<style>
.mvcboard.m1 {
	margin: 0 auto 50px auto;
	margin-top: 30px;
}
div#wriper {
    margin: 5% auto;
}
.mvcboard.m4 {
    margin: 5px;
}
div#mvctab4 {
    margin: 10px;
}
</style>
<!-- container -->
<%
	if (request.getParameter("result") != null) {
		int result = Integer.parseInt(request.getParameter("result"));
		if (result < 0) {
			out.println("<script>alert('글쓰기실패')</script>");
		} else {
			out.println("<script>alert('글쓰기성공')</script>");
		}
	}
	if (request.getParameter("result1") != null) {
		int result1 = Integer.parseInt(request.getParameter("result1"));
		if (result1 < 0) {
			out.println("<script>alert('글삭제실패')</script>");
		} else {
			out.println("<script>alert('글삭제성공')</script>");
		}
	}
%>

<div id="wriper">
	<div id="mvctab1">
		<div class="mvcboard m1">
			<div class="container">
				<div class="row">
					<div class="col-sm-3">
						<a href="<%=request.getContextPath()%>/join_agree.jsp"><img
							src="<%=request.getContextPath()%>/img/join.PNG" width="250"
							height="100"></a>
					</div>
					<div class="col-sm-3">
						<a href=""><img
							src="<%=request.getContextPath()%>/img/Deliverytracking.PNG"
							width="250" height="100"></a>
					</div>
					<div class="col-sm-3">
						<a href=""><img
							src="<%=request.getContextPath()%>/img/delivery.PNG" width="250"
							height="100"></a>
					</div>
					<div class="col-sm-3">
						<a href=""><img
							src="<%=request.getContextPath()%>/img/event.PNG" width="250"
							height="100"></a>
					</div>
				</div>
			</div>

		</div>
	</div>
	<!--  첫줄 이미지들.. -->
	
	<div id="mvctab2">
		<div class="mvcboard m2">
			<div class="container">
				<div class="row">
					<div class="col-sm-6">
						<h3>★ 공지사항 꼭 한번 읽어주세요.</h3>
						<div>
							<table class="table table-striped">
								<caption>공지 사항.</caption>
								<thead>
									<tr>
										<th scope="col"></th>
										<th scope="col">글쓴이</th>
										<th scope="col">제목</th>
										<th scope="col">날짜</th>
										<th scope="col">hit</th>
									</tr>
								</thead>
								<tbody>
									<%
										request.setCharacterEncoding("utf-8");
										String uri = request.getRequestURI().split("/")[2];
										System.out.println(uri);

										Connection conn = null;
										Statement stmt = null;
										ResultSet rs = null;
										try {
											DietDBM dbmanager = new DietDBM();
											//Class.forName("com.mysql.jdbc.Driver");
											//conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/mvcboard", "root", "1234");
											conn = dbmanager.getConnection();

											stmt = conn.createStatement();
											rs = stmt.executeQuery("select count(*) cnt from " + uri);

											int total = 0;
											int cnt = 0;
											if (rs.next()) {
												total = rs.getInt("cnt");
											}
											rs.close();

											rs = stmt.executeQuery("select *from " + uri + " order by no desc");

											System.out.println(uri);

											while (rs.next()) {
												int no = rs.getInt("no");
									%>

									<tr>
										<td><p><img src="img/<%=rs.getString("file")%>" alt="" width="30" height="50"/></p></td>
										<td><%=rs.getString("name")%></td>
										<td><a
											href="<%=request.getContextPath()%>/Detail?no=<%=no%>&uri=<%=uri%>">
												<%=rs.getString("title")%></a></td>
										<td><%=rs.getString("date")%></td>
										<td><%=rs.getString("hit")%></td>
									</tr>

									<%
										}
										} catch (Exception e) {
										} finally {
											if (rs != null) {
												try {
													rs.close();
												} catch (Exception e) {
												}
											}
											if (stmt != null) {
												try {
													stmt.close();
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
									%>
								</tbody>
								<tfoot>
									<tr>
										<td colspan="5" class="text-right"><a href="write.jsp"
											class="btn btn-danger">글작성</a></td>
									</tr>
								</tfoot>
							</table>
						</div>
					</div>
					<div class="col-sm-6">
						<div class="row">
							<div class="col-sm-3">
								<a href=""><img
									src="<%=request.getContextPath()%>/img/fl.PNG" width="400"
									height="130"></a>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-3">
								<a href=""><img
									src="<%=request.getContextPath()%>/img/cash1.PNG" width="400"
									height="130"></a>
							</div>
						</div>

					</div>

				</div>
			</div>
		</div>
	</div>
	<!-- 공지사항 게시판. -->
	
	<div id="mvctab3">
		<div class="mvcboard m3">
			<div class="container">
				<div class="row">
					<div class="col-sm-12">
					<p><img	src="<%=request.getContextPath()%>/img/spon.PNG" width="1100"
									height="1100"></p>
					</div>				
				</div>
			</div>
		</div>
	</div>
	
	<div id="mvctab4">
		<div class="mvcboard m4">
			<div class="container">
				<div class="row">
					<div class="col-sm-12">
					<p><img	src="<%=request.getContextPath()%>/img/pat.PNG" width="1100"
									height="700"></p>
					</div>					
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="../inc/footer.jsp"%>