<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- 	<form method="GET" action="rent">

		<c:forEach var="User" items="${login}" varStatus="status">
			
		<input type="hidden" value="${User.id}" name="idx" id="idx">
		</c:forEach>
	</form> --%>
	
	대출내역<br>
		<c:forEach var="rent" items="${rList}" varStatus="status">
			
			${rent}<br>
				
		</c:forEach>
</body>
</html>