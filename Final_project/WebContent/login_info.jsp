<%@page import="java.math.BigInteger"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.security.SecureRandom"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="inc/header.jsp"%>


<div class="container">
	<%
		String check = "";
		String id = "";
		//1. 쿠키존재 확인.
		String cookie = request.getHeader("Cookie");
		//2. 쿠키값 가져오기
		if (cookie != null) {
			Cookie[] cookies = request.getCookies();
			for (int i = 0; i < cookies.length; i++) {
				if (cookies[i].getName().equals("check")) {
					check = cookies[i].getValue();
				}
				if (cookies[i].getName().equals("id")) {
					id = cookies[i].getValue();
				}
			}
		}

		/* 	  	String clientId="dd5341dfb866a1f6aa0ab50dfadcc04c";
			  	String redirectURI = URLEncoder.encode("http://localhost:8080/Final_project/kakaologin_call_back", "UTF-8");
		SecureRandom random = new SecureRandom();
		String state = new BigInteger(130, random).toString();
		String apiURL = "https://kauth.kakao.com/oauth/authorize?response_type=code";
		apiURL += "&client_id=" + clientId;
		apiURL += "&redirect_uri=" + redirectURI; */
	%>
	<h3>It 하게 ! Eat 하게!</h3>
	<form action="login_info" method="post">
		<table class="table table-stripped">
			<tbody>
				<tr>
					<th scope="row"><label for="id">아이디</label></th>
					<td><input type="text" name="id" id="id"
						<%if (check.equals("check")) {%> value="<%=id%>" <%}%>></td>
				</tr>
				<tr>
					<th scope="row"><label for="pass">비밀번호</label></th>
					<td><input type="password" name="pass" id="pass"></td>
				</tr>

				<tr>
					<th scope="row"><input type="checkbox" name="check"
						id="check" <%if (check.equals("check")) {%> checked <%}%>>
					</th>
					<td><label for="remember">아이디 저장하기</label></td>
				</tr>
				<tr>

					<td colspan=2><input type="submit" value="로그인"
						class="btn btn-danger"></td>
				</tr>
			</tbody>
		</table>
	</form>

	<%
		/////////////네이버 로그인.
		String clientId = "ZOipB4AwlQn_T0jZ55IK";//애플리케이션 클라이언트 아이디값";
		//String redirectURI = URLEncoder.encode("http://localhost:8080/Final_project/callback.jsp", "UTF-8");
		String redirectURI = URLEncoder.encode("http://skarn3.cafe24.com/Final_project/callback.jsp", "UTF-8");
		SecureRandom random = new SecureRandom();
		String state = new BigInteger(130, random).toString();
		String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
		apiURL += "&client_id=" + clientId;
		apiURL += "&redirect_uri=" + redirectURI;
		apiURL += "&state=" + state;
		session.setAttribute("state", state);
	%>

	<!-- <!-- <a href="https://kauth.kakao.com/oauth/authorize?client_id=2bd0a1afa88c73abb5e85caafa9dde1f&redirect_uri=http://skarn3.cafe24.com/Final_project/kakaologin_call_back&response_type=code"> -->
	<!-- <a href="https://kauth.kakao.com/oauth/authorize?client_id=2bd0a1afa88c73abb5e85caafa9dde1f&redirect_uri=http://localhost:8080/Final_project/kakaologin_call_back&response_type=code"> </a> -->
	
	<!-- <a href="https://kauth.kakao.com/oauth/authorize?client_id=dd5341dfb866a1f6aa0ab50dfadcc04c&redirect_uri=http://localhost:8080/Final_project/kakaologin_call_back&response_type=code">  -->
	<a href="https://kauth.kakao.com/oauth/authorize?client_id=dd5341dfb866a1f6aa0ab50dfadcc04c&redirect_uri=http://skarn3.cafe24.com/Final_project/kakaologin_call_back&response_type=code"> 
		<img height="50" src="img/kakao.png" /> </a> 
	 <a href="<%=apiURL%>"><img height="50" src="img/naver_login.PNG" /></a>
	<!-- <div class="g-signin2" data-onsuccess="onSignIn"></div> -->


</div>
<script>
	/* //////////////////////////////구글
	function onSignIn(googleUser) {
		var profile = googleUser.getBasicProfile();
		var ID = profile.getId();
		var Name = profile.getName();
		var Email = profile.getEmail();
		var image = profile.getImageUrl();

		console.log(ID + " / " + Name + " / " + image + " / " + Email);
		$("#image img").attr("src", image);
		$("#name").html(name);
		$("#email").html(email);
		$(".g-signin2").hide();

		function signOut() {
			var auth2 = gapi.auth2.getAuthInstance();
			auth2.signOut().then(function() {
				console.log('User signed out.');
				auth2.disconnect();
				location.reload();
			});
		}
		$(function() {
			$("#google_out").click(function() {
				signOut();
				$(".g-signin2").fadeIn();
			});
		});*/

		$(function() {
			$("#loginForm").submit(
					function() {
						if ($("#id").val() == "") {
							alert("아이디를 입력해주세요.");
							$("#id").focus();
							return false;
						}

						if ($("#pass").val() == "") {
							alert("비밀번호를 입력해주세요.");
							$("#pass").focus();
							return false;
						}

						if ($("input[name='check']:checked").val() == on) {
							location.href = "login_info_sevlet?id="
									+ $("#id").val() + "&pass="
									+ $("#pass").val() + "&check="
									+ $("input[name='check']:checked").val();
						}
					});
	
	} );
</script>

<%@ include file="inc/footer.jsp"%>