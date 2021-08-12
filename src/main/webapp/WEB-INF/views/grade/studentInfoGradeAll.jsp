<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/head.jsp" %>

<head>


</head>
<body>

	해당 학생의 정보 및 전체 성적 조회<br><br><br>
	학생정보<hr>
	<c:forEach var="info" items="${uList }" varStatus="status">
	이름 : ${info.NAME }<br>
	학번 : ${info.USER_ID }<br>
	학생 번호 : ${info.PHONE }<br>
	학생 이메일 : ${info.EMAIL }<br>
	</c:forEach>
	<br>
	
	<br>학생성적<hr>
	<c:forEach var="grade" items="${gList }" varStatus="status">
	과목명<small>(과목번호)</small> : ${grade.TITLE}<small>(${grade.C_IDX})</small><br>
	학생 중간고사 성적 : ${grade.MID_SCORE }<br>
	학생 기말고사 성적 : ${grade.FINAL_SCORE }<br>
	학생 총합 성적  : ${grade.SCORE }<br>
	학생 학점 : ${grade.GRADE }<br>
	학생 학점 : ${grade.CREDIT }<br><br>
	</c:forEach>
	<br>
	
	<br>학생 수강 목록<hr>
 	<c:forEach var="sche" items="${sList }" varStatus="status">
	과목명 : ${sche.TITLE }<br>
	수업 시간 : ${sche.TIME }<br>
	담당 교수 : ${sche.P_NAME }<br>
	강의실 : ${sche.CLASSROOM }<br><br>
	</c:forEach>


</body>
</html>