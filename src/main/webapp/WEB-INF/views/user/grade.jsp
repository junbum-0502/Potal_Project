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
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
<style>
body {
	font-family: 'NanumSquare', sans-serif !important;
}

.gra {
	width: 100%;
    text-align: center;
    height: 100px;
}
#date {
	border: none;
	text-align: center;
	outline: none;
	width: 70px;
}

.intro1 {
	font-size: 20px;
    color: black;
    margin-right: 1005px;
}

.setInfo {
	width: 1120px;
	margin: auto;
	margin-top: 20px;
	margin-bottom: 20px;
	border: 1px solid #ccc;
	border-top: 3px solid #4e73df;
}

.set1 {
	height: 50px;
    width: 100px;
    background-color: rgb(242, 246, 250);
}

.set2 {
	height: 50px;
	width: 150px;
	color: black;
}

.tr1 {
	border-bottom: 1px solid #ccc;
}

.intro2 {
	font-size: 20px;
    color: black;
    margin-right: 1045px;
}

.setSum {
	width: 1120px;
	margin: auto;
	margin-top: 20px;
	margin-bottom: 20px;
	border: 1px solid #ccc;
	border-top: 3px solid #4e73df;
}

.set3 {
	height: 50px;
	width: 100px;
	background-color: rgb(242, 246, 250);
}

.set4 {
	height:50px;
	width: 300px;
	color: black;
}

.tr2 {
	border-bottom: 1px solid #ccc;
}

.selectBtn {
	border-radius: 6px;
	border: 0;
    color: #fff;
    background-color: #4e73df;
}

.selectBtn:hover {
	background-color: #224abe;
}

.intro3 {
	font-size: 20px;
    color: black;
    margin-right: 1015px;
}

#classInfo {
	width: 1120px;
	margin: auto;
	margin-top: 20px;
	margin-bottom: 20px;
	border: 1px solid #ccc;
	border-top: 3px solid #4e73df;
}

.tr3 > td {
	width: 150px;
	height: 50px;
}

#result {
	height: 50px;
}

#result > td {
	border-top: 1px solid #ccc;
	color: black;
}
</style>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<body>
<jsp:include page="/WEB-INF/views/include/head.jsp"></jsp:include>
<c:forEach var="info" items="${login }" varStatus="status">
	<div class="gra">
		<input type="hidden" value="${id }" id="id">
		<input type="hidden" value="${type }" id="type">
		<input type="hidden" id="date" value="2021-1">
		<input type="hidden" id="semester" value=${info.semester }> <!-- ?????? -->
		<input type="hidden" value="${info.mIdx }" id="tuition"> <!-- ???????????? -->
		<span class="intro1">????????????</span>
		<button class="selectBtn" onclick="grade();">??????</button>
		<table class="setInfo">
			<tr class="tr1">
				<td class="set1">??????</td>
				<td class="set2">${info.userId }</td>
				<td class="set1">??????</td>
				<td class="set2">${info.name }</td>
				<td class="set1">??????</td>
				<td class="set2" id="grade"></td>
				<td class="set1">??????</td>
				<td class="set2">??????</td>
				<td class="set1">????????????</td>
				<td class="set2">
					<c:if test="${info.isLeave eq 0 }">
						??????
					</c:if>
					<c:if test="${info.isLeave eq 1 }">
						??????
					</c:if>
				</td>
			<tr>
			<tr>
				<td class="set1">??????(???)</td>
				<td class="set2">??????</td>
				<td class="set1">??????</td>
				<td class="set2">-</td>
				<td class="set1">????????????</td>
				<td class="set2" id="major"></td>
				<td class="set1">??????</td>
				<td class="set2">-</td>
				<td class="set1">????????????</td>
				<td class="set2">?????????</td>
			</tr>
		</table>
		<span class="intro2">????????????</span>
		<table class="setSum">
			<tr class="tr2">
				<td class="set3">??? ????????????</td>
				<td class="set4" id="allC1">-</td>
				<td class="set3">??? ????????????</td>
				<td class="set4" id="allC2">-</td>
				<td class="set3">????????????</td>
				<td class="set4" id="avgC1">-</td>
			<tr>
			<tr>
				<td class="set3">????????????</td>
				<td class="set4" id="credit">-</td>
				<td class="set3">??? ????????????</td>
				<td class="set4" id="avgC2">-</td>
				<td class="set3">??????</td>
				<td class="set4" id="sem">-</td>
			</tr>
		</table>
		<span class="intro3">??????????????????</span>
		<table id="classInfo">
			<tr class="tr3">
				<td>??????/??????</td>
				<td>????????????</td>
				<td>???????????????</td>
				<td>????????????</td>
				<td>??????</td>
				<td>??????</td>
				<td>??????</td>
			</tr>
		</table>
	</div>
</c:forEach>
</body>
<script>
window.onload = function() {
	// ??????
	var cv = "";
	var semester = document.getElementById("semester").value; // ??????
	var tuition = document.getElementById("tuition").value; // ??????
	cv += Math.ceil(semester/2) + "??????";
	$("#grade").append(cv);
	// ?????? 
    $.ajax({
    	url : "major",
    	type : "POST",
    	data : {
    		tuition : tuition
    	},
    	success : info_major,
    	error : function(error) {
    		console.log("??????");
    	}
    })
}

function info_major(data) {
	var cv = "";
	console.log(data);
	$.each(data, function(i, list) {
		cv += data[i].NAME
	})
	$("#major").append(cv);
}

function grade() {
	var id = document.getElementById("id").value;
	var type = document.getElementById("type").value;
	var date = document.getElementById("date").value;
	var semester = document.getElementById("semester").value; // ??????
	// ??????
	var cv1 = "";
	cv1 += semester + "/8??????";
	$("#sem").empty();
	$("#sem").append(cv1);
	// ????????????
	var cv2 = ""; // ????????????, ????????????
	var cv3 = ""; // ????????????
	var cv4 = ""; // ????????????
	$("#allC1").empty(); // ????????????
	$("#allC2").empty(); // ????????????
	$("#credit").empty(); // ????????????
	$("#avgC1").empty(); // ????????????, ??????
	$("#avgC2").empty(); // ????????????
	$.ajax({
		url : "gradeInfo",
		type : "POST",
		data : {
			id : id
		},
		dataType : "JSON",
		success : function(data) {
			$.each(data, function(i, list) {
				cv2 += data[i].CLASS_CREDIT
				cv3 += data[i].CREDIT
				cv4 += data[i].SCORE
			})
			$("#allC1").append(cv2); // ????????????
			$("#allC2").append(cv2); // ????????????
			$("#credit").append(cv3); // ????????????
			$("#avgC1").append(cv4); // ????????????, ??????
			$("#avgC2").append(cv4); // ????????????
		}, 
		error : function(error) {
			console.log("??????");
		}
	})
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
			console.log("??????");
		}
	})
}

function gradeList(data) {
	var cv = "";
	console.log("?????? ??????");
	$("#result").remove();
	$.each(data, function(i, list) {
		cv += "<tr id='result'>"
		cv += "<td>" + data[i].YEAR_SEMESTER + "</td>"
		cv += "<td>" + data[i].TYPE + "</td>"
		cv += "<td>" + data[i].C_IDX + "</td>"
		cv += "<td>" + data[i].TITLE + "</td>"
		cv += "<td>" + data[i].CLASS_CREDIT + "</td>"
		cv += "<td>" + data[i].SCORE + "</td>"
		cv += "<td>" + data[i].GRADE + "</td>"
		cv += "<tr>"
	})
	$("#classInfo").append(cv);
	
}
</script>
</html>