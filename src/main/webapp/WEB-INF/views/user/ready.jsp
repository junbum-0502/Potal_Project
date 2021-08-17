<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${empty login }">
	<form method="POST" action="login">
		<input type="submit" value="로그인">
	</form>
</c:if>
<c:if test="${!empty login }">
	<c:forEach var="login" items="${login }" varStatus="status">
		${login.name } 님 환영합니다.
	</c:forEach>
</c:if>
</body>
</html>