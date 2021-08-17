<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/head.jsp" %>

<head>

<style type="text/css">

</style>

</head>
<body>
	<br><br>
	성적 입력 페이지<br><hr>
	
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
<%-- 	<input type="hidden" value="${idx}" id="idx" name="idx"> --%>
	
	<br><br><br><br>
	<button onclick="sub()">성적 입력하기</button>
	</form>
	
</body>

<script>

		function sub(){
			
			scoreForm.submit();
		}

</script>
</html>