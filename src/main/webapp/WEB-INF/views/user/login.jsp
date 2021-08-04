<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포탈 로그인</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>


</script>
</head>
<body>
<c:if test="${empty login }">
	<form method="POST" action="loginCheck" id="loginForm">
		아이디 <input type="text" name="id"><br>
		비밀번호 <input type="password" name="pwd"><br>
		<input type="submit" value="로그인">
	</form>
	<form method="GET" action="findIndex">
		<input type="submit" value="아이디 찾기" id="btnId">
		<input type="hidden" value="id" name="id">
	</form>
	<form method="GET" action="findIndex">
		<input type="submit" value="비밀번호 찾기" id="btnPwd">
		<input type="hidden" value="pwd" name="pwd">
	</form>
</c:if>
<c:if test="${!empty login }">
	<form method="GET" action="logout">
		환영합니다.
		<input type="submit" value="로그아웃">
	</form>
</c:if>
</body>
</html>