<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/header.jsp"%>
<body>

	<div class="container panel panel-info">
		<div id="map" style="width: 100%; height: 450px;"></div>
		
		<input type="button" class="btn btn-danger" id="lo" value="HEALTH 본사" /> <input
			type="button" class="btn btn-danger" id="jam" value="잠실 지점" /> <input
			type="button" class="btn btn-danger" id="ever" value="용인 지점" />
	</div>
	
	

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=182fd0ca2f925129469d4dd83a176239"></script>

	<script>
		$(function() {
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
<%@ include file="../inc/footer.jsp"%>
