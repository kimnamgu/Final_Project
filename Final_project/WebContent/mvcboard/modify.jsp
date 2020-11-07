<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/inc/header.jsp"%>
<%
	request.setCharacterEncoding("utf-8");
	String uri = request.getRequestURI().split("/")[2];
	System.out.println(uri);

	String content = ((String) (request.getAttribute("content"))).replace("<br>", "\r\n");
	System.out.println(request.getAttribute("name"));
	System.out.println(request.getAttribute("email"));
	System.out.println(request.getAttribute("title"));
%>

<div class="container">
	<h3>QNA수정</h3>
	<form
		action="<%=request.getContextPath()%>/Update?no=<%=request.getAttribute("no")%>&uri=<%=uri%>"
		method="post" id="modifyAction" enctype="multipart/form-data">
		<div class="panel">
			<div class="panel-heading">
				<span class="glyphicon glyphicon-plus">번호</span>
			</div>
			<div class="panel-body"><%=request.getAttribute("no")%></div>
		</div>
		<div class="panel">
			<div class="panel-heading">
				<span class="glyphicon glyphicon-plus">조회수</span>
			</div>
			<div class="panel-dody"><%=request.getAttribute("hit")%></div>
		</div>
		<div class="form-group">
			<label for="name"><span class="glyphicon glyphicon-plus">이름</span></label>
			<input type="text" name="name" id="name" class="form-control"
				value="<%=request.getAttribute("name")%>">

		</div>
		<div class="form-group">
			<label for="email"><span class="glyphicon glyphicon-plus">이메일</span></label>
			<input type="text" name="email" id="email" class="form-control"
				value="<%=request.getAttribute("email")%>">
		</div>
		<div class="form-group">
			<label for="pass"><span class="glyphicon glyphicon-plus">비밀번호</span></label>
			<input type="password" name="pass" id="pass" class="form-control">
		</div>
		<div class="form-group">
			<label for="title"><span class="glyphicon glyphicon-plus">제목</span></label>
			<input type="text" name="title" id="title" class="form-control"
				value="<%=request.getAttribute("title")%>">
		</div>
		<div class="form-group">
			<label for="content"><span class="glyphicon glyphicon-plus">내용</span></label>
			<textarea name="content" id="content" cols="60" rows="10"
				class="form-control"><%=content%></textarea>
		</div>
		<div class="form-group">
			<label for="content"><span class="glyphicon glyphicon-plus"></span></label>
			<p>
				<img
					src="<%=request.getContextPath()%>/upload/<%=request.getAttribute("file")%>"
					alt="" />
			</p>
			
		</div>
		<input type="submit" class="btn btn-info" value="수정">
		<input type="reset" value="취소" class="btn btn-info"> <a
			href="<%=uri%>/Detail?no=<%=request.getAttribute("no")%>"
			class="btn btn-info">목록보기</a>
	</form>
</div>





<%@ include file="/inc/footer.jsp"%>
