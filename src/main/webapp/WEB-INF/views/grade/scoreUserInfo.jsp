<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/head.jsp" %>

<head>

</head>
<body>

	학생 정보 페이지 <br><br><br>
	<c:forEach var="info" items="${uList }" varStatus="status">
		학생 이름 : ${info.NAME }<br>
		학생 학번 : ${info.USER_ID }<br>
		학생 번호 : ${info.PHONE }<br>
		학생 이메일 : ${info.EMAIL }<br>
	</c:forEach>
	<br>
	<c:forEach var="grade" items="${gList }" varStatus="status">
		학생 중간고사 성적 : ${grade.MID_SCORE }<br>
		학생 기말고사 성적 : ${grade.FINAL_SCORE }<br>
		학생 총합 성적  : ${grade.SCORE }<br>
		학생 학점 : ${grade.GRADE }<br>
		학생 학점 : ${grade.CREDIT }<br>
	</c:forEach>

</body>
</html>