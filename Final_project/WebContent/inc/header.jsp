<%@page import="org.xml.sax.SAXException"%>
<%@page import="javax.xml.parsers.ParserConfigurationException"%>
<%@page import="org.w3c.dom.Node"%>
<%@page import="org.w3c.dom.NodeList"%>
<%@page import="org.w3c.dom.Element"%>
<%@page import="javax.xml.parsers.DocumentBuilderFactory"%>
<%@page import="org.w3c.dom.Document"%>
<%@page import="javax.xml.parsers.DocumentBuilder"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.company.java.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.company.java.Blist"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HEALTH EAT</title>
<meta name="google-signin-client_id"
	content="910770813967-96tp7k8r1uehu7m5j41o1h24sboio9qd.apps.googleusercontent.com">
<script src="https://apis.google.com/js/platform.js" async defer>
	
</script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Montserrat"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<link
	href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Lato"
	rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat"
	rel="stylesheet" type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link rel="shortcut icon"
	href="<%=request.getContextPath()%>/img/x-icon.png" type="image/x-icon">
<link rel="icon" href="<%=request.getContextPath()%>/img/x-icon.png"
	type="image/x-icon">
<%--   <link rel="shortcut icon" href="<%=request.getContextPath()%>/x-icon.png">
  <link rel="icon" href="<%=request.getContextPath()%>/x-icon.png"> --%>
<style>

script>.navbar-default .navbar-nav>.active>a, .navbar-default .navbar-nav>.active>a:focus,
	.navbar-default .navbar-nav>.active>a:hover {
	color: #d4f6ff;
	background-color: #3e60a2;
}

#asd1 {
	margin-left: 0px;
	margin-right: 0px;
}

.align-center {
	text-align: center;
}

body {
	color: #333;
	font: 16px Comic Sans MS, 맑은고딕;
}

p {
	font-size: 15px;
}

.margin {
	margin-bottom: 15px;
}

.bg-1 {
	background-color: #1abc9c; /* Green */
	color: #ffffff;
}

.bg-2 {
	background-color: #474e5d; /* Dark Blue */
	color: #ffffff;
}

.bg-3 {
	background-color: #ffffff; /* White */
	color: #555555;
}

.bg-4 {
	background-color: #2f2f2f; /* Black Gray */
	color: #ffffff;
}

.navbar {
	padding-top: 13px;
	padding-bottom: 13px;
	border: 0;
	border-radius: 0;
	margin-bottom: 0;
	font-size: 15px;
	letter-spacing: 0px;
}

.na1 .navbar-nav>li>a:hover {
    background-color: #fff;
    color: #337ab7;
    font-weight: bold;
}

#header {
	background-color: #03cf5d;
	height: 180px;
	font: 15px Comic Sans MS, 맑은고딕;
}

ol, ul {
	margin-top: 0;
	margin-bottom: -12px;
}

#visual {
	height: 600px;
	width: 100%;
}

.r1 {
	background-color: #CCCCCC;
}

img#r1 {
	width :62%;
}

#tab2 {
	padding-top: 3%;
	padding-right: 5%;
}

#tab3 {
	background-color: #FFFFFF;
	margin: 8%;
	border-top: 1px solid #1234;
}

#tab5 {
	background-color: #D5D5D5;
	margin: 2%;
}

#tab6 {
	background-color: #D5D5D5;
	margin: 8%;
}

.na1 {
	background-color: #fff473;
	/* padding-left: 12%; */
}


.na1 .navbar-nav>li>a {
    padding: 11px;
}

#footer {
	background-color: #A6A6A6;
	height: 400px;
}
/* .nc1 {height: 150px;} */
.nc2 {
	height: 150px;
}

.nc3 {
	width: 5%;
	height: 700px;
}

.nc4 {
	height: 150px;
}

.nc5 {
	height: 500px;
}

.nc7 {
	height: 500px;
	margin: 8%;
}

.nc10 {
	height: 150px;
}

.nc11 {
	height: 400px;
	overflow: auto;
}

.tab1 {
	text-align: center;
	font-size: 1.25em;
	    margin-bottom: 12px;
}

p#portfolio {
	font-size: 17px;
}

.tab1 ul {
	background: #fff;
	list-style: none;
	text-align: left;
}

.tab1 li {
	position: relative;
	display: inline-block;
	border-bottom: none;
	border-radius: .25em .25em 0 0;
}

textarea#search {
	border-radius: 15%;
}

/*수정 시작*/
/* nav.navbar.na1 .container {
	width: 1170px;
	margin: 0 auto;
}

.info {
	overflow: hidden;
}

.logo {
	text-align: center;
}

nav.navbar.na1 .navbar-header {
	float: none;
}
 */

/*수정 시작*/

.container.myheader {
	width: 1170px;
}

.col-sm-3.banner {
   /*  padding-top: 11%; */
}

.col-sm-2.banner {
   /*  padding-top: 10%; */
}

.col-sm-4.banner img {
    width: 110px;
    height: 44px;
    margin-right: 11px;
}

.col-sm-4.banner img.sportSeoul2 {
    width: 87px;
    height: auto;
}



.na1 {
    background-color: white;
    /* padding-left: 12%; */
    padding: 0;
    border-bottom: 1px solid #ddd;
    min-height: 30px;
}
nav.navbar.na1 .navbar-header {
    float: none;
}

/* .na1  .container  , .mygnb  .container {   width:1270px;   margin:0 auto;  }
 */

.myheader_visual {
    background-color: #dde62f;
}


img#r1 {
    width: 150px;
}

input#search {
    width: 290px;
}

.banner {
    padding-top: 44px;
}

.banner   .input-group {
    border: 3px solid #3e60a2;
    border-radius: 7px;
}

.banner    button.btn.btn-default {
    background-color: #3e60a2;
    color: white;
    border: none;
}

.banner input#search {
    border: none;
    width: 448px;
    
}
 
.tab1 a {
    color: #123456;
    display: block;
    padding: 7px 20px;
    text-decoration: none;
    font-weight: bold;
    font-size: 87%;
    border-bottom: 5px solid white;
}
.tab1 a:hover {
    border-bottom: 5px solid #3e60a2;
}

/*수정 완료.*/



/* .tab1 a:hover {
	border-radius: 0 0 .25em .25em;
	background: #5CD1E5;
	box-shadow: 0 10px 0 #5CD1E5;
	color: #000000;
	text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.3);
}
 */
/*											*/
/*											*/
/*Highlight Home button						*/
.home {
	box-shadow: 0 -5px 0 #f47321;
}

.home a {
	background: #f47321;
	box-shadow: 0 5px 0 #dc6519;
	color: white;
	border-radius: 0 0 .25em .25em;
	text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.3);
}

.nav-tabs>li>a {
	margin-right: 50px;
	line-height: 1.42857143;
	border: 2px solid transparent;
	border-radius: 4px 4px 0 0;
}

.nav-tabs1>li>a {
	margin-right: 50px;
	line-height: 1.42857143;
	border: 2px solid transparent;
	border-radius: 4px 4px 0 0;
}

/*											*/
/*											*/
/* quick									*/
.qLeft.fix {
	width: 160px;
	position: fixed;
	left: 15px;
	top: 28%;
}

.qRight {
	width: 100px;
	position: fixed;
	right: 0;
	height: 100%;
	top: 0;
	background-color: #1392d8;
	z-index: 1000;
}

p.rightBnr a {
	color: white;
	display: block;
	padding: 0% 0;
	font-size: 100%;
	font-weight: bold;
	border-bottom: 1px solid deepskyblue;
}

a.qBest {
	margin-top: 180%;
}

a.rightbar_close {
	position: relative;
	left: -60px;
	top: 50px;
	transform: rotate(90deg);
	background-color: #dde62f;
	color: #1392d8;
}

.qRight {
	margin-right: -100px;
}

img.ksci {
	width: 73%;
	padding-top: 132%;
}

img.sportSeoul {
	width: 73%;
}

img.sport {
	width: 100%;
}
</style>
</head>
<script>
	jQuery(document).ready(function() {
		jQuery("#writeAction").submit(function() {
			if (jQuery("#name").val() == "") {
				alert("이름을 입력해주세요");
				jQuery("#name").focus();
				return false;
			}
			if (jQuery("#email").val() == "") {
				alert("email을 입력해주세요");
				jQuery("#email").focus();
				return false;
			}
			if (jQuery("#pass").val() == "") {
				alert("비밀번호 입력해주세요");
				jQuery("#pass").focus();
				return false;
			}
			if (jQuery("#title").val() == "") {
				alert("제목을 입력해주세요");
				jQuery("#title").focus();
				return false;
			}
			if (jQuery("#content").val() == "") {
				alert("내용을 입력해주세요");
				jQuery("#content").focus();
				return false;
			}
		});
	});

	jQuery(document).ready(function() {
		jQuery("#modifyAction").submit(function() {
			if (jQuery("#name").val() == "") {
				alert("이름을 입력해주세요");
				jQuery("#name").focus();
				return false;
			}
			if (jQuery("#email").val() == "") {
				alert("이메일을 입력해주세요");
				jQuery("#email").focus();
				return false;
			}
			if (jQuery("#pass").val() == "") {
				alert("비밀번호을 입력해주세요");
				jQuery("#pass").focus();
				return false;
			}
			if (jQuery("#title").val() == "") {
				alert("제목을 입력해주세요");
				jQuery("#title").focus();
				return false;
			}
			if (jQuery("#content").val() == "") {
				alert("내용을 입력해주세요");
				jQuery("#content").focus();
				return false;
			}
		});
	});

	// 맨오른쪽 탭 여닫이.

	jQuery(function() {
		$(".rightbar_close").on("click", function() {

			//alert("hi");
			//alert($(".qRight").css("marginRight"));
			console.log($(".qRight").css("marginRight"));
			if ($(".qRight").css("marginRight") == "-100px") {
				$(".qRight").animate({
					"marginRight" : "0px"
				});
			} else {
				$(".qRight").animate({
					"marginRight" : "-100px"
				});
			}
			return false;
		});

	});
</script>


<!-- 공지사항 가져오는 ajax -->

<!-- //////맨위 NOTICE 설정. -->
<script>
	$(function() {
		$("#close").on("click", function(e) {
			e.preventDefault(); //return false
			var subpop = $("#subpop:checked").val();

			if ($("#subpop:checked").val() == "on") {
				$.ajax({
					url : "cookie_today?subpop=" + subpop,
					type : "get",
					dataType : "text",
					success : function() {
						$("#notice").hide();
					},
					error : function(error) {
					}
				});
			}
			$("#notice").fadeOut();
		});
	});
</script>

</head>

<body>

	<%
		String today = "";
		String cookieToday = request.getHeader("Cookie");
		if (cookieToday != null) {
			Cookie[] cookies = request.getCookies();
			for (int i = 0; i < cookies.length; i++) {
				if (cookies[i].getName().equals("subpop")) {
					today = cookies[i].getValue();
				}
			}
		}
	%>
	<%
		if (!today.equals("on")) {
	%>
	<div class="container panel panel-info" id="notice">
		<h3 class="panel-heading">NOTICE</h3>
		<p id="portfolio">본 사이트는 상업적 목적이 아닌 개인포트폴리오 용도로 제작되었으며 홈페이지의 일부내용과
			기타 이미지 등은 그 출처가 다로 있음을 밝힘니다.</p>
		<p>
			<input type="checkbox" id="subpop" name="subpop"
				title="오늘 하루동안 이창 열지않음" /> <label for="subpop">오늘 하루동안 이창
				열지 않음.</label> <a href="cookie_today" id="close" class="btn btn-warning">CLOSE</a>
		</p>

	</div>
	<%
		}
	%>
	
	
<nav class="navbar na1">
		<div class="navbar-header">
			<!-- <button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#myNavbar">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button> -->
			<div class="container">
				<div class="info">
					<ul class="nav navbar-nav navbar-right">
						<%
							String loginid = (String) session.getAttribute("id");

							if (loginid != null) {
						%>

						<li><a href="<%=request.getContextPath()%>/Final.jsp"><%=loginid%>님!
								환영합니다.</a></li>
						<li><a href="<%=request.getContextPath()%>/logout.jsp">로그아웃</a></li>
						<li><a href="<%=request.getContextPath()%>/joinDetail">마이페이지</a></li>
						<%
							} else {
						%>
						<li><a href="<%=request.getContextPath()%>/login_info.jsp">로그인</a></li>
						<li><a href="<%=request.getContextPath()%>/join_agree.jsp">회원가입</a></li>
						<%
							}
						%>
						<li><a href="#">장바구니</a></li>
						<li><a href="<%=request.getContextPath()%>/Mail.jsp">1대1상담하기</a></li>
					</ul>
				</div>
			</div>
		</div>
	</nav>



<!-- 로그인 맨윗단. -->
<div class="myheader_visual">
	<div class="container  myheader">
		<div class="row">
			<div class="col-sm-2">
				<div class="logo">
					<a href="/Final_project/Final.jsp"><img
						src="/Final_project/img/logoFinal.png" alt="health" 
						 id="r1"></a>
				</div>
			</div>
			<!-- logo -->
			<div class="col-sm-6 banner">
					<form class="navbar-form navbar-left" action="<%=request.getContextPath()%>/research" >
						<div class="input-group">
							<input type="text" class="form-control" placeholder="Search" name="search"  id="search">
							<div class="input-group-btn">
								<button class="btn btn-default" type="submit">
									<i class="glyphicon glyphicon-search"></i>
								</button>
							</div>
						</div>
					</form>
				</div>
			<div class="col-sm-4 banner">
				<a href="https://news.naver.com/main/read.nhn?mode=LSD&mid=sec&sid1=004&oid=050&aid=0000049694"><img src="<%=request.getContextPath()%>/img/header_lo.png"
					class="ksci1" title="2019 KSCI 한국소비자만족지수 1위 헬스케어(헬스보충제) 부문"></a>
				<a href="http://www.sportsseoul.com/news/read/460290"><img src="<%=request.getContextPath()%>/img/header_sport2.png"
					class="sportSeoul1" title="스포츠서울 2016 고객신뢰도 대상 헬스보충제"></a>
				<a href="#"><img src="<%=request.getContextPath()%>/img/header_sport3.png"
					class="sportSeoul2" title="스포츠서울 2016 고객신뢰도 대상 헬스보충제"></a>
			</div>
		</div>

	</div>

	<!-- Navbar -->
	<%-- 	<nav class="navbar na1">

		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#myNavbar">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<div class="container">
				<div class="info">
					<ul class="nav navbar-nav navbar-right">
						<%
							String loginid = (String) session.getAttribute("id");

							if (loginid != null) {
						%>

						<li><a href="<%=request.getContextPath()%>/Final.jsp"><%=loginid%>님!
								환영합니다.</a></li>
						<li><a href="<%=request.getContextPath()%>/logout.jsp">로그아웃</a></li>
						<li><a href="<%=request.getContextPath()%>/joinDetail">마이페이지</a></li>
						<%
							} else {
						%>
						<li><a href="<%=request.getContextPath()%>/login_info.jsp">로그인</a></li>
						<li><a href="<%=request.getContextPath()%>/join_agree.jsp">회원가입</a></li>
						<%
							}
						%>
						<li><a href="#">장바구니</a></li>
						<li><a href="<%=request.getContextPath()%>/Mail.jsp">1대1상담하기</a></li>
					</ul>
				</div>



				<div class="logo">
					<a href="/Final_project/Final.jsp"><img
						src="/Final_project/img/logoFinal.png" alt="health" width="250"
						height="50" id="r1"></a>
				</div>

			</div>



		</div>
	</nav> --%>

</div>

<div class="mygnb">
	<div class="container" id="tab">
		<nav class="tab1">

			<ul>
				<!-- <li class="home"><a href="#"><i class="fa fa-home"></i></a></li> -->
				<li><a href="<%=request.getContextPath()%>/Calendar_final.jsp">이벤트</a></li>
				<li><a href="<%=request.getContextPath()%>/clothes/list.jsp">의류
				</a></li>
				<li><a href="<%=request.getContextPath()%>/dieteat/list.jsp">단백질
						상품 </a></li>
				<li><a href="<%=request.getContextPath()%>/health/list.jsp">헬스용품구매</a></li>
				<li><a href="<%=request.getContextPath()%>/eatboard/list.jsp">보충제쇼핑몰</a></li>
				<li><a
					href="<%=request.getContextPath()%>/healthboard/list.jsp">다이어트식품몰</a></li>
				<li><a href="<%=request.getContextPath()%>/mvcboard/list.jsp">공지
						사항</a></li>
				<li><a href="http://skarn3.cafe24.com/spring0709">소중한 고객 후기</a></li>

			</ul>
		</nav>
	</div>
</div>	

	<!-- 이미지 추가하기. -->

	<div class="qLeft fix">
		<div class="left">
			<img src="<%=request.getContextPath()%>/img/header_sport3.png"
				class="ksci" title="2019 KSCI 한국소비자만족지수 1위 헬스케어(헬스보충제) 부문"> <img
				src="<%=request.getContextPath()%>/img/header_sport2.png"
				class="sportSeoul" title="스포츠서울 2016 고객신뢰도 대상 헬스보충제">
			<!--  <a href="/member/joingift.html" class="xans-element- xans-layout xans-layout-statelogoff joinGift bannerOff  cboxElement">
	            <img src="/web/image/layout/img_quick_coupon.png" title="신규회원 5% 할인쿠폰 + 적립금 5,000원 지급"> -->

		</div>
	</div>

	<div class="qRight">

		<p class="rightBnr">
			<a href="<%=request.getContextPath()%>/join_agree.jsp" class="qBest"
				title="머슬킹콩 시리즈 중 인기 BEST">● 회원 <br />가입
			</a> <a href="<%=request.getContextPath()%>/mvcboard/list.jsp"
				class="qGuide" title="목적에 가장 적합한 제품을 선택하세요!">● 공지<br />사항
			</a> <a href="<%=request.getContextPath()%>/Calendar_final.jsp"
				class="qEvent" title="조금 더 즐거운 쇼핑, 더욱 알뜰한 쇼핑!">● 출석 <br />이벤트
			</a> <a href="/myshop/mileage/historyList.html" class="qMileage"
				title="적립금">● 장바<br />구니
			</a>

			<!--  <a href="/myshop/coupon/coupon.html" class="qCoupon" title="할인쿠폰"></a>
	<a href="/myshop/wish_list.html" class="qWishlist" title="관심상품"></a>
	<a href="/order/basket.html" class="qBasket" title="장바구니"></a>       
 -->
			<a href="<%=request.getContextPath()%>/Mail.jsp" class="qRecent"
				title="최근 본 상품">● 1:1 <br />문의하기
			</a> <a href="#" class="qTop"><span>TOP</span></a> <a href="#"
				class="rightbar_close"><span>▲</span></a>

		</p>

	</div>