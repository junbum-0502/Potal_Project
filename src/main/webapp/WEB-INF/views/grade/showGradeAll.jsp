<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/head.jsp" %>

<head>

</head>
<body>

	내가 수업하는 과목 리스트<br><br><hr>

	<c:forEach var="score" items="${gList }" varStatus="status">
		<a href="/potal/titleByGrade?pId=${score.USER_ID}&cIdx=${score.C_IDX}">과목명(과목번호) : ${score.TITLE}(<small>${score.C_IDX}</small>)<br></a>
		<hr>
	</c:forEach>
	

	

</body>
</html>