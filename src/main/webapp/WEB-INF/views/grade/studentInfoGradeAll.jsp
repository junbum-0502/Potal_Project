<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/views/include/head.jsp" %>

<head>
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<style type="text/css">
	h2{
		width:500px;
		margin-left: 300px;
		color:rgb(051,051,102);
		font-weight: bold;
	}
	 
	.backPage{
		margin-left: 310px;
	}
	
	.infoTable,.infoTable1,.infoTable2 * {
	
	}
	
	.infoTable,.infoTable1,.infoTable2 {
		border: 2px solid;
		width: 900px;
		margin-left: 500px;
    	position: absolute;
	}
	
	.infoTable1{
		border: 2px solid;
		width: 900px;
		margin-left: 500px;
    	position: absolute;
    	top: 420px;
	}
	
	.infoTable2{
		border: 2px solid;
		width: 900px;
		margin-left: 500px;
    	position: absolute;
    	top: 680px;
	}
	
	.infoBody * {
		border: 1px solid;
		text-align: center;
		width: 150px;
	}
	
	.gradeTd{
		width: 350px;
		text-align: center;
	}
	
	.gradeTd1{
		width: 70px;
		text-align: center;
	}
	 
	.gradeTd3{
		width: 150px;
		text-align: center;
	}
 
	.gradeTd2{
		width: 70px;
		text-align: center;
	}
	
	.infoBody1 * {
		border: 1px solid;
	}
	
	.trt * {
		border: 1px solid;
	} 
	
	#infoH{
		position: absolute;
	    left: 500px;
	    top: 210px;
	    color:rgb(051,051,102);
	}
	
	#infoH1{
		position: absolute;
		left: 500px;
   		top: 370px;
   		color:rgb(051,051,102);
	}
	
	#infoH2{
		position: absolute;
	    left: 500px;
    	top: 620px;
    	color:rgb(051,051,102);
	}
	
	#btn_open {
		margin-bottom: 20px;
		border-radius: 6px;
		border: 0;
	    color: #fff;
	    background-color: #4e73df;
	    margin-left: 830px;
	}
	
	#btn_open:hover {
		background-color: #224abe;
	}
	  
</style>

</head>
<body>
 <input type="hidden" value="${userId}" id="userId">
	<br>
	<h2 >ํ์์กฐํ</h2>
	<div class="backPage" style="width:80vw;">
		<a style="color: gray"> <i class="fas fa-graduation-cap"></i></a> > ํ์์?ํ > ํ์์?๋ณด
		 <button id="btn_open">๋ฉ์ธ์ง</button>
	</div>
	<br><br>
	
	<c:forEach var="info" items="${uList }" varStatus="status">
	<%-- ํ๋ฒ : <br>
	ํธ๋ํฐ ๋ฒํธ : <br>
	์ด๋ฉ์ผ : <br> --%>
	<%-- <input type="hidden" value="${info.USER_ID}" id="userId"> --%>
	<h3 id="infoH">ํ์์?๋ณด<i style="margin-left: 10px;" class="fas fa-info"></i></h3><br>
	<table class="infoTable">
		<tbody class="infoBody">
			<tr class="infoTr">
				<th class="thth">์ด๋ฆ</th>
				<td>${info.NAME}</td>
				<th class="thth">ํ๋ฒ</th>
				<td>${info.USER_ID}</td>
				<th class="thth">ํธ๋ํฐ ๋ฒํธ</th>
				<td>${info.PHONE}</td>
				
			</tr>
			<tr>
				<th>์ด๋ฉ์ผ</th>
				<td>${info.EMAIL}</td>
				<th>์๋์์ผ</th>
				<td>${info.BIRTH}</td>
				<th>ํ๋(ํ๊ธฐ)</th>
					<c:if test="${info.SEMESTER == 1}">
					<td>1ํ๋ 1ํ๊ธฐ</td>
					</c:if>
					<c:if test="${info.SEMESTER == 2}">
					<td>1ํ๋ 2ํ๊ธฐ</td>
					</c:if>
					<c:if test="${info.SEMESTER == 3}">
					<td>2ํ๋ 1ํ๊ธฐ</td>
					</c:if>
					<c:if test="${info.SEMESTER == 4}">
					<td>2ํ๋ 2ํ๊ธฐ</td>
					</c:if>
					<c:if test="${info.SEMESTER == 5}">
					<td>3ํ๋ 1ํ๊ธฐ</td>
					</c:if>
					<c:if test="${info.SEMESTER == 6}">
					<td>3ํ๋ 2ํ๊ธฐ</td>
					</c:if>
					<c:if test="${info.SEMESTER == 7}">
					<td>4ํ๋ 1ํ๊ธฐ</td>
					</c:if>
					<c:if test="${info.SEMESTER == 8}">
					<td>4ํ๋ 2ํ๊ธฐ</td>
					</c:if>
			</tr>
		
		</tbody>
	
	</table>
	
	</c:forEach>
	<br><br>
	
	<h3 id="infoH1">ํ์ ์ฑ์?<i style="margin-left: 10px;" class="fas fa-user-graduate"></i></h3><br>
	<table class="infoTable1">
		<thead>
			<tr class="trt">
				<th style="text-align: center">๊ณผ๋ชฉ๋ช</th>
				<th style="text-align: center">ํ๊ธฐ</th> 
				<th style="text-align: center">ํ์?</th>
				<th style="text-align: center">๋น๊ณ?</th> 
			</tr>
		</thead>
		<tbody class="infoBody1">
		<c:forEach var="grade" items="${gList }" varStatus="status">
			<tr class="infoTr1">
			
				<td class="gradeTd">${grade.TITLE}</td>	
				<td class="gradeTd3">${grade.YEAR_SEMESTER}</td>	
				<td class="gradeTd1">${grade.CREDIT}</td>	
				<td class="gradeTd2">${grade.GRADE}</td>					
			
			</tr>
		</c:forEach>
		</tbody>
		 
	</table>
	
	 
	<h3 id="infoH2">ํํ๊ธฐ ์๊ฐ ๋ชฉ๋ก<i style="margin-left: 10px;" class="fas fa-book-reader"></i></h3><br>
	<table class="infoTable2">
		<thead>
			<tr class="trt">
				<th style="text-align: center">๊ณผ๋ชฉ๋ช</th>
				<th style="text-align: center">๊ฐ์์๊ฐ</th> 
				<th style="text-align: center">๋ด๋น๊ต์</th> 
				<th style="text-align: center">๊ฐ์์ค</th> 
			</tr>
		</thead> 
		<tbody class="infoBody1">
		<c:forEach var="sche" items="${sList }" varStatus="status">
			<tr class="infoTr1">
			
				<td class="gradeTd">${sche.TITLE}</td> 
				<td class="gradeTd3">${sche.TIME}
				<c:if test="${sche.S_TIME == 1}">
					<c:forEach begin="${sche.S_TIME}" end="3"  var="time"> 
						${time}
					</c:forEach>
				</c:if>
				<c:if test="${sche.S_TIME == 2}">
					<c:forEach begin="${sche.S_TIME}" end="4"  var="time"> 
						${time}
					</c:forEach>
				</c:if>
				<c:if test="${sche.S_TIME == 5}">
					<c:forEach begin="${sche.S_TIME}" end="7"  var="time"> 
						${time}
					</c:forEach>
				</c:if>
				<c:if test="${sche.S_TIME == 6}">
					<c:forEach begin="${sche.S_TIME}" end="8"  var="time"> 
						${time}
					</c:forEach>
				</c:if>
				</td>
				<td class="gradeTd1">${sche.P_NAME}</td>	
				<td class="gradeTd2">${sche.CLASSROOM}</td>					
			
			</tr>
		</c:forEach>
		</tbody>
		 
	</table>


  
</body>

<script>
	window.onload = function () {
		 
		var userId = document.getElementById("userId").value;
		console.log(userId);
		
		$("#btn_open").click(msg);
		 
		let openMsg = null;
		 
		function msg(userId){ 
			openMsg = window.open("messagePtoU?userId=${userId}", "Message", "width=400, height=500, toolbar=yes");
		}		  
	} 
</script>

</html>