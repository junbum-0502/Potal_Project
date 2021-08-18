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
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<style>
body {
    font-family: 'NanumSquare', sans-serif !important;
}

.sch {
	width: 100%;
    text-align: center;
    height: 100px;
}

.setInfo {
	width: 1120px;
	margin: auto;
	margin-top: 20px;
	margin-bottom: 40px;
	border: 1px solid #ccc;
	border-top: 3px solid #4e73df;
}

.set1 {
	background-color: rgb(242, 246, 250);
	width: 150px;
    height: 70px;
}

.set2 {
	width: 409px;
}

.std {
	background-color: #ccc6;
    border: 1px solid #ccc;
    width: 150px;
    height: 35px;
    text-align: center;
}

.yas {
	width: 130px;
    height: 35px;
}

.intro1 {
	margin-right: 980px;
    font-size: 20px;
    color: black;
}

#intro2 {
    margin-right: 980px;
	font-size: 15px;
    color: black;
}

#schInfo {
	width: 1120px;
	margin: auto;
	border: 1px solid #ccc;
	border-top: 3px solid #4e73df;
}

.schTr {
	border-bottom: 1px solid #ccc
}

.schTr > td {
	width: 160px;
	height: 70px;
}

#check > td {
	height: 100px;
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

.result > td {
	height: 70px;
    color: black;
    border-bottom: 1px solid #ccc;
}
</style>
<body>
<jsp:include page="/WEB-INF/views/include/head.jsp"></jsp:include>
<div class="sch">
	<input type="hidden" id="count" value=${count }> <!-- 해당 유저 총 장학금 수 조회 -->
	<span class="intro1">장학금 조회</span>
	<button class="selectBtn" onclick="select();">조회</button>
	<table class="setInfo">
		<tr>
			<td class="set1">연도/학기</td>
			<td class="set2">
				<select class="yas" id="year">
					<option></option>
					<option>2021</option>
					<option>2020</option>
				</select>
				/
				<select class="yas" id="sem">
					<option>전체</option>
					<option>1</option>
					<option>2</option>
				</select>
			</td>
			<td class="set1">학번/성명</td>
			<td class="set2">
				<input type="text" class="std" id="id" value=${id } readonly>
				<input type="text" class="std" id="name" value=${name } readonly>
			</td>
		</tr>
	</table>
	<span id="intro2">
	</span>
	<table id="schInfo">
		<tr class="schTr">
			<td>수혜년도/학기</td>
			<td>수혜자학번</td>
			<td>수혜자성명</td>
			<td>수혜구분</td>
			<td>장학명</td>
			<td>장학금액</td>
			<td>상환여부</td>
		</tr>
		<tr id="check">
			<td colspan="7">
				조회 버튼을 클릭해주세요.
			</td>
		</tr>
	</table>
</div>
</body>
<script>
function select() {
	var id = document.getElementById("id").value;
	var name = document.getElementById("name").value;
	var target1 = document.getElementById("year");
	var target2 = document.getElementById("sem");
	var sValue1 = target1.options[target1.selectedIndex].value;
	var sValue2 = target2.options[target2.selectedIndex].value;
	var sValue = sValue1 + "-" + sValue2;
	if (sValue == "2020-전체" || sValue == "2021-전체") {
		alert("학기를 선택해주세요.");
		return false;
	} else {
		// 선택 연도/학기 장학금 조회
		$.ajax ({
			url : "sch",
			type : "POST",
			data : {
				id : id,
				name : name,
				sValue : sValue
			},
			dataType : "JSON",
			success : schList,
			error : function(error) {
				console.log("실패");
			}
		})
		// 장학금 수 조회
		$.ajax ({
			url : "schCount",
			type : "POST",
			data : {
				id : id,
				sValue : sValue
			},
			success : schCount,
			error : function(error) {
				console.log("실패");
			}
		})
	}
}

function schList(data) {
	var cv = "";
	var name = document.getElementById("name").value;
	var count = document.getElementById("count").value;
	$("#check").remove();
	console.log(data.length);
	for (var i=0; i<count; i++) {
		$("#result"+i).remove();
	}
	$.each(data, function(i, list) {
		cv += "<tr class='result' id='result" + i + "'>"
		cv += "<td>" + data[i].semester + "</td>"
		cv += "<td>" + data[i].userId + "</td>"
		cv += "<td>" + name + "</td>"
		cv += "<td>교내감면</td>"
		cv += "<td>" + data[i].name + "</td>"
		cv += "<td>" + data[i].amount + "</td>"
		cv += "<td>Y</td>"
		cv += "</tr>"
	})
	$("#schInfo").append(cv);
}

function schCount(data) {
	var cv = "";
	$("#intro2").empty();
	cv += data + "건이 조회되었습니다."
	$("#intro2").append(cv);
}
</script>
</html>