<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/head.jsp" %>

<head>

		
</head>
<body>

	<br><br>성적조회 / 수정 페이지<br><br><hr>
	
		<c:forEach var="score" items="${sList }" varStatus="status">
			과목명<small>(과목번호)</small> : ${score.TITLE }<small>(${score.C_IDX})</small><br>
			학생 이름 : <a href="/potal/scoreUserInfo?name=${score.S_NAME }&cIdx=${score.C_IDX}">${score.S_NAME }<small>(${score.USER_ID})</small></a><br>
			<a href="/potal/putScoreUpdate?name=${score.S_NAME }&cIdx=${score.C_IDX}&pid=${score.PRO_ID}&userId=${score.USER_ID}">성적 수정하기</a><br>
			<hr>
		</c:forEach>

<%-- 		<form method="POST" id="nameForm" action="/potal/putScoreUpdate">
		<c:forEach var="score" items="${sList }" varStatus="status">
			과목명<small>(과목번호)</small> : ${score.TITLE }<small>(${score.C_IDX})</small><br>
			학생 이름 : ${score.S_NAME }<small>(${score.USER_ID})</small><br>
			<a href="/potal/putScoreUpdate?name=${score.S_NAME }&cIdx=${score.C_IDX}&pid=${score.PRO_ID}&userId=${score.USER_ID}">성적 수정하기</a><br>
			<a onclick="sub()">성적 수정하기</a><br>
			<hr>
		</c:forEach>
		<input type="hidden" value="${sList.S_NAME}" id="name" name="name">
		<input type="hidden" value="${sList.C_IDX}" id="cIdx" name="cIdx">
		<input type="hidden" value="${sList.PRO_ID}" id="pid" name="pid">
		<input type="hidden" value="${sList.USER_ID}" id="userId" name="userId">
		<input type="hidden" value="${sList.S_NAME}" id="name" name="name">
		</form> --%>

</body>

<script>

		function sub(){
			
			scoreForm.submit();
		}

</script>

</html>