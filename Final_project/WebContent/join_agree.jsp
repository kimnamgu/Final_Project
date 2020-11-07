<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="inc/header.jsp"%>

<div class="container">
	<h3>WELCOME! HELATH EAT JOIN(1/3)</h3>
	<form action="join_form.jsp" method="get" id="agreeForm">

		<fieldset class="join">
			<legend>Company 서비스 약관 동의</legend>
				<div class="form-group row">
					<div class="col-sm-6"><label for="agree1">Company 서비스 약관동의</label></div>
					<div class="col-sm-6 text-right">
						<input type="checkbox" name ="agree1" id="agree1" title="Company 서비스 약관 동의 체크박스입니다.">		
					</div>	
				</div>
				<div class="form-group">
					<textarea name="agreement" cols="60" rows="10" id="agreement" class="form-control"title = "이용약관 동의입니다."disabled>
					<%@include file ="agreement1.txt" %>
					</textarea>
				</div>
		</fieldset>
		
		<fieldset class="join2">
			<legend> Company 개인정보 수집 및 이용 동의</legend>
				<div class="form-group row">
					<div class="col-sm-6"><label for="agree2">Company 개인정보 수집및 이용 동의</label></div>
					<div class="col-sm-6 text-right	">
						<input type="checkbox"name="agree2"id="agree2" title="Company 개인정보 수집및 이용동의 체크박스">				
					</div>				
				</div>
				<div class="form-group">
					<textarea name="agreement1" cols="60" rows="10" id="agreement1" class="form-control"title = "이용약관 동의입니다."disabled>
					<%@include file ="agreement2.txt" %>
					</textarea>
				</div>
		</fieldset>	
				<input type="submit" value="동의하기" title="동의" class="btn">		
		
	</form>
</div>
<script>
	$(function(){
		$("#agreeForm").submit(function(){
			if(!$("input[name=agree1]:checked").val()){
				alert("서비스 이용 약관에 동의하셔야합니다.");
				$("#agree1").focus();
				return false;
			}
			if(!$("input[name=agree2]:checked").val()){
				alert("개인정보 수집 및 이용에 동의하셔야합니다.");
				$("#agree2").focus();
				return false;
			}
		});
	});
</script>


<%@include file="inc/footer.jsp"%>

