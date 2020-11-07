<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="inc/header.jsp"%>

<div class="container sub join_step2">
	<h3>WELCOME! HELATH EAT JOIN(2/3)</h3>
	<%
		String kid = (String) request.getParameter("kid");
	%>

	<form action="JoinProcess_servlet" method="post" id="formAction">

		<fieldset class="joinfield jf1">
			<legend>필수 입력 정보</legend>
			<div class="form-group">
				<p>
					<strong class="required">(*)</strong>은 필수입력사항입니다.
				</p>
				<p class="result mbid"></p>
			</div>
			<div class="form-group row">
				<div class="col-sm-2">
					<label for="mbid"><strong class="required">(*)</strong>아이디</label>
				</div>
				<div class="col-sm-8">
					<input type="text" name="mbid" id="mbid" value=""
						placeholder="아이디는 영문, 숫자 4~15자리"> <input type="button"
						class="btn btn-warning" id="idtest" value="중복확인" />
				</div>
				<div class="col-sm-2" id="iddouble">중복확인</div>
			</div>
			<!-- from-group END -->

			<div class="from-group row">
				<div class="col-sm-2">
					<label for="mbpass"><strong class="required">(*)</strong>비밀번호</label>
				</div>
				<div class="col-sm-10">
					<input type="password" name="mbpass" id="mbpass"
						placeholder="영문, 숫자 조합 10~20자리">
				</div>
			</div>
			<!-- from group END -->
			<div class="form-group row">
				<div class="col-sm-2">
					<label for="mbpassere"><strong class="required">(*)</strong>비밀번호
						확인</label>
				</div>
				<div class="col-sm-10">
					<input type="password" name="mbpassre" id="mbpassre" />
				</div>
			</div>
			<!-- from group END -->
			<div class="form-group row">
				<div class="col-sm-2">
					<label for="useremail1"><strong class="required">(*)</strong>이메일</label>
				</div>
				<div class="col-sm-10">
					<input type="text" name="mbemail" id="useremail1">@ <input
						type="text" name="mbemail2" id="useremail2" title="이메일 두번째칸입니다"
						class="x"> <select id="useremail3" title="이메일 세번째 칸입니다.">
						<option value="default">-이메일 선택-</option>
						<option value="naver">naver.com</option>
						<option value="google">google.com</option>
						<option value="daum">daum.net</option>
					</select>

				</div>
			</div>
			<!-- from group END -->
			<div class="form-group-row">
				<div class="col-sm-2">
					<label for="mbmobile1"><strong class="required">(*)</strong>핸드폰</label>
				</div>
				<div class="col-sm-10">
					<input type="text" id="mbmobile1" name="mbmobile"> - <input
						type="text" id="mbmobile2" name="mbmobile" title="핸드폰 두번째자리">
					- <input type="text" id="mbmobile3" name="mbmobile"
						title="핸드폰 세번째자리">
				</div>
			</div>
			<!-- from group END -->
			<div class="form-group row">
				<div class="col-sm-2">
					<label for="post1"><strong class="required">(*)</strong>우편번호</label>
				</div>
				<div class="col-sm-10">
					<input type="text" id="post1" name="mbaddress"> <input
						type="text" id="post2" name="mbaddress" title="우편번호 두번째자리">
					<input type="button" value="우편번호 검색" id="postcode"
						class="btn btn-warning" />
				</div>
			</div>
			<!-- from group END -->
			<div class="form-group row">
				<div class="col-sm-2">
					<label for="useraddress1"><strong class="required">(*)</strong>상세주소</label>
				</div>
				<div class="col-sm-10">
					<input type="text" id="useraddress1" name="mbaddress"> <input
						type="text" id="useraddress2" name="mbaddress" title="주소 두번째자리">
				</div>
			</div>
			<!-- from group END -->
		</fieldset>
		<!-- 필수 입력 정보 -->

		<fieldset class="joinfield jf2">
			<legend>수신 정보 동의</legend>
			<div class="form-group row">
				<div class="col-sm-2">
					<strong>이메일 수신여부</strong>
				</div>
				<div class="col-sm-10">
					<span class="mbemail_agree1">SMS 수신에 동의하시겠습니까?</span> <input
						type="radio" id="y" name="mbemail_agree" value="y" /> <label
						for="y"> 예</label> <input type="radio" id="n" name="mbemail_agree"
						value="n" /> <label for="n">아니오</label>
				</div>
			</div>
			<!-- from group END -->
		</fieldset>
		<!-- 수신 정보동의 -->

		<fieldset class="joinfield jf3">
			<legend>추가 정보</legend>
			<div class="form-group row">
				<div class="col-sm-2">
					<strong class="addinfo_title">관심분야</strong>
				</div>
				<div class="col-sm-10">
					<input type="checkbox" id="java" name="mblike" value="java">
					<label for="java">java</label> <input type="checkbox" id="jsp"
						name="mblike" value="jsp"> <label for="jsp">jsp</label> <input
						type="checkbox" id="spring" name="mblike" value="spring">
					<label for="spring">spring</label> <input type="checkbox" id="egov"
						name="mblike" value="egov"> <label for="egov">egov</label>
				</div>

			</div>
			<!-- from group END -->

			<div class="from-group text-center">
				<a href="join_agree.jsp" class="btn" title="이전으로 바로가기">이전</a> <input
					type="submit" value="확인" class="btn" title="회원가입하기 버튼 바로가기" />
			</div>
			<!-- from group END -->
		</fieldset>
		<!-- 추가정보 -->
	</form>
	<!-- form END -->
</div>

<script>
	$(function() {
		$("#idtest").click(function() {

			//1. 정규식 표현방법 / 문자열 / / 사이에 검사하고 싶은 문자열 넣기.
			var req = /^[a-zA-Z0-9]*$/;
			//2. 정규식 테스트 표현식 ... 정규식.test('검사할 문자열')
			if (req.test($("#mbid").val())) {
			} else {
				alert("아이디는 숫자와 문자만 가능합니다.");
				return false;
			}

		});

		////////////////// http가 들어가있는 지 확인
		////////////검사할 문자열 : http://www.naver.com
		$("#iddouble").click(function() {
			if (/http/.test(location.href)) {
				alert("ok");
			}
			;

		});
	});
</script>
<script>
	$(document).ready(
			function() {
				var ids = [ "#mbid", "#mbpass", "#mbpassre", "#useremail1",
						"#useremail2", "#mbmobile1", "#mbmobile2",
						"#mbmobile3", "#post1", "#post2", "#useraddress1",
						"#useraddress2", "input[name=mbemail_agree]:checked",
						"input[name=mblike]:checked" ];

				var idsValue = [ "아이디", "비밀번호", "비밀번호재확인", "이메일", "이메일", "핸드폰",
						"핸드폰", "핸드폰", "우편번호", "우편번호", "주소", "주소", "sns수신동의",
						"관심분야" ];

				$("#formAction").submit(
						function() {

							for (var i = 0; i < ids.length; i++) {
								if ($(ids[1]).val() != $(ids[2]).val()) {
									alert(idsValue[1] + "와" + idsValue[2]
											+ "가 맞지않습니다.");
									$(ids[2]).focus();
									return false;
								}
								if ($(ids[i]).val() == "") {
									alert(idsValue[i] + "빈칸입니다.");
									$(ids[i]).focus();
									return false;
								}
							}
							// 비밀번호 검사 ( 숫자랑 문자만 가능하게.)
							var req1 = /^[a-zA-Z0-9]*$/;
							if (req1.test($("#mbpass").val())) {
								
							} else {
								alert("비밀번호는 숫자와 문자만 가능합니다.");
								return false;
							}
							// 폰 번호.
							var req2 = /^010$/;
							if (req2.test($("#mbmobile1").val())) {
								
							} else {
								alert("핸드폰 번호를 다시 확인해 주세요.");
								return false;
							}
							var req3 = /^(?:\d{3}|\d{4})$/;
							if (req3.test($("#mbmobile2").val())) {
								
							} else {
								alert("핸드폰 번호를 다시 확인해 주세요.");
								return false;
							}
							var req4 = /^(?:\d{3}|\d{4})$/;
							if (req4.test($("#mbmobile3").val())) {
								
							} else {
								alert("핸드폰 번호를 다시 확인해 주세요.");
								return false;
							}
						});
			});
</script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	$(function() {
		$("#postcode").click(function() {
			//alert("우편번호 검색을 시작합니다.");
			new daum.Postcode({
				oncomplete : function(data) {
					$("#post1").val(data.postcode1);
					$("#post2").val(data.postcode2);
					$("#useraddress1").val(data.address);
					$("#useraddress2").focus();
				}
			}).open();
		});
	});
</script>
<script>
	$(function() {
		$('#idtest').click(
				function() {
					if ($("#mbid").val() == "") {
						$("#mbid").focus();
						return false;
					} else {
						$.ajax({
							url : "IDfind",
							type : "get",
							dataType : "text",
							data : {
								"mbid" : $("#mbid").val()
							},
							success : function(data) {
								$("#iddouble").html(data);
							},
							error : function(xhr, textStatus, errorThrown) {
								$("#iddouble").html(
										textStatus + "(HTTP-" + xhr.status
												+ "/" + errorThrown);
							}
						});
					}
				});
	});
</script>
<script>
	$(function() {

		$("#useremail3").change(function() { //이메일									
			$(".x").val($("#useremail3").val());

		});
	});
</script>


<%@include file="inc/footer.jsp"%>