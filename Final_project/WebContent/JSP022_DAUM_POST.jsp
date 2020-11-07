<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
</head>
<body>
	<!-- 
		1. http://postcode.map.daum.net/guide
		2. #postcode 버튼을 클릭하면 우편번호검색을 시작합니다. 알림창띄우기
	 --> 
	 <div class="container   panel  panel-warning">
	 	<h3  class="panel-heading"> 우편번호</h3>
   		<div class="panel-body  row">
	   		<div class="col-sm-2">
			  <label for="post1"><strong class="required">(*)</strong>우편번호</label> 
			</div>
			<div class="col-sm-10">
				<input type="text" id="post1" name="mbaddress"   >
				<input type="text" id="post2" name="mbaddress"     title="우편번호 두번째자리" >
				<input type="button" value="우편번호검색" id="postcode"    
					   class="btn  btn-warning"   />
			</div>	
		</div>	
   		<div class="panel-body  row">	
	   		<div class="col-sm-2">
			  <label for="address1">상세주소</label> 
			</div>
			<div class="col-sm-10">
				<input type="text" id="address1" name="mbaddress"   >
				<input type="text" id="address2" name="mbaddress"   >
			</div>
		</div>
	</div><!-- form-group  END -->
 
</body>
</html>

