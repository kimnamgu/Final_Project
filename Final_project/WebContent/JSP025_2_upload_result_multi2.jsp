<%@page import="com.company.upload.modal_Dto"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<%!String title, mfile, filename2, date, date1, date2;%>
		<%
			request.setCharacterEncoding("utf-8");// 폼에서 넘어온 한글데이터를 깨지지 않도록 인코딩 값을 지정. 

			ArrayList<modal_Dto> list = (ArrayList<modal_Dto>) request.getAttribute("mlist");
			System.out.println(list);
			Iterator<modal_Dto> iter = list.iterator();
			while (iter.hasNext()) {
				modal_Dto dto = iter.next();
				String[] dateArr = dto.getmdate().split("/");
				String date = dateArr[0] + "~" + dateArr[1];
				String okdate = (dateArr[2] != null) ? dateArr[2] : "당첨자 발표 없음";
		%>
		<div class="col-sm-4">
			
			<p data-toggle="modal" data-target="#m<%=dto.getMno()%>" >
				<img src="/upload/<%=dto.getMfile()%>" alt="" />
					
			</p>
			<p>
				이벤트 기간 :
				<%=date%></p>
			<p>
				당첨자 발표 :
				<%=okdate%></p>
			<!-- modal -->
			<div class="modal fade" id="m<%=dto.getMno()%>" role="dialog">
				<div class="modal-dialog">
					<!-- Modal content -->
					<div class="modal-content">
						<div class="modal-header text-right">
							<input type="button" class="btn btn-default" value="CLOSE"
								data-dismiss="modal" />
						</div>
						<div class="modal-body">
							<img src="/upload/<%=dto.getMfile()%>" alt="" />
						</div>

					</div>
				</div>
			</div>

		</div>
		<%
			}
		%>
		<%-- //<p><a href="/upload/<%=filename2%>"><img src="/upload/<%=filename2%>" alt=""/></a></p> --%>
	</div>
</body>
</html>