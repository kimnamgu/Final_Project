<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/inc/header.jsp" %>
	<div class="container">
		<h3>QNA 등록</h3>
		<%
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			String uri = request.getRequestURI().split("/")[2];
			System.out.println(uri);			
			%>
		
		<form action="<%=request.getContextPath()%>/write?uri=<%=uri%>" method="post" id="writeAction" enctype="multipart/form-data">
			<div class="form-group">
				<label for="name">제품명</label>
				<input type="text" name="name" id="name" class="form-control">
			</div>
			<div class="form-group">
				<label for="email">가격</label>
				<input type="text" name="email" id="email" class="form-control">
			</div>
			<div class="form-group">
				<label for="pass">비밀번호</label> 
				<input type="password" name="pass" id="pass" class="form-control">
				<span> 수정, 삭제시 필수</span>
			</div>
			<div class="form-group">
				<label for="title">제품<label>
				<input type="text" name="title" id="title" class="form-control">
			</div>
			<div class="form-group">
				<label for="content">내용</label>
				<textarea name="content" id="content" cols="60" rows="10" class="form-control"></textarea>
			</div>
			<div class="form-group">
				<label for="uploadFile">파일 업로드하기 :</label>
				<input type ="file" id="file" name = "file" class="form-control">
			</div>
			
			<div class="form-group text-right">
				<input type="submit" value="입력" class="btn btn-info">
				<input type="reset"  value="취소" class="btn btn-info">
				<a href="<%=uri%>/list.jsp" class="btn btn-info">목록보기</a>
			</div>		
		</form>
	</div>
<%@ include file="/inc/footer.jsp"%>