<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/header.jsp"%>


<!--  HEADER -->


<style>
/* .nav-tabs>li.active>a, .nav-tabs>li.active>a:focus, .nav-tabs>li.active>a:hover
	{
	color: #555;
	cursor: default;
	background-color: #A0BAED;
	border: 1px solid #000;
	border-bottom-color: transparent;
	
}
 */
 .nav-tabs>li {
    width: 20%;
    text-align: center;
 }
 .nav-tabs>li >a  { 
     color: #555;
    font-weight: bold;
    font-size: 81%;
    margin-right: 0;
    border-radius: 0;
    border: 1px solid #ddd;
    border-left: 0 none;
}

 .nav-tabs>li >a.selected , 
 .nav-tabs>li.active>a, .nav-tabs>li.active>a.selected:focus {
    background-color: #3e60a2;
    color: white;
    }
.carousel-inner>.item>a>img, .carousel-inner>.item>img, .img-responsive, .thumbnail a>img, .thumbnail>img {
    display: block;
    max-width: 100%;
    
    height: 632px;
}
input#hhh {
    height: 78px;
}

input#bmiresult {
    background: #ddd;
    border: 1px solid  #ddd;
}

input[type=button] {
    background-color: white;
    border: 1px solid #123456;
}

.carousel {
    position: relative;
    height: 525px;
    overflow: hidden;
    
}

div#bmi{
	height :600px;

}

#bmi input[type="text"] {
    width: 186px;
}

div#myNavbar {
    width: 37.33333%;
    margin-left : 42%;
}


p {
	text-align: center;
	font: 21px Comic Sans Ms, 맑은고딕;
}

/* .container {
	width: 100%;
}  */

element.style {
	height: 332px;
	margin-left: 250px;
}

div#menu1 {
	width: 50%;
}

.nav-tabs {
	border-bottom: 1px solid #ddd;
	margin-top: 20px;
	width: 100%;
	font: 19px Comic Sans MS;
	border-left: 1px solid #ddd;
	
}

.nc3 {
    border-bottom: 1px solid #ddd;
    width: 70%;
    margin-left: 16%;
    font: 20px Comic Sans MS, 맑은고딕;
}
.nc4 {
	height :100px;
	border-bottom: 1px solid #ddd;
	
	
	margin-left : 16%;
    width: 70%;
    font: 20px Comic Sans MS, 맑은고딕;
}
.ncontent.nc13 {
	background-color: #5CD1E5;
	margin-bottom: 30px;
	margin: 4%;
}
</style>

<div id="wriper">

	<div id="visual">
		<div class="">
			<div id="myCarousel" class="carousel slide" data-ride="carousel">
				<!-- Indicators -->
				<ol class="carousel-indicators">
					<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
					<li data-target="#myCarousel" data-slide-to="1"></li>
					<li data-target="#myCarousel" data-slide-to="2"></li>
					<li data-target="#myCarousel" data-slide-to="3"></li>
				</ol>
				<!-- Wrapper for slides -->
				<div class="carousel-inner" role="listbox">

					<div class="item active">
						<img src="img/sliding1.jpg" alt="1" width="100%" height="500px">
						<div class="carousel-caption"></div>
					</div>

					<div class="item">
						<img src="img/sliding2.jpg" alt="2" width="120%" height="100%">
						<div class="carousel-caption"></div>
					</div>

					<div class="item">
						<img src="img/sliding3.jpg" alt="3" width="120%" height="100%">
						<div class="carousel-caption"></div>
					</div>

					<div class="item">
						<img src="img/sliding4.jpg" alt="4" width="120%" height="100%">
						<div class="carousel-caption"></div>
					</div>
				</div>
				<!-- Left and right controls -->
				<a class="left carousel-control" href="#myCarousel" role="button"
					data-slide="prev"> <span
					class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
					<span class="sr-only">Previous</span>
				</a> <a class="right carousel-control" href="#myCarousel" role="button"
					data-slide="next"> <span
					class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
					<span class="sr-only">Next</span>
				</a>
			</div>
		</div>
	</div>
	<div id="tab2">
		<div class="ncontent nc3">
			<div class="container">
				<div class="col-sm-12">
					<div class="container">
						<div class="row">
							<ul class="nav nav-tabs">
								<li><a data-toggle="tab" href="#menu2">단백질/프로틴</a></li>
								<li><a data-toggle="tab" href="#menu3">탄수화물/게이너</a></li>
								<li><a data-toggle="tab" href="#menu4">HEALTH 기타 식품</a></li>
								<li><a data-toggle="tab" href="#menu5">HEALTH 의류</a></li>
								<li><a data-toggle="tab" href="#menu6">HEALTH 용품</a></li>
							</ul>
							<div class="tab-content">
								<div id="menu2" class="tab-pane active"></div>
								<div id="menu3" class="tab-pane "></div>
								<div id="menu4" class="tab-pane "></div>
								<div id="menu5" class="tab-pane "></div>
								<div id="menu6" class="tab-pane "></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="bmi">
			<div class="container bmi1">
				<div class="col-sm-12">
					<div class="row">
						<h3>BMI 측정기</h3>
						
							<div class="form-group">
								<label for="a">남성</label> <input type="radio" id="a" name="ac"
									value="남성" checked="checked"/> <label for="b">여성</label> <input type="radio"
									id="a" name="ac" value="여성" />
							</div>
							<label for="key">신장</label> 
							<input type="text" id="key" name="key" placeholder="cm" /> 
							<label for="weight">체중</label> 
							<input type="text" id="weight" name="weight" placeholder="kg" /> 
							<label for="age">나이</label> 
							<input type="text" id="age" name="age" placeholder="세(만)" />
							<label for="bmi">나의 체질량지수(BMI) :</label> 
							<input type="text" id="bmiresult" name="bmi" value="" readonly >
						
							
							
							<input type="button" value="결과보기" id="hap" class="btn" /> 
							<img src="img/bmi.PNG" alt="2" width="60%" height="100%">
				<!-- 		<input type="button" value="다이어트식단 보러가기" id="hhh" class="btn" /> --> 
					</div>

				</div>
			</div>
		
	</div>
	

	<div id="tab3">
		<div class="container nc5">
			<h2 id="diet">HEALTH EAT이 추천하는 4가지 다이어트 제품</h2>
			<div class="container">

				<div class="row">
					<div class="col-sm-3">

						<a href="<%=request.getContextPath()%>/health/list.jsp"> <img
							src="img/AAA.jpg" alt="4" width="350" height="250"></a>
						<p>머슬 킹콩 931</p>
						<p>55000 원</p>

					</div>
					<div class="col-sm-3">
						<a href="<%=request.getContextPath()%>/health/list.jsp"> <img
							src="img/AAA1.jpg" alt="4" width="350" height="250"></a>
						<p>머슬 킹콩 531</p>
						<p>35000 원</p>
					</div>
					<div class="col-sm-3">
						<a href="<%=request.getContextPath()%>/healthboard/list.jsp"> <img
							src="img/AAA2.jpg" alt="4" width="350" height="250"></a>
						<p>머슬 킹콩 241</p>
						<p>42000 원</p>
					</div>
					<div class="col-sm-3">
						<a href="<%=request.getContextPath()%>/eatboard/list.jsp"> <img
							src="img/AAA3.jpg" alt="4" width="350" height="250"></a>
						<p>머슬 킹콩 444</p>
						<p>45000 원</p>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div id="tab4">
		<div class="container">
				<div class="row">
					<div class="col-sm-6">
						<div class="">

							<iframe width="550px" height="550px"
								src="https://www.youtube.com/embed/GNMkQR1unFs" frameborder="0"
								allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
								allowfullscreen ></iframe>

						</div>
					</div>
					<div class="col-sm-6">
						<div class="">

							<iframe   width="550px" height="550px"
								src="https://www.youtube.com/embed/x_A5FFrd6iw" frameborder="0"
								allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
								allowfullscreen></iframe>

						</div>
					</div>
			</div>
		</div>
	</div>
	<div id="tab6">
		<div class="ncontent nc11">
			<div class="container-fluid">
				<div class="row">
					<div class="col-sm-6">
						<div class="container">
							<div class="row">
								<ul class="nav nav-tabs">
									<li class="active"><a data-toggle="tab" href="#menu0">공지사항</a></li>
									<li><a data-toggle="tab" href="#menu1">리뷰</a></li>
								</ul>
								<div class="tab-content">
									<div id="menu0" class="tab-pane active"></div>
									<div id="menu1" class="tab-pane ">
										<br>

									</div>
								</div>

							</div>
						</div>
					</div>
					<div class="col-sm-6">
						<div>
							<h3>HEALTH NEWS</h3>
							<table class="table t1">

								<thead>
									<tr>
										<th scope="col">Title</th>
										<th scope="col">Date</th>
									</tr>
								</thead>
								<tbody>
									<%
										try {

											String url = "http://www.healthdaynews.co.kr/rss/S1N3.xml";
											DocumentBuilder docBuilder = null;
											Document doc = null;
											DocumentBuilderFactory documentBuilderFactory = DocumentBuilderFactory.newInstance();
											docBuilder = documentBuilderFactory.newDocumentBuilder();
											doc = docBuilder.parse(url); //실시간 처리하게해줌!!! 출력 해주는거

											System.out.println(doc);
											//root tag
											doc.getDocumentElement().normalize();
											Element root = doc.getDocumentElement();
											NodeList dataList = doc.getElementsByTagName("item");
											System.out.println(dataList); //###

											//////////////////
											for (int i = 0; i < 5; i++) {
												Node data = dataList.item(i);
												if (data.getNodeType() == Element.ELEMENT_NODE) {
													NodeList subdataList = data.getChildNodes();
													String title = "", link = "", pubDate = "";
													for (int j = 0; j < subdataList.getLength(); j++) {
														Node myData = subdataList.item(j);
														String nodeName = myData.getNodeName();
														String value = myData.getTextContent();
														if (nodeName.equals("title")) {
															title = value;
														} else if (nodeName.equals("link")) {
															link = value;
														} else if (nodeName.equals("pubDate")) {
															pubDate = value;
														}
													}
									%>

									<tr>
										<td><a href="<%=link%>"><%=title%></a></td>
										<td></td>
										<td><%=pubDate.substring(0, 17)%></td>
									</tr>
									<%
										}
											}
											Node data = dataList.item(0);
											System.out.println(data.getNodeType());
										} catch (ParserConfigurationException e) {
											e.printStackTrace();
										} catch (SAXException e) {
											e.printStackTrace();
										}
									%>
								</tbody>
							</table>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>

	<div id="mvctab3">
		<div class="mvcboard m3">
			<div class="container">
				<div class="row">
					<div class="col-sm-12">
						<p>
							<img src="<%=request.getContextPath()%>/img/spon.PNG"
								width="1100" height="1100">
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div id="mvctab4">
		<div class="mvcboard m4">
			<div class="container">
				<div class="row">
					<div class="">
						<p>
							<img src="<%=request.getContextPath()%>/img/pat.PNG" width="700"
								height="500">
						</p>
					</div>
					<div class="">
						<div class="container">
							<h2>HEALTH EAT 으로 찾아 오시는 길.</h2>
							<div id="map" style="width: 100%; height: 450px;"></div>

							<input type="button" class="btn btn2-danger" id="lo"
								value="HEALTH 본사" /> <input type="button"
								class="btn btn1-danger" id="jam" value="잠실 지점" /> <input
								type="button" class="btn btn3-danger" id="ever" value="용인 지점" />
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>

	$(function() {
		var data = "";
		var categoryArr = "";
		var category = "";
		$("#mvcboard #menu0").html("");
		$("#dietboard #menu1").html("");

		$
				.ajax({
					url : "notice.jsp",
					type : "get",
					dataType : "json",
					success : function(json) {

						var mvcboard = json.mvcboard;
						var dietboard = json.dietboard;
						var arr = [ mvcboard, dietboard ];

						for (var i = 0; i < mvcboard.length; i++) {

							var row = $("<div>");
							var table = $("<table class='table'>");
							var thead = $("<thead>");
							var tr = $("<tr>");
							var tbody = $("<tbody>");
							var td2 = $("<td>").html(
									'<a href= "Detail?no=' + mvcboard[i].no
											+ '&uri=mvcboard">'
											+ mvcboard[i].title + '</a>');
							var td3 = $("<td>").html(
									mvcboard[i].date.substring(0, 10));

							row.append(table).append(thead).append(tr).append(
									tbody).append(td2).append(td3);
							$("#menu0").append(row);
						}

						for (var i = 0; i < dietboard.length; i++) {

							var row = $("<div>");
							var table = $("<table class=\"table\">");
							var thead = $("<thead>");
							var tr = $("<tr>");
							var tbody = $("<tbody>");
							var td1 = $("<td>")
									.html(
											'<a href ="Detail?no='
													+ dietboard[i].no
													+ '&uri=dietboard"><img src="upload/'+dietboard[i].file+' "width="200" height="60">'
													+ '</a>');

							var td2 = $("<td>").html(
									dietboard[i].date.substring(0, 10));

							row.append(table).append(thead).append(tr).append(
									tbody).append(td1).append(td2);

							$("#menu1").append(row);

						}
					},
					error : function(xhr, textStatus, errorThrown) {
						$(".tbody").html(
								textStatus + "(HTTP-" + xhr.status + "/"
										+ errorThrown);
					}
				});

	});
	//=============================================
	// health board  보충제식품 ajax
	
		
	$(function() {
		var data = "";
		var categoryArr = "";
		var category = "";
		$("#healthboard #menu2").html("");

		$
				.ajax({
					url : "json/mainjson.jsp",
					type : "GET",
					dataType : "json",
					success : function(json) {
						console.log(json.healthboard);

						var healthboard = json.healthboard;
						var arr = [ healthboard ];

						console.log(healthboard[0].title);
						console.log(healthboard[0].file);

						var thead = $("<div class='container'>");

						for (var i = 0; i < healthboard.length; i++) {
							var tr = $("<div class='col-sm-3'>")
									.html(
											'<a href="Detail?no='
													+ healthboard[i].no
													+ '&uri=healthboard"><img src="upload/'+healthboard[i].file+' "width="300" height="200">'
													+ '</a>' + "<p>"
													+ healthboard[i].title
													+ "</p>");

							thead.append(tr);
							$("#menu2").append(thead);
						}
					},
					error : function(xhr, textStatus, errorThrown) {
						$(".menu2").html(
								textStatus + "(HTTP-" + xhr.status + "/"
										+ errorThrown);
					}
				});

	});
	// ================================
	//보충제 단백질 보드 menu3
	$(function() {
		var data = "";
		var categoryArr = "";
		var category = "";
		$("#eatboard #menu3").html("");

		$
				.ajax({
					url : "json/mainjson2.jsp",
					type : "GET",
					dataType : "json",
					success : function(json) {

						var eatboard = json.eatboard;
						var arr = [ eatboard ];

						//console.log(eatboard[0].title);
						//console.log(eatboard[0].file);

						var thead = $("<div class='container'>");

						for (var i = 0; i < eatboard.length; i++) {
							var tr = $("<div class='col-sm-3'>")
									.html(
											'<a href="Detail?no='
													+ eatboard[i].no
													+ '&uri=eatboard"><img src="upload/'+eatboard[i].file+' "width="300" height="200">'
													+ '</a>' + "<p>"
													+ eatboard[i].title
													+ "</p>");

							thead.append(tr);
							$("#menu3").append(thead);
						}
					},
					error : function(xhr, textStatus, errorThrown) {
						$(".menu3").html(
								textStatus + "(HTTP-" + xhr.status + "/"
										+ errorThrown);
					}
				});

	});
	$(function() {
		var data = "";
		var categoryArr = "";
		var category = "";
		$("#dieteat #menu4").html("");

		$
				.ajax({
					url : "json/mainjson3.jsp",
					type : "GET",
					dataType : "json",
					success : function(json) {

						var dieteat = json.dieteat;
						var arr = [ dieteat ];

						var thead = $("<div class='container'>");
						for (var i = 0; i < dieteat.length; i++) {
							var tr = $("<div class='col-sm-3'>")
									.html(
											'<a href="Detail?no='
													+ dieteat[i].no
													+ '&uri=dieteat"><img src="upload/'+dieteat[i].file+' "width="300" height="200">'
													+ '</a>' + "<p>"
													+ dieteat[i].title + "</p>");

							thead.append(tr);
							$("#menu4").append(thead);
						}
					},
					error : function(xhr, textStatus, errorThrown) {
						$(".menu4").html(
								textStatus + "(HTTP-" + xhr.status + "/"
										+ errorThrown);
					}
				});

	});
	$(function() {
		var data = "";
		var categoryArr = "";
		var category = "";
		$("#clothes #menu5").html("");

		$
				.ajax({
					url : "json/mainjson4.jsp",
					type : "GET",
					dataType : "json",
					success : function(json) {
						console.log(json.clothes);

						var clothes = json.clothes;
						var arr = [ clothes ];

						//console.log(clothes[0].title);
						//console.log(clothes[0].file);

						var thead = $("<div class='container'>");
						for (var i = 0; i < clothes.length; i++) {
							var tr = $("<div class='col-sm-3'>")
									.html(

											'<a href="Detail?no='
													+ clothes[i].no
													+ '&uri=clothes"><img src="upload/'+clothes[i].file+' "width="300" height="200">'
													+ '</a>' + "<p>"
													+ clothes[i].title + "</p>");

							thead.append(tr);
							$("#menu5").append(thead);
						}
					},
					error : function(xhr, textStatus, errorThrown) {
						$(".menu5").html(
								textStatus + "(HTTP-" + xhr.status + "/"
										+ errorThrown);
					}
				});

	});

	$(function() {
		var data = "";
		var categoryArr = "";
		var category = "";
		$("#health #menu6").html("");

		$
				.ajax({
					url : "json/mainjson5.jsp",
					type : "GET",
					dataType : "json",
					success : function(json) {
						console.log(json.health);

						var health = json.health;
						var arr = [ health ];

						console.log(health[0].file);
						console.log(health[0].title);

						var thead = $("<div class='container'>");
						for (var i = 0; i < health.length; i++) {
							var tr = $("<div class='col-sm-3'>")
									.html(

											'<a href="Detail?no='
													+ health[i].no
													+ '&uri=health"><img src="upload/'+health[i].file+' "width="300" height="200">'
													+ '</a>' + "<p>"
													+ health[i].title + "</p>");

							thead.append(tr);
							$("#menu6").append(thead);
						}
					},
					error : function(xhr, textStatus, errorThrown) {
						$(".menu6").html(
								textStatus + "(HTTP-" + xhr.status + "/"
										+ errorThrown);
					}
				});

	});

	/* var td2 = $("<div class='container'>").html(
	'<img src="upload/'+healthboard[i].file+' "width="200" height="150">'
			+ healthboard[i].title) */
	/* var td1 = $("<div class='col-sm-3'>")
	 .html(
	 '<img src="upload/'+healthboard[i].file+' "width="200" height="150">'); */
</script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=182fd0ca2f925129469d4dd83a176239"></script>

<script>
	$(function() {
		lo1(37.5111158, 127.09816699999999);
		
		$("#lo").click(function() {
			lo1(37.5111158, 127.09816699999999);
		});
		$("#jam").click(function() {
			lo1(37.5205636, 127.02292729999999);
		});
		$("#ever").click(function() {
			lo1(37.2939104, 127.20256640000002);
		});
	});
	function lo1(a, b) {

		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new daum.maps.LatLng(a, b), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

		// 마커가 표시될 위치입니다 
		var markerPosition = new daum.maps.LatLng(a, b);

		// 마커를 생성합니다
		var marker = new daum.maps.Marker({
			position : markerPosition
		});

		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);

		// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
		// marker.setMap(null);    

	}
</script>
	
	

<!-- bmi 계산 -->
<script>
	$(function(){
		$("#hap").click(function(){
			var getkey = $("#key").val()/100;
			var key = getkey*getkey;
			var weight = $("#weight").val();
			var bmi = weight/key;
			
			$("#bmiresult").val(Math.round(bmi*10)/10.0);
			
			console.log(key);
			console.log(weight);
			console.log(bmi);
		});
	/* 	$("#hhh").click(function(){
			alert("준비중입니다.");
	}); */
	});


</script>
<!-- 	frist tab	 -->
<script>
$(function(){
	$(".nav-tabs>li:eq(0) >a").addClass("selected");
	$(".nav-tabs>li>a").on("click",function(){
		$(".nav-tabs>li>a").removeClass("selected");
		$(this).addClass("selected");
	});
});

</script>
<%@ include file="../inc/footer.jsp"%>