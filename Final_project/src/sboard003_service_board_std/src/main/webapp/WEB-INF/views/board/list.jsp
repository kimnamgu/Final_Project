<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page session="false"%>

<%@include file="/inc/header.jsp"%>

<!-- Main content -->
<section class="container"  style="margin-top:10%">
	<table class="table table-striped table-hover">
		<thead>
			<tr>
				<th>BNO</th>
				<th>TITLE</th>
				<th>WRITER</th>
				<th>DATE</th>
				<th>HIT</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${list}" var="boardVO"  varStatus="status" >
		
			<tr>
				<%-- <td> 전체 갯수 : ${fn:length(list)}</td> --%>
				<td> ${fn:length(list) - status.index}</td>
				<td><a href='<%=request.getContextPath()%>/board/board_detail?bno=${boardVO.bno}'>${boardVO.btitle} </a></td>
				<td>${boardVO.bname}</td>
				<td><%-- <fmt:formatDate pattern="yyyy-MM-dd HH:mm"
						value=" --%>${boardVO.bdate}<!-- " /> --></td>
				<td><span class="badge bg-red">${boardVO.bhit }</span></td>
			</tr>
		
		</c:forEach>	
		
			<tr  class="text-right">
				<td  colspan="5">
					<a href='<%=request.getContextPath()%>/board/board_write' class="btn btn-default"> 글쓰기</a>
				</td>
			</tr>	
		</tbody>			
	</table>
</section>


<%@include file="/inc/footer.jsp"%>
