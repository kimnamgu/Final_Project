<%@page import="com.company.db.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="inc/header.jsp"%>
	<div class="container">
	<% Dto_members dto = (Dto_members)request.getAttribute("dto"); %>
		<h3>WELCOME! HEALTH EAT JOIN(3/3)</h3>
		<table class="table table-striped table-hover">
			<caption>회원가입을 축하합니다.</caption>
			<tbody>
				<tr><th scope="row">아이디</th><td><%=dto.getMbid()%></td></tr>
				<tr><th scope="row">Email</th><td><%=dto.getMbemail()%></td></tr>
				<tr><th scope="row">Mobile</th><td><%=dto.getMbmobile()%></td></tr>
				<tr><th scope="row">이메일수신여부</th><td><%=dto.getMbemail_agree() %></td></tr>
				<tr><th scope="row">관심여부</th><td><%=dto.getMblike()%></td></tr>
				<tr><th scope="row">주소</th><td><%=dto.getMbaddress()%></td></tr>
				<tr><th scope="row">가입날짜</th><td><%=dto.getMbdate()%></td></tr>
				<tr><th scope="row">개인정보를 수정하시려면 수정버튼을 누르세요</th></tr>
			</tbody>
		</table>
		
		<%-- <% out.println("<meta http-equiv='refresh' content='5;url=join_form.jsp'>"); %> --%>
		<p class="text-center"><a href="<%=request.getContextPath()%>/mypagemodify" class="btn">수정</a></p>
		<p class="text-center"><a href="Final.jsp" class="btn">MAIN</a></p>
	</div>
<%@ include file="inc/footer.jsp"%>