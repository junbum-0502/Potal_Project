<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/head.jsp" %>

<head>

	우리 과 학생 리스트<br><br><br>
	
	<c:forEach var="who" items="${uList }" varStatus="status">
	학생 이름<small>(학생 번호)</small> : <a href="/potal/studentInfoGradeAll?name=${who.NAME }&uId=${who.USER_ID}">${who.NAME }<small>(${who.USER_ID })</small></a><br>
	<hr>
	</c:forEach>

</head>
<body>

</body>
</html>