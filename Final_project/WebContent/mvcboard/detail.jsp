<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/header.jsp"%>

<%
	request.setCharacterEncoding("utf-8");
	String uri = request.getRequestURI().split("/")[2];
	System.out.println(uri);

	if (request.getParameter("result2") != null) {
		int result2 = Integer.parseInt(request.getParameter("result2"));
		if (result2 < 0) {
			out.println("<script>alert('글수정실패')</script>");
		} else {
			out.println("<script>alert('글수정성공')</script>");
		}
	}
	
%>

<div class="container">
	<h3>QNA 상세보기</h3>
	<div class="panel">
		<!-- 원하는 아이콘 추가.! -->
		<div class="panel-heading">
			<span class="glyphicon glyphicon-plus">번호</span>
		</div>
		<div class="panel-body">
			<p>
				번호 :
				<%=request.getAttribute("no")%>
		</div>
	</div>
	<div class="panel">
		<div class="panel-heading">
			<span class="glyphicon glyphicon-plus">조회수</span>
		</div>
		<div class="panel-body">
			<p>
				조회수 :
				<%=request.getAttribute("hit")%>
		</div>
	</div>
	<div class="panel">
		<div class="panel-heading">
			<span class="glyphicon glyphicon-plus">이름</span>
		</div>
		<div class="panel-body">
			<p>
				이름 :
				<%=request.getAttribute("name")%>
		</div>
	</div>
	<div class="panel">
		<div class="panel-heading">
			<span class="glyphicon glyphicon-plus">이메일</span>
		</div>
		<div class="panel-body">
			<p>
				이메일 :
				<%=request.getAttribute("email")%>
		</div>
	</div>
	<div class="panel">
		<div class="panel-heading">
			<span class="glyphicon glyphicon-plus">제목</span>
		</div>
		<div class="panel-body">
			<p>
				제목:
				<%=request.getAttribute("title")%>
		</div>
	</div>
	<div class="panel">
		<div class="panel-heading">
			<span class="glyphicon glyphicon-plus">내용</span>
		</div>
		<div class="panel-body">
			<p><%=request.getAttribute("content")%>
		</div>
	</div>
	<div class="panel">
		<div class="panel-heading">
			<span class="glyphicon glyphicon-plus"></span>
		</div>
		<div class="panel-body">
			<p><img src="<%=request.getContextPath()%>/upload/<%=request.getAttribute("file")%>" alt=""/></p>
				
		</div>
	</div>
	
	<div class="panel text-right">
		<div class="panel-body">
			<a href="<%=request.getContextPath()%>/Modify?no=<%=request.getAttribute("no")%>&uri=<%=uri%>"
				class="btn btn-danger">수정</a> <a
				href="<%=uri%>/Delete.jsp?no=<%=request.getAttribute("no")%>"
				class="btn btn-danger">삭제</a> 
				<a href="<%=uri%>/list.jsp" class="btn btn-info">목록보기</a>
		</div>
		<div class="panel text-left">
			<%
				if (request.getParameter("noprev") != null) {
			%>
			최신글입니다.
			<%
				} else {
			%>
			<a href="BPrev?no=<%=request.getAttribute("no")%>"
				class="btn btn-danger">이전</a>
			<%
				}
			%>

			<%
				if (request.getParameter("nonext") != null) {
			%>
			최신글입니다.
			<%
				} else {
			%>
			<a href="BNext?no=<%=request.getAttribute("no")%>"
				class="btn btn-danger">다음</a>
			<%
				}
			%>
		</div>
	</div>




</div>




<%@ include file="../inc/footer.jsp"%>