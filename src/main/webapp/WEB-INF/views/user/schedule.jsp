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

.schedule {
    width: 1120px;
	margin: auto;
	margin-top: 20px;
	margin-bottom: 20px;
	border: 1px solid #ccc;
	border-top: 3px solid #4e73df;
}

.intro {
	font-size: 20px;
    color: black;
    margin-right: 1025px;
}

.dac {
	width: 90px;
	background-color: rgb(242, 246, 250);
}

.days {
	width: 150px;
	height: 80px;
	background-color: rgb(242, 246, 250);
}

.class > .period {
	background-color: rgb(242, 246, 250);
}

.class > td {
	height: 70px;
}

.day {
	font-size: 13px;
	color: black;
	border: 1px solid #ccc;
}

.a {
	text-decoration-line: none;
	color: black;
}

.a:hover {
	text-decoration-line: none;
	color:#00BFFF;
}
.a:active {
	color:#00BFFF;
}

</style>
<body>
<jsp:include page="/WEB-INF/views/include/head.jsp"></jsp:include>
<input type="hidden" value="${id }" id="id">
<div class="sch">
	<span class="intro">수업시간표</span>
	<table class="schedule">
		<tr>
			<td class="dac"></td>
			<td class="days">월</td>
			<td class="days">화</td>
			<td class="days">수</td>
			<td class="days">목</td>
			<td class="days">금</td>
		</tr>
		<tr class="class">
			<td class="period">
				1교시
				<small>(09:00~10:00)</small>
			</td>
			<td class="day" id="mon1"></td>
			<td class="day"  id="tue1"></td>
			<td class="day"  id="wed1"></td>
			<td class="day"  id="thu1"></td>
			<td class="day"  id="fri1"></td>
		</tr>
		<tr class="class">
			<td class="period">
				2교시
				<small>(10:00~11:00)</small>
			</td>
			<td class="day"  id="mon2"></td>
			<td class="day"  id="tue2"></td>
			<td class="day"  id="wed2"></td>
			<td class="day"  id="thu2"></td>
			<td class="day"  id="fri2"></td>
		</tr>
		<tr class="class">
			<td class="period">
				3교시
				<small>(11:00~12:00)</small>
			</td>
			<td class="day"  id="mon3"></td>
			<td class="day"  id="tue3"></td>
			<td class="day"  id="wed3"></td>
			<td class="day"  id="thu3"></td>
			<td class="day"  id="fri3"></td>
		</tr>
		<tr class="class">
			<td class="period">
				4교시
				<small>(12:00~13:00)</small>
			</td>
			<td class="day"  id="mon4"></td>
			<td class="day"  id="tue4"></td>
			<td class="day"  id="wed4"></td>
			<td class="day"  id="thu4"></td>
			<td class="day"  id="fri4"></td>
		</tr>
		<tr class="class">
			<td class="period">
				5교시
				<small>(13:00~14:00)</small>
			</td>
			<td class="day"  id="mon5"></td>
			<td class="day"  id="tue5"></td>
			<td class="day"  id="wed5"></td>
			<td class="day"  id="thu5"></td>
			<td class="day"  id="fri5"></td>
		</tr>
		<tr class="class">
			<td class="period">
				6교시
				<small>(14:00~15:00)</small>
			</td>
			<td class="day"  id="mon6"></td>
			<td class="day"  id="tue6"></td>
			<td class="day"  id="wed6"></td>
			<td class="day"  id="thu6"></td>
			<td class="day"  id="fri6"></td>
		</tr>
		<tr class="class">
			<td class="period">
				7교시
				<small>(15:00~16:00)</small>
			</td>
			<td class="day"  id="mon7"></td>
			<td class="day"  id="tue7"></td>
			<td class="day"  id="wed7"></td>
			<td class="day"  id="thu7"></td>
			<td class="day"  id="fri7"></td>
		</tr>
		<tr class="class">
			<td class="period">
				8교시
				<small>(16:00~17:00)</small>
			</td>
			<td class="day"  id="mon8"></td>
			<td class="day"  id="tue8"></td>
			<td class="day"  id="wed8"></td>
			<td class="day"  id="thu8"></td>
			<td class="day"  id="fri8"></td>
		</tr>
		<tr class="class">
			<td class="period">
				9교시
				<small>(17:00~18:00)</small>
			</td>
			<td class="day"  id="mon9"></td>
			<td class="day"  id="tue9"></td>
			<td class="day"  id="wed9"></td>
			<td class="day"  id="thu9"></td>
			<td class="day"  id="fri9"></td>
		</tr>
		<tr class="class">
			<td class="period">
				10교시
				<small>(18:00~19:00)</small>
			</td>
			<td class="day"  id="mon10"></td>
			<td class="day"  id="tue10"></td>
			<td class="day"  id="wed10"></td>
			<td class="day"  id="thu10"></td>
			<td class="day"  id="fri10"></td>
		</tr>
	</table>
</div>
</body>
<script>
window.onload = function() {
	var cv = "";
	var id = document.getElementById("id").value;
	$.ajax({
		url : "schedule",
		type : "POST",
		data : {
			id : id
		},
		dataType : "JSON",
		success : function(data) {
			console.log("성공");
			$.each(data, function(i, list) {
				if (data[i].TIME == "월") {
					console.log("월");
					console.log("시작 : " + data[i].S_TIME);
					console.log("길이 : " + data[i].LENGTH);
					var leng = data[i].S_TIME + data[i].LENGTH - 1;
					cv += "<a class='a' href='<%=request.getContextPath()%>/potal/class?userId=${id}&proId=" + data[i].PRO_ID + "&cIdx=" + data[i].C_IDX + "'>" + data[i].TITLE + "</a>";
					cv += "<br>";
					cv += data[i].P_NAME;
					cv += "<br>";
					cv += data[i].CLASSROOM;
					for (var i=data[i].S_TIME; i<=leng; i++) {
						$("#mon" + i).append(cv);
					}
					cv = "";
				} else if (data[i].TIME == "화") {
					console.log("화");
					console.log("시작 : " + data[i].S_TIME);
					console.log("길이 : " + data[i].LENGTH);
					var leng = data[i].S_TIME + data[i].LENGTH - 1;
					cv += data[i].TITLE;
					cv += "<br>";
					cv += data[i].P_NAME;
					cv += "<br>";
					cv += data[i].CLASSROOM;
					for (var i=data[i].S_TIME; i<=leng; i++) {
						$("#tue" + i).append(cv);
					}
					cv = "";
				} else if (data[i].TIME == "수") {
					console.log("수");
					console.log("시작 : " + data[i].S_TIME);
					console.log("길이 : " + data[i].LENGTH);
					var leng = data[i].S_TIME + data[i].LENGTH - 1;
					cv += data[i].TITLE;
					cv += "<br>";
					cv += data[i].P_NAME;
					cv += "<br>";
					cv += data[i].CLASSROOM;
					for (var i=data[i].S_TIME; i<=leng; i++) {
						$("#wed" + i).append(cv);
					}
					cv = "";
				} else if (data[i].TIME == "목") {
					console.log("목");
					console.log("시작 : " + data[i].S_TIME);
					console.log("길이 : " + data[i].LENGTH);
					var leng = data[i].S_TIME + data[i].LENGTH - 1;
					cv += data[i].TITLE;
					cv += "<br>";
					cv += data[i].P_NAME;
					cv += "<br>";
					cv += data[i].CLASSROOM;
					for (var i=data[i].S_TIME; i<=leng; i++) {
						$("#thu" + i).append(cv);
					}
					cv = "";
				} else if (data[i].TIME == "금") {
					console.log("금");
					console.log("시작 : " + data[i].S_TIME);
					console.log("길이 : " + data[i].LENGTH);
					var leng = data[i].S_TIME + data[i].LENGTH - 1;
					cv += data[i].TITLE;
					cv += "<br>";
					cv += data[i].P_NAME;
					cv += "<br>";
					cv += data[i].CLASSROOM;
					for (var i=data[i].S_TIME; i<=leng; i++) {
						$("#fri" + i).append(cv);
					}
					cv = "";
				}
			});
		},
		error : function(error) {
			console.log("실패");
		}
	})

}
</script>
</html>