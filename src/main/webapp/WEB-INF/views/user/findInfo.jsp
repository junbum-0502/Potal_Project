<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<style>
	#result {
		color : blue;
	}
</style>
</head>
<body>
	아이디, 비밀번호 찾기~ <br>
	<!-- 아이디 찾기 -->
	<c:if test="${empty pwd }"> 
		이름 <input type="text" id="name">
		생년월일 <input type="text" id="birth">
		<button onclick="findId()">찾기</button>
	</c:if>
	<!-- 비밀번호 찾기 -->
	<c:if test="${empty id }">
		학번 <input type="text" id="id">
		이름 <input type="text" id="name">
		핸드폰 번호 <input type="text" id="phone">
		<button onclick="findPwd()">찾기</button>
	</c:if>
	<div id="info">
	</div>
</body>
<script>
function findId() { // 아이디, 비밀번호 찾기
	var name = document.getElementById("name").value;
	var birth = document.getElementById("birth").value;
	$.ajax({
		url : "findInfo",
		type : "POST",
		data : {
			name : name,
			birth : birth
		},
		dataType : "JSON",
		success : id,
		error : function(error) {
			console.log("실패");
		}
	})
}

function findPwd() {
	var id = document.getElementById("id").value;
	var name = document.getElementById("name").value;
	var phone = document.getElementById("phone").value;
	$.ajax({
		url : "findInfo",
		type : "POST",
		data : {
			id : id,
			name : name,
			phone : phone
		},
		dataType : "JSON",
		success : pwd,
		error : function(error) {
			console.log("실패");
		}
	})
}

function id(data) {
	var cv = "";
	$("#result").remove();
	console.log("아이디 찾기 ajax 성공");
	console.log("data : " + data);
	$.each(data, function(i, list) {
		cv += "<p id='result'>아이디는 " + data[i].userId + " 입니다.</p>"
	})
	$("#info").append(cv);
}

function pwd(data) {
	var cv = "";
	$("#result").remove();
	console.log("비밀번호 찾기 ajax 성공");
	console.log("data : " + data);
	$.each(data, function(i, list) {
		cv += "<p id='result'>비밀번호는 " + data[i].password + " 입니다.</p>"
	})
	$("#info").append(cv);
}
</script>
</html>