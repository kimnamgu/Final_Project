<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/header.jsp"%>

<div class="container">
<h3>검색결과</h3>
<table class="table table-stripped" id="boardList">
	<caption>검색 제품</caption>
	<thead>
		<tr>
			<th>이미지</th>
			<th>번호</th>
			<th>상품</th>
			<th>가격</th>
			<th>제조일</th>
		</tr>
	</thead>

	<tbody>

		<c:forEach items="${search}" var="vo" varStatus="idx">
			<tr>
				<td><a
					href="<%=request.getContextPath()%>/Detail?no=${vo.no}&uri=health"><img
						src="upload/${vo.file}" alt="" width="200" height="150"></a></td>
				<td>${vo.no}</td>
				<td>${vo.name}</td>
				<td>${vo.email}</td>
				<td>${vo.date}</td>
			</tr>
		</c:forEach>
	</tbody>

</table>
</div>

<!--  --------------------------------------------- -->
<%-- <div class="container">   
      <div class="row"> 
      
      <c:forEach items="${search}" var="vo" varStatus="idx" >
            <div class="col-sm-3">
            <img src="<%=request.getContextPath()%>/img/check1.png" alt="체크" class="check" vlaue="${vo.no}">
                <div class="container">  
               <p>${vo.title}</p>  
               <p>${vo.name}</p>           
               <a href="<%=request.getContextPath()%>/img/Detail?no=${vo.no}&uri=health"><img src="upload/${vo.file}" alt=""></a>
            </div>   
            </div>
      </c:forEach>
      </div>
   </div> --%>
<%@ include file="../inc/footer.jsp"%>
