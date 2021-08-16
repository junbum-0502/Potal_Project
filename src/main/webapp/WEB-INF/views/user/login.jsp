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
<style>
.login {
	width: auto;
	text-align: center;
    margin-top: 300px;
}

.logo {
	width: 250px;
    margin-bottom: 20px;
}

input[type="text"] {
	height: 40px;	
	width: 300px;
	margin-bottom: 10px;
	border-radius: 5px;
}

input[type="password"] {
	height: 40px;	
	width: 300px;
	margin-bottom: 10px;
	border-radius: 5px;
}

.loginBtn {
	border-radius: 6px;
	border: 0;
    height: 35px;
    width: 308px;
    color: #fff;
    background-color: #4e73df;
    margin-bottom: 10px;
}

.loginBtn:hover {
	background-color: #224abe;
}

.findForm {
	width: 300px;
    margin: auto;
}

.findBtn {
	border: 0;
	background-color: white;
	width: auto;
}

.findBtn:hover {
	color: #00BFFF;
}

#btnId {
	float: right;
	padding-right: 0;
}

</style>
</head>
<body>
<c:if test="${empty login }">
	<div class="login">
		<a href="<%=request.getContextPath()%>/potal"><input type="image" src="<%=request.getContextPath()%>/resources/img/logo1.PNG" class="logo"></a>
		<form method="POST" action="loginCheck" id="loginForm">
			<input type="text" name="id" placeholder="아이디를 입력해주세요."><br>
			<input type="password" name="pwd" placeholder="비밀번호를 입력해주세요."><br>
			<input type="submit" value="로그인" class="loginBtn">
		</form>
		<form method="GET" action="findIndex" class="findForm">
			<input type="submit" value="아이디, 비밀번호 찾기" id="btnId" class="findBtn">
			<input type="hidden" value="id" name="id">
		</form>
	</div>
</c:if>
<c:if test="${!empty login }">
	<form method="GET" action="logout">
		환영합니다.
		<input type="submit" value="로그아웃">
	</form>
</c:if>
</body>
</html>