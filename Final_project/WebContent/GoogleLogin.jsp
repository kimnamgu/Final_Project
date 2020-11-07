<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name = "google-signin-client_id"content ="910770813967-96tp7k8r1uehu7m5j41o1h24sboio9qd.apps.googleusercontent.com">
<script src="https://apis.google.com/js/platform.js" async defer>
</script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
function onSignIn(googleUser) {
  var profile = googleUser.getBasicProfile();
  var ID = profile.getId(); 
  var Name = profile.getName();
  var Email = profile.getEmail();
  var image = profile.getImageUrl();
 
  //console.log('Name: ' + profile.getName()); 원래는 이런식 으로 되있음 ~
  console.log (ID +" / " +Name + " / "+image +" / "+ Email);
  $("#image img").attr("src",image);
  $("#name").html(name);
  $("#email").html(email);
  $(".g-signin2").hide();
  
}
function signOut() {
    var auth2 = gapi.auth2.getAuthInstance();
    auth2.signOut().then(function () {
      console.log('User signed out.');
      auth2.disconnect();
      location.reload();
    });
  }
	$(function(){ $("#google_out").click(function(){ signOut(); $(".g-signin2").fadeIn(); }); });
</script>		
</head>
<body>
	<div class="container">
		<h3> GOOGLE LOGIN</h3>
		<p><img src="" alt="" id="" /></p>
		<p id ="name"> </p>
		<p id = "status"> </p>
	<!--  [002] 로그인 버튼 -->	
	<div class="g-signin2" data-onsuccess="onSignIn"></div>
	<!--  [003] 로그아웃 버튼 -->
		<input type="button" id="google_out" value="로그아웃"/>
	</div>
</body>
</html>