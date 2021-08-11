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
<style>
#date {
	border: none;
	text-align: center;
	outline: none;
	width: 70px;
}
</style>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
function grade() {
	var id = document.getElementById("id").value;
	var type = document.getElementById("type").value;
	var date = document.getElementById("date").value;
	console.log("id : " + id);
	console.log("type : " + type);
	console.log("date : " + date);
	$.ajax({
		url : "grade",
		type : "POST",
		data : {
			id : id,
			type : type,
			date : date
		},
		dataType : "JSON",
		traditional : true,
		success : gradeList,
		error : function(error) {
			console.log("실패");
		}
	})
}

function gradeList(data) {
	var cv = "";
	console.log("성적 조회");
	$("#grade").empty();
	$.each(data, function(i, list) {
		console.log(data[i]);
		cv += data[i].USER_ID + "<br>"
		cv += data[i].SCORE + "<br>"
		cv += data[i].GRADE + "<br>"
		cv += data[i].YEAR_SEMESTER + "<br>"
		cv += data[i].CREDIT + "<br>"
		cv += "<hr>"
	})
	$("#grade").append(cv);
}
</script>
<body>
<input type="hidden" value="${id }" id="id">
<input type="hidden" value="${type }" id="type">
<input type="hidden" id="date" value="2021-1" readonly>
<p>성적페이지예요.</p>
<c:if test = "${type eq  1 }">
	<p>2021-1학기 성적 조회</p>
	<button onclick="grade();">조회</button>
	<div id="grade"></div>
</c:if>
<c:if test = "${type eq 2}">
	<p>전학기 성적 조회</p>
	<button onclick="grade();">조회</button>
	<div id="grade"></div>
</c:if>
</body>
</html>