<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/head.jsp" %>

<head>

		
</head>
<body>

		<br><br>성적조회 / 입력 페이지<br><br><hr>

		<c:forEach var="score" items="${sList }" varStatus="status">
			과목명<small>(과목번호)</small> : ${score.TITLE }<small>(${score.C_IDX})</small><br>
			학생 이름 : <a href="/potal/scoreUserInfo?name=${score.S_NAME }&cIdx=${score.C_IDX}">${score.S_NAME }<small>(${score.USER_ID})</small></a><br>
			<a href="/potal/putScore?name=${score.S_NAME }&cIdx=${score.C_IDX}&pid=${score.PRO_ID}&userId=${score.USER_ID}">성적 입력하기</a><br>
			<hr>
		</c:forEach>
<%-- 	<c:forEach var="info" items="${aList }" varStatus="status">
		학생 중간점수 / 기말점수 : ${info.MID_SCORE } / ${info.FINAL_SCORE }<br>
		학생 총합점수 : ${info.SCORE }<br>
		학생 학점 : ${info.GRADE }<br>
	</c:forEach> --%>

</body>
</html>