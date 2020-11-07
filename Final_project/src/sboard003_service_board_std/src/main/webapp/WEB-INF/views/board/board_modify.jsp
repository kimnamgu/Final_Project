<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page  import="java.sql.*" %>  

<jsp:include   page="/inc/header.jsp" />
<!--					 -->
<!--  header.html  -->
 

	<div class="container">
			<h3>QNA 수정하기</h3>
			<form action="<%=request.getContextPath()%>/board/board_modify"    method="post"  id="modifyform">
					<!--  bno 숨겨서 넘겨주기  -->	
					<input type="hidden" id="bno"  name="bno" value="${boardVO.bno}"    class="form-control" /> 			
					<div class="form-group"  >
					  <span class="glyphicon glyphicon-plus"><label for="bname">이름</label></span>
					  <input type="text" id="bname"  name="bname" value="${boardVO.bname}"  readonly="readonly" class="form-control" /> 
					</div>	
					<div class="form-group">
					  <label for="bpass"  >비밀번호</label>
					  <input type="password"   name="bpass"   id="bpasss"   class="form-control" > 
					</div>					
					<div  class="form-group"   >
					  <span class="glyphicon glyphicon-plus"> <label for="btitle"> 제목</label></span>
					  <input type="text" id="btitle"  name="btitle" value="${boardVO.btitle}"  class="form-control" /> 
					</div>	
					<div  class="form-group"   >
					  <span class="glyphicon glyphicon-plus"> <label for="bcontent"> 내용</label></span>
					  <textarea rows="10" cols="60" name="bcontent"  id="bcontent" class="form-control" >${boardVO.bcontent}</textarea>
					</div>	
					<div class="row  text-right"    >
						 <input type="submit"   class="btn"  value="수정"   > 
						 <input type="button"   class="btn"  value="취소"  id="board_cancel"> 
						 <a href="<%=request.getContextPath()%>/board/listAll"  class="btn" >목록보기</a> 
					</div>	
		</form>	
	</div>
	<script>
		$(function(){
			$("#board_cancel").on("click",function(){
				history.go(-1);
			});	

		});
	
	</script>
 
<!--					 -->
<!--  Footer.html  -->
<!--					 -->
<jsp:include   page="/inc/footer.jsp" />
