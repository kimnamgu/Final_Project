<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js">	</script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container panel panel-info">

		<h3 class="panel-heading">파일 업로드에 사용되는 COS 라이브러리</h3>
		<form action="JSP025_uploadServlet_multi" method="post"
			enctype="multipart/form-data">
			
			<fieldset>
				<legend>UPLOAD002</legend>
				<div class="panel-body">
					
					<div class="form-group">
						<label for="title">제목</label> <input type="text" name="title"
							id="title" class="form-control" />
					</div>
					<div class="form-group">
						<div class="col-sm-4">
							<label for="date21">기간 시작</label> 
							<input type="date" name="date1" id="date21" class="from-control" />
						</div>
						
						<div class="col-sm-4">
							<label for="date22">기간 종료</label> 
							<input type="date" name="date1" id="date22" class="from-control" />
						</div>
						
						<div class="col-sm-4">
							<label for="date23">당첨자</label> 
							<input type="date" name="date1" id="date23" class="from-control" />
						</div>
							
					</div>
					<!-- <div class="form-group">
						<label for="uploadFile1">파일 업로드1</label> <input type="file"
							name="uploadFile1" id="uploadFile1" class="form-control" />
					</div> -->

					<div class="form-group">
						<label for="uploadFile1">파일 업로드2</label> 
						<input type="file" name="uploadFile1" id="uploadFile1" class="form-control" />
					</div>

				</div>
			</fieldset>
			
			
			<fieldset>
				<legend>UPLOAD002</legend>
				<div class="panel-body">
					
					<div class="form-group">
						<label for="title">제목</label> <input type="text" name="title"
							id="title" class="form-control" />
					</div>
					<div class="form-group">
						<div class="col-sm-4">
							<label for="date21">기간 시작</label> 
							<input type="date" name="date2" id="date21" class="from-control" />
						</div>
						
						<div class="col-sm-4">
							<label for="date22">기간 종료</label> 
							<input type="date" name="date2" id="date22" class="from-control" />
						</div>
						
						<div class="col-sm-4">
							<label for="date23">당첨자</label> 
							<input type="date" name="date2" id="date23" class="from-control" />
						</div>
							
					</div>
					<!-- <div class="form-group">
						<label for="uploadFile1">파일 업로드1</label> <input type="file"
							name="uploadFile1" id="uploadFile1" class="form-control" />
					</div> -->

					<div class="form-group">
						<label for="uploadFile2">파일 업로드2</label> 
						<input type="file" name="uploadFile2" id="uploadFile2" class="form-control" />
					</div>

				</div>
			</fieldset>
			
			
			
			<div class="form-group">
				<input type="submit" value="전송" class="form-control btn btn-danger" />
			</div>
		</form>




	</div>



</body>
</html>