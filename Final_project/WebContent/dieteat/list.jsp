<%@page import="com.company.servlet.DietDBM"%>
<%@page import="com.company.servlet.Dto_li"%>
<%@page import="com.company.java.*"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.company.java.Dto_list"%>
<%@page import="com.company.java.DBmanager1"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/header.jsp"%>
<style>
p.skinkatagory {
	margin: 2%;
}
</style>


<!-- container -->
<%
	if (request.getParameter("result") != null) {
		int result = Integer.parseInt(request.getParameter("result"));
		if (result < 0) {
			out.println("<script>alert('글쓰기실패')</script>");
		} else {
			out.println("<script>alert('글쓰기성공')</script>");
		}
	}
	if (request.getParameter("result1") != null) {
		int result1 = Integer.parseInt(request.getParameter("result1"));
		if (result1 < 0) {
			out.println("<script>alert('글삭제실패')</script>");
		} else {
			out.println("<script>alert('글삭제성공')</script>");
		}
	}
%>

<div class="container">
	<p class="skinkatagory">
		<img src="<%=request.getContextPath()%>/img/skinkatagory.jpg" />
	</p>

</div>

<script>
	$(function() {
		$
				.ajax({
					url : "${pageContext.request.contextPath}/list",
					type : "get",
					dataType : "json",
					data : {
						"uri" : $(".div_uri").html()
					},
					success : function(data) {
						//console.log(data);
						var total = data[0].total;

						for (var i = 1; i < data.length; i++) {
							var tr = $("<tr>");
							var td1 = $("<td>").html(total - i + 1);
							var td2 = $("<td>").html(
								'<a href="${pageContext.request.contextPath}/Detail?no='
									+ data[i].no
									+ '&uri=dieteat"><img src="${pageContext.request.contextPath}/upload/'+data[i].file+' "width="300" height="200">'
									+ '</a>' + "<p>"
									)
				
							var td3 = $("<td>").html(
									"<a href='${pageContext.request.contextPath}/Detail?no="
									+ data[i].no + "&uri=dieteat'>"
									+ data[i].title + "</a>");
							var td4 = $("<td>").html(data[i].date);
							var td5 = $("<td>").html(data[i].hit);
							var td6 = $("<td>").html(data[i].email);

							tr.append(td1).append(td2).append(td3).append(td4)
									.append(td5).append(td6);
							$("#list").append(tr);
						}
					},
					error : function(xhr, textStatus, errorThrown) {
						$("#list").html(
								textStatus + "(HTTP-" + xhr.status + "/"
										+ errorThrown);
					}
				});
	});
</script>
<div class="div_uri hidden"><%=request.getRequestURI().split("/")[2]%></div>

<div class="container" style="min-height: 2000px">
	<h3>HEALTH EAT 단백질 제품.</h3>
	<div>
		<table class="table table-striped">
			<caption>HEALTH EAT</caption>
			<thead>
				<tr>
					<th scope="col">번호</th>
					<th scope="col">이미지</th>
					<th scope="col">제목</th>
					<th scope="col">날짜</th>
					<th scope="col">조회수</th>
					<th scope="col">가격</th>
				</tr>
			</thead>
			<tbody id="list"></tbody>
			<tfoot>
				<tr>
					<td colspan="5" class="text-right"><a href="write.jsp"
						class="btn btn-danger">글작성</a></td>
				</tr>
			</tfoot>
		</table>
	</div>
</div>
<%@ include file="../inc/footer.jsp"%>