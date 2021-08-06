<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/head.jsp" %>

<head>

</head>
<body>


	<c:forEach var="service" items="${sList}" varStatus="status">
		▶ ${service.INFO}  <button>신청 바로가기</button> <br><hr>
	</c:forEach>

</body>
</html>