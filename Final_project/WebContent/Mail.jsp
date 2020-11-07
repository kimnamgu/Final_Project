<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@include file="inc/header.jsp"%>

<body>
	<div class="container">
		<form action="Mail" method="get" id="formAction">
		<h3>HEALTH EAT!</h3>
		<fieldset>
			<legend>상담 문의</legend>
				
				<div class="container">
					<label>아이디</label>
					<input type = "text" id = "texta" name="texta" placeholder="고객님의 아이디를 입력해 주세요." class="form-control"/>			
				</div>
				<div class="container">
					<label>상담 내용</label>
					<textarea id="textarea" name ="textarea" cols="50" rows="13" placeholder="상담 내용을 구체적으로 작성해주세요."class="form-control"></textarea>
				</div>
				<div class="container">
					<input type ="submit" id="button" class="btn btn-danger" name ="button" value="보내기"/>
				</div>
		</fieldset>
		</form>
	</div>
</body>
</html>
<%@include file="inc/footer.jsp"%>