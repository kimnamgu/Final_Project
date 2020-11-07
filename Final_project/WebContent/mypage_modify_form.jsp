<%@page import="com.company.db.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="inc/header.jsp"%>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	$(function() {
		$("#postcode").click(function() {
			alert("우편번호 검색을 시작합니다.");
			new daum.Postcode({
				oncomplete : function(data) {
					$("#post1").val(data.postcode1);
					$("#post2").val(data.postcode2);
					$("#address1").val(data.address);
					$("#address2").focus();
				}
			}).open();
		});

		$("#emailList").change(function() {
			$("#doc").val($("#emailList").val());
		});

		$("#modifyForm").submit(function() {
			if ($("#pass").val() == "") {
				alert("비밀번호를 입력해주세요.");
				$("#pass").focus();
				return false;
			}
			if ($("#repass").val() == "") {
				alert("비밀번호 확인을 입력해주세요.");
				$("#repass").focus();
				return false;
			}
			if ($("#email").val() == "") {
				alert("이메일을 입력해주세요.");
				$("#email").focus();
				return false;
			}
			if ($("#doc").val() == "") {
				alert("이메일 주소를 입력해주세요.");
				$("#doc").focus();
				return false;
			}
			if ($("#phone1").val() == "") {
				alert("전화번호를 입력해주세요.");
				$("#phone1").focus();
				return false;
			}
			if ($("#phone2").val() == "") {
				alert("전화번호를 입력해주세요.");
				$("#phone2").focus();
				return false;
			}
			if ($("#phone3").val() == "") {
				alert("전화번호를 입력해주세요.");
				$("#phone3").focus();
				return false;
			}
			if ($("#post1").val() == "") {
				alert("우편번호를 입력해주세요.");
				$("#post1").focus();
				return false;
			}
			if ($("#post2").val() == "") {
				alert("우편번호를 입력해주세요.");
				$("#post2").focus();
				return false;
			}
			if ($("#address1").val() == "") {
				alert("상세주소를 입력해주세요.");
				$("#address1").focus();
				return false;
			}
			if ($("#address2").val() == "") {
				alert("상세주소를 입력해주세요.");
				$("#address2").focus();
				return false;
			}

			if ($("#pass").val() != $("#repass").val()) {
				alert("비밀번호가 다릅니다.");
				$("#repass").focus();
				return false;
			}
		});
	});
</script>

<div class="container">
	<h3>WELCOME! MODIFY MY PAGE</h3>
	<form action="mypageUpdate" method="post" id="modifyForm">
		<%
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			Dto_members dto = (Dto_members) request.getAttribute("dto");
			String emailArr[] = dto.getMbemail().split("@");
			String mobileArr[] = dto.getMbmobile().split("-");
			String addressArr[] = dto.getMbaddress().split(",");
			String agree = dto.getMbemail_agree();
			String like = dto.getMblike();
		
		%>
		<fieldset>
			<legend>필수 입력 정보</legend>
			<div class="form-group">
				<p>
					<strong class="required">(*)</strong>은 필수 입력사항입니다.
				</p>
			</div>
			<div class="form-group row">
				<div class="col-sm-2">
					<label for="id">(*)아이디</label>
				</div>
				<div class="col-sm-4">
					<input type="text" id="id" name="id" value="<%=dto.getMbid()%>"
						disabled />
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-2">
					<label for="pass">(*)비밀번호</label>
				</div>
				<div class="col-sm-10">
					<input type="password" id="pass" name="pass"
						placeholder="Enter password" />
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-2">
					<label for="repass">(*)비밀번호 확인</label>
				</div>
				<div class="col-sm-10">
					<input type="password" id="repass" name="repass" />
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-2">
					<label for="email">(*)이메일</label>
				</div>
				<div class="col-sm-10">
					<input type="text" id="email" name="email" value="<%=emailArr[0]%>" />@
					<input type="text" id="doc" name="email" title="이메일 두 번째 칸"
						value="<%=emailArr[1]%>" /> <select id="emailList"
						name="emailList" title="이메일 선택 리스트">
						<option value="default">-이메일 선택-</option>
						<option value="gmail.com">gmail.com</option>
						<option value="naver.com">naver.com</option>
						<option value="hanmail.net">hanmail.net</option>
					</select>
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-2">
					<label for="phone1">(*)핸드폰</label>
				</div>
				<div class="col-sm-10">
					<input type="text" id="phone1" name="phone"
						value="<%=mobileArr[0]%>" /> -<input type="text" id="phone2"
						name="phone" title="핸드폰 번호 두 번째 칸" value="<%=mobileArr[1]%>" /> -<input
						type="text" id="phone3" name="phone" title="핸드폰 번호 세 번째 칸"
						value="<%=mobileArr[2]%>" />
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-2">
					<label for="post1">(*)우편번호</label>
				</div>
				<div class="col-sm-10">
					<input type="text" id="post1" name="post"
						value="<%=addressArr[0].split("-")[0]%>"> <input
						type="text" id="post2" name="post" title="우편번호 두 번째 칸"
						value="<%=addressArr[0].split("-")[1]%>"> <input
						type="button" title="우편번호 검색" value="우편번호 검색"
						class="btn btn-default" id="postcode" />
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-2">
					<label for="address1">(*)상세주소</label>
				</div>
				<div class="col-sm-10">
					<input type="text" id="address1" name="address"
						value="<%=addressArr[1]%>" /> <input type="text" id="address2"
						name="address" title="상세주소 두 번째 칸" value="<%=addressArr[2]%>" />
				</div>
			</div>
		</fieldset>
		<fieldset>
			<legend>수신 정보 동의</legend>
			<div class="form-group row">
				<div class="col-sm-2">
					<strong>이메일 수신여부</strong>
				</div>
				<div class="col-sm-10">
					<span>SMS 수신에 동의하시겠습니까?</span> <input type="radio" id="yes"
						name="answer" value="yes" <%if (agree.indexOf("yes") > -1) {%>
						checked <%}%> /> <label for="yes">예</label> <input type="radio"
						id="no" name="answer" value="no"
						<%if (agree.indexOf("no") > -1) {%> checked <%}%> /> <label
						for="no">아니오</label>
				</div>
			</div>
		</fieldset>
		<fieldset>
			<legend>추가 정보</legend>
			<div class="form-group row">
				<div class="col-sm-2">
					<strong>관심분야</strong>
				</div>
				<div class="col-sm-10">
					<input type="checkbox" id="java" name="select" value="java"
						<%if (like.indexOf("java") > -1) {%> checked <%}%> /> 
					<label for="java">java</label>
					<input type="checkbox" id="jsp"
						name="select" value="jsp" <%if (like.indexOf("jsp") > -1) {%>
						checked <%}%> /> 
						
					<label for="jsp">jsp</label> 				
					<input type="checkbox" id="spring" name="select" value="spring"
						<%if (like.indexOf("spring") > -1) {%> checked <%}%> /> 
					<label for="spring">spring</label> 
					
					<input type="checkbox" id="e-gov" name="select" value="e-gov" <%if (like.indexOf("e-gov") > -1) {%>
						checked <%}%> /> 
					<label for="e-gov">e-gov</label>
				</div>
			</div>
			<div class="form-group text-center">
				<p>
					<a href="javascript:history.go(-1)" title="이전"
						class="btn btn-danger">이전</a> <input type="submit" title="확인"
						value="확인" class="btn btn-danger" />
				</p>
			</div>
		</fieldset>
		<fieldset>
			<legend>비밀번호 변경</legend>
			<div class="form-group row">
				<div class="col-sm-2">
					<label for="pass1">(*)비밀번호</label>
				</div>
				<div class="col-sm-10">
					<input type="password" id="pass1" name="pass1"
						placeholder="영문,숫자 조합  8~16자 사이" />
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-2">
					<label for="repass1">(*)비밀번호 확인</label>
				</div>
				<div class="col-sm-4">
					<input type="password" id="repass1" name="repass1" />
				</div>
				<div class="col-sm-6">
					<input type="button" title="비밀번호변경" id="changePass" value="비밀번호변경"
						class="btn btn-default" />
					<p class="result rps"></p>
				</div>
			</div>
		</fieldset>
	</form>
</div>
<script>
	$(function() {
		$("#changePass").click(
				function() {
					if ($("#pass").val() == "") {
						alert("비밀번호를 입력해주세요.");
						$("#pass").focus();
						return false;
					}
					if ($("#repass").val() == "") {
						alert("비밀번호 확인을 입력해주세요.");
						$("#repass").focus();
						return false;
					}
					if ($("#pass").val() != $("#repass").val()) {
						alert("비밀번호 입력이 다릅니다.");
						$("#repass").focus();
						return false;
					}
					if ($("#pass").val() != <%=dto.getMbpass()%> ) {
						alert("저장된 비밀번호와 다릅니다.");
						$("#pass").focus();
						return false;
					}
					
			///////////////////////////////////////////////
			///////////////////////////////////////////////
					
					if ($("#pass1").val() == "") {
						alert("변경할 비밀번호를 입력해주세요.");
						$("#pass1").focus();
						return false;
					}
					if ($("#repass1").val() == "") {
						alert("변경할 비밀번호 확인을 입력해주세요.");
						$("#repass1").focus();
						return false;
					}
					if ($("#pass1").val() != $("#repass1").val()) {
						alert("변경할 비밀번호가 다릅니다.");
						$("#repass1").focus();
						return false;
					}
					if ($("#pass1").val() ==<%=dto.getMbpass()%>) {
						alert("이미 설정하신 비밀번호 입니다.");
						$("#pass1").focus();
						return false;
					}
					
					$.ajax({
						url : "ChangePassword",
						type : "post",
						datatype : "text",
						data : {
							"mbpass" : $("#pass").val(),
							"pass" : $("#pass1").val()
						},
						success : function(data) {
							alert('비밀번호를 변경 하였습니다.');
						},
						error : function(xhr, textStatus, errorThrown) {
							$(".rps").html(
									textStatus + " HTTP-" + xhr.status
											+ errorThrown);
						}
					});
				});
	});
</script>

<%@ include file="inc/footer.jsp"%>