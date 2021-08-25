<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/head.jsp" %>

<head>

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
	  
</style>

</head>
<body>

	<br>
	<h2 >학생조회</h2>
	<div class="backPage" style="width:80vw;">
		<a style="color: gray"> <i class="fas fa-graduation-cap"></i></a> > 학생선택 > 학생정보<br>
	</div>
	<br><br>
	
	<c:forEach var="info" items="${uList }" varStatus="status">
	<%-- 학번 : <br>
	핸드폰 번호 : <br>
	이메일 : <br> --%>
	
	<h3 id="infoH">학생정보<i style="margin-left: 10px;" class="fas fa-info"></i></h3><br>
	<table class="infoTable">
		<tbody class="infoBody">
			<tr class="infoTr">
				<th class="thth">이름</th>
				<td>${info.NAME}</td>
				<th class="thth">학번</th>
				<td>${info.USER_ID}</td>
				<th class="thth">핸드폰 번호</th>
				<td>${info.PHONE}</td>
				 
			</tr>
			<tr>
				<th>이메일</th>
				<td>${info.EMAIL}</td>
				<th>생년원일</th>
				<td>${info.BIRTH}</td>
				<th>학년(학기)</th>
					<c:if test="${info.SEMESTER == 1}">
					<td>1학년 1학기</td>
					</c:if>
					<c:if test="${info.SEMESTER == 2}">
					<td>1학년 2학기</td>
					</c:if>
					<c:if test="${info.SEMESTER == 3}">
					<td>2학년 1학기</td>
					</c:if>
					<c:if test="${info.SEMESTER == 4}">
					<td>2학년 2학기</td>
					</c:if>
					<c:if test="${info.SEMESTER == 5}">
					<td>3학년 1학기</td>
					</c:if>
					<c:if test="${info.SEMESTER == 6}">
					<td>3학년 2학기</td>
					</c:if>
					<c:if test="${info.SEMESTER == 7}">
					<td>4학년 1학기</td>
					</c:if>
					<c:if test="${info.SEMESTER == 8}">
					<td>4학년 2학기</td>
					</c:if>
			</tr>
		
		</tbody>
	
	</table>
	
	</c:forEach>
	<br><br>
	
	<h3 id="infoH1">학생 성적<i style="margin-left: 10px;" class="fas fa-user-graduate"></i></h3><br>
	<table class="infoTable1">
		<thead>
			<tr class="trt">
				<th style="text-align: center">과목명</th>
				<th style="text-align: center">학기</th> 
				<th style="text-align: center">학점</th>
				<th style="text-align: center">비고</th> 
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
	
	 
	<h3 id="infoH2">현학기 수강 목록<i style="margin-left: 10px;" class="fas fa-book-reader"></i></h3><br>
	<table class="infoTable2">
		<thead>
			<tr class="trt">
				<th style="text-align: center">과목명</th>
				<th style="text-align: center">강의시간</th> 
				<th style="text-align: center">담당교수</th> 
				<th style="text-align: center">강의실</th> 
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

</script>

</html>