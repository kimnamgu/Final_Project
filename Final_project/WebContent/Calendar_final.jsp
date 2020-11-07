<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../inc/header.jsp"%>

<div class="container">
	<h3>Health Eat 출석 이벤트</h3>
	
	<table class="table table-stripped" id="mytable">
		<caption>EVENT</caption>
		<thead>
			<tr>	
		 		<th colspan="7"><span class="myc year"></span>년  <span class="myc month"></span>월 달력</th>
			</tr>
			<tr><th>SUM</th><th>MON</th><th>TUE</th><th>WED</th><th>THU</th><th>FRI</th><th>SAT</th></tr>
		</thead>
		<tbody>

		</tbody>
	</table>
	
	<p class="col-sm-6"> 
		<a href="EventCalendar_ajax"  class="btn btn-danger prev" >이전달</a>
	</p>
	<p class="col-sm-6 text-right"> 
		<a href="EventCalendar_ajax"  class="btn btn-danger next" >다음달</a>
	</p>	
	
</div>
<script>
$(function(){
	calcfn();
	$(".prev").on("click",function(){  
		calcfn( Number($(".myc.month").html())-2 , Number($(".myc.year").html())); 
		return false;
	});	
	$(".next").on("click",function(){  
		calcfn( Number($(".myc.month").html()) , Number($(".myc.year").html())); 
		return false;
	});	
});
function calcfn(month, year){
	$.ajax({ 
		  url:"EventCalendar_ajax" , 	type:"get" , 	dataType:"json" ,  data:{"month":month , "year":year} ,
		  success:function(json){ 
			    $("#mytable tbody").html('');
			    $(".myc.year").html(json.year);
			    $(".myc.month").html(json.month+1);
			    var tr = $("<tr>");
			    for(var i=0;i<(json.startyoil-1);i++)
			    { tr.append($("<td>").html("*")); $("#mytable tbody").append(tr); }

			    for(var i=1;i<=(json.lastday);i++)
			    { tr.append($("<td>").html("<input type='button' value='"+i+"'/>")); $("#mytable tbody").append(tr); 
			      if((json.startyoil+i-1) % 7 == 0){tr = $("<tr>");}
			    }
			    for(var i=0;i<((7-json.lastyoil));i++)
			    { tr.append($("<td>").html("*")); $("#mytable tbody").append(tr); }	
		  } , 
	      error:function( xhr, textStatus, errorThrown ){ 
		    $(".result.r1").html(textStatus + "(HTTP-" + xhr.status + "/" + errorThrown);
	    }
	});
}
</script>	
<%@ include file="../inc/footer.jsp"%>


