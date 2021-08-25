<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/head.jsp" %>

<head>

<style type="text/css">

	.putSD{
		margin-left: 300px;
		width: 80%;
	}
	 
	.putSB{
		width:150px;
		height:40px;

	}
	
	.putSB:hover {
		color: rgb(051,051,102);
	}
	
	h2{
		width:500px;
		margin-left: 300px;
		color:rgb(051,051,102);
		font-weight: bold;
	}
	 
	.backPage{
		margin-left: 310px;
	}
	
	#warn{
		color:red;
		margin-left: 300px;
	}

</style>

</head>
<body>
	
	<br>
	<h2 >성적입력</h2>
	<div class="backPage" style="width:80vw;">
		<a style="color: gray"> <i class="fas fa-graduation-cap"></i></a> > 과목선택 > 학생선택 > 성적입력<br>
	</div>
	
<br><br>
	
	<c:if test="${empty aList}">
		<div class="putSD">
			<form method="post" id="scoreForm" action="/potal/updateScore">
			
			과목 번호 : <input type="text" id="idx" name="idx" value="${idx }"><br><br>
			학생 번호 : <input type="text" id="uid" name="uid" value="${uid }"><br><br>
			학생 이름 : <input type="text" id="name" name="name" value="${name }"><br><br>
			중간 점수 : <input type="text" id="mid" name="mid" placeholder="중간 성적을 입력하세요."><br><br>
			기말 점수 : <input type="text" id="final" name="final" placeholder="기말 성적을 입력하세요."><br><br>
			총합 점수 : <input type="text" id="score" name="score" placeholder="최종 성적을 입력하세요."><br><br>
			최종 학점 : <input type="text" id="credit" name="credit" placeholder="ex) 4.5(A+) .. "><br><br>
			최종 학점 : <input type="text" id="grade" name="grade" placeholder="ex) A+ , B .."><br><br>
			
			수강 학기 : <input type="text" id="semester" name="semester" placeholder="ex) 2021-1 "><br>
			
			<input type="hidden" value="${pid}" id="pid" name="pid">
			
			<br><br><br>
			<button class="putSB" onclick="sub()">성적 입력하기</button>
			</form>
		</div>
	</c:if>
	
	<c:if test="${!empty aList}">
		<div id="warn">
			※ 해당 학생은 이미 성적입력을 완료하셨습니다. ※<br>
			성적 수정을 원하시면 화면 하단의 <span style="margin-left: 3px; margin-right: 3px; font-weight: bold;">'성적수정 바로가기'</span> 탭을 이용해주시기 바랍니다.  
		</div>
		<br>
		<div class="putSD">
			<c:forEach var="sco" items="${aList }" varStatus="status">
			과목 번호 : <input type="text" id="idx" name="idx" value="${idx }"><br><br>
			학생 번호 : <input type="text" id="uid" name="uid" value="${uid }"><br><br>
			학생 이름 : <input type="text" id="name" name="name" value="${name }"><br><br>
			중간 점수 : <input type="text" id="mid" name="mid" value="${sco.MID_SCORE }"><br><br>
			기말 점수 : <input type="text" id="final" name="final" value="${sco.FINAL_SCORE }"><br><br>
			총합 점수 : <input type="text" id="score" name="score" value="${sco.SCORE }" ><br><br>
			최종 학점 : <input type="text" id="credit" name="credit" value="${sco.CREDIT }"><br><br>
			최종 학점 : <input type="text" id="grade" name="grade" value="${sco.GRADE }"><br><br>			
			수강 학기 : <input type="text" id="semester" name="semester" value="${sco.YEAR_SEMESTER }"><br>		
			
			<br>
			<a class="putSB" href="/potal/putScoreUpdate?name=${name}&cIdx=${idx}&pid=${sco.PRO_ID}&userId=${uid}">성적수정 바로가기</a>
				
			</c:forEach>	
		</div>
	</c:if>
	
</body>

<script>

		function sub(){
			
			scoreForm.submit();
		}

</script>
</html>