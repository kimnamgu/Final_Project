<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/header.jsp" %>
		<%
			request.setCharacterEncoding("utf-8");
			String uri = request.getRequestURI().split("/")[2];
			System.out.println(uri);			
			%>
			
	<div class="container">
		<h3>QNA 삭제</h3>
		<form action ="<%=request.getContextPath()%>/Delete?no=<%=request.getParameter("no")%>&uri=<%=uri%>" method="post" id="deleteForm">
			<div class="form-group">
			 <label for ="pass"> 비밀번호</label>
			 <input type="password" name="pass" id="pass" class="form-control">
			 <span>삭제시 필수!</span>
			</div>
			<div class="form-group">
				<input type="submit" value ="확인"/>
				<input type="reset" onclick="history.go(-1);" value="취소">
			</div>		
		</form>	
	</div>

<%@ include file="../inc/footer.jsp"%>