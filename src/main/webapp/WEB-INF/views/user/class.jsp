<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<style>
body {
	font-family: 'NanumSquare', sans-serif !important;
}

.classInfo {
	width: 100%;
    text-align: center;
    height: 100px;
}

.class {
	width: 1120px;
	margin: auto;
	margin-top: 20px;
	margin-bottom: 20px;
	border: 1px solid #ccc;
	border-top: 3px solid #4e73df;
}

.intro {
	color: black;
	font-size: 20px;
	margin-right: 990px;
}

td {
	border-top: 1px solid #eaecf4;
}

.set1 {
	width: 80px;
	height: 50px;
	background-color: rgb(242, 246, 250);
}

.set2 {
	width: 200px;
	color: black;
}

.set3 {
	height: 180px;
	background-color: rgb(242, 246, 250);
}

.set4 {
	color: black;
}

.set5 {
	height: 50px;
	background-color: rgb(242, 246, 250);
}

.set6 {
	color: black;
}

#btn_open {
	margin-bottom: 20px;
	border-radius: 6px;
	border: 0;
    color: #fff;
    background-color: #4e73df;
}

#btn_open:hover {
	background-color: #224abe;
}
</style>
<body>
<jsp:include page="/WEB-INF/views/include/head.jsp"></jsp:include>
<input type="hidden" value="${userId }" id="userId">
<input type="hidden" value="${proId }" id="proId">
<input type="hidden" value="${cIdx }" id="cIdx">
<c:forEach var="cla" items="${classList }" varStatus="status">
<div class="classInfo">
	<span class="intro">강의정보</span>
	<button id="btn_open">메세지</button>
	<table class="class">
		<tr>
			<td class="set1">학년</td>
			<td class="set2">${cla.LEVELS }</td>
			<td class="set1">학기</td>
			<td class="set2">${cla.SEMESTER}</td>
			<td class="set1">수업</td>
			<td class="set2">${cla.TYPE }</td>
			<td class="set1">학점</td>
			<td class="set2">${cla.CLASS_CREDIT }</td>
		</tr>
		<tr>
			<td class="set3">강의명</td>
			<td class="set4">${cla.TITLE }</td>
			<td class="set3">강의내용</td>
			<td colspan=5 class="set4">${cla.CONTENT }</td>
		</tr>
		<tr>
			<td class="set5">시간</td>
			<td class="set6">${cla.TIME }</td>
			<td class="set5">최소정원</td>
			<td class="set6">${cla.L_CNT }</td>
			<td class="set5">최대정원</td>
			<td class="set6">${cla.F_CNT }</td>
			<td class="set5">담당교수</td>
			<td class="set6">${cla.NAME }</td>
		</tr>
	</table>	
</div>
</c:forEach>
</body>
<script>
window.onload = function () {
    //새창
    var proId = document.getElementById("proId").value;
    console.log("proId : " + proId);
    
    $("#btn_open").click(fopen);
    
    let opened_win_01 = null;
    function fopen(proId) {
    	 opened_win_01 = window.open("message?proId=${proId}", "Message", "width=400, height=500, toolbar=yes");
    }
}
</script>
</html>