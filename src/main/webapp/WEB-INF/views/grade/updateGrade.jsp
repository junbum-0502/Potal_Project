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
		
		.gradeDiv{
		margin-left: 300px;
		}
	
	</style>
		
</head>
<body>

<br>
	<h2 >성적수정</h2>
	<div class="backPage" style="width:80vw;">
		<a style="color: gray"> <i class="fas fa-graduation-cap"></i></a> > 과목선택 > 학생선택<br>
	</div>

<br><br>
		
		<div class="gradeDiv">
		<c:forEach var="score" items="${sList }" varStatus="status">
			과목명<small>(과목번호)</small> : ${score.TITLE }<small>(${score.C_IDX})</small><br>
			학생 이름 : <a href="/potal/scoreUserInfo?name=${score.S_NAME }&cIdx=${score.C_IDX}">${score.S_NAME }<small>(${score.USER_ID})</small></a><br>
			<a href="/potal/putScoreUpdate?name=${score.S_NAME }&cIdx=${score.C_IDX}&pid=${score.PRO_ID}&userId=${score.USER_ID}">성적 수정하기</a><br>
			<hr>
		</c:forEach>
		</div>


</body>

<script>

		function sub(){
			
			scoreForm.submit();
		}

</script>

</html>