<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/head.jsp" %>

<head>

<style type="text/css">

</style>

</head>
<body>
	<br><br>
	성적 수정 페이지<br><hr>
	
	<form method="post" id="scoreForm" action="/potal/updateScoreUpdate">
	<c:forEach var="sc" items="${scoList}" varStatus="status">

	과목 번호 : <input type="text" id="idx" name="idx" value="${idx }"><br><br>
	학생 번호 : <input type="text" id="uid" name="uid" value="${uid }"><br><br>
	학생 이름 : <input type="text" id="name" name="name" value="${sc.NAME }"><br><br>
	중간 점수 : <input type="text" id="mid" name="mid" value="${sc.MID_SCORE }"><br><br>
	기말 점수 : <input type="text" id="final" name="final" value="${sc.FINAL_SCORE }"><br><br>
	총합 점수 : <input type="text" id="score" name="score" value="${sc.SCORE }"><br><br>
	최종 학점 : <input type="text" id="credit" name="credit" value="${sc.CREDIT }"><br><br>
	최종 학점 : <input type="text" id="grade" name="grade" value="${sc.GRADE }"><br><br>
	수강 학기 : <input type="text" id="semester" name="semester" value="${sc.YEAR_SEMESTER } "><br>
	
	<input type="hidden" value="${pid}" id="pid" name="pid">
<%-- 	<input type="hidden" value="${idx}" id="idx" name="idx"> --%>
	
	<br><br><br><br>
	<button onclick="sub()">성적 수정하기</button>
	</form>
	
	</c:forEach>
</body>

<!-- <script>

		function sub(){
			
			var mid = document.getElementById("mid").value;
			var finalS = document.getElementById("final").value;
			var score = document.getElementById("score").value;
			var credit = document.getElementById("credit").value;
			var grade = document.getElementById("grade").value;
			
			if(mid == ""){
				alert("중간고사 성적을 입력하세요.");
				return false;
			}else if(finalS == ""){
				alert("기말고사 성적을 입력하세요.");
				return false;
			}else if(score == ""){
				alert("총합 성적을 입력하세요.");
				return false;
			}else if(credit == ""){
				alert("학점을 입력하세요.");
				return false;
			}else if(grade == ""){
				alert("학점을 입력하세요.");
				return false;
			}else{
				 scoreForm.submit();
			}
			

			
		}

</script> -->
</html>