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

.select {
	width: 100%;
    text-align: center;
    height: 100px;
}

.smsSelect {
	margin: auto;
	border: 1px solid #ccc;
	border-top: 3px solid #4e73df;
}

.set1 {
	background-color: rgb(242, 246, 250);
    width: 230px;
}

.set2 {
	width: 330px;
	height: 100px;
}

select {
	width: 200px;
    height: 40px;
}

.selectBtn {
	margin-bottom: 20px;
}

.intro1 {
	margin-right: 975px;
	color: black;
    font-size: 20px;
}

.intro2 {
	margin-right: 1040px;
	color: black;
    font-size: 20px;
}

.std {
	width: 1121px;
	margin: auto;
	border: 1px solid #ccc;
	border-top: 3px solid #4e73df;
	margin-top: 20px;
	margin-bottom: 20px;
}

.set3 {
	width: 140px;
	height: 80px;
	background-color: rgb(242, 246, 250);
}

.set4 {
	width: 140px;
	height: 80px;
	color: black;
}

td {
	border-bottom: 1px solid #ccc;
}

.intro3 {
	margin-right: 1025px;
	color: black;
    font-size: 20px;
}

.tuiInfo {
	width: 1121px;
    margin: auto;
    border: 1px solid #ccc;
    border-top: 3px solid #4e73df;
    margin-top: 20px;
}

.set5 {
	width: 186px;
	height: 80px;
	background-color: rgb(242, 246, 250);
}

.set6 {
	height: 80px;
	color: black;
}
</style>
<body>
<jsp:include page="/WEB-INF/views/include/head.jsp"></jsp:include>
<c:forEach var="info" items="${login }" varStatus="status">
	<div id="info">
	</div>
	<input type="hidden" value="${info.mIdx }" id="tuition"> <!-- 학과번호 -->
	<input type="hidden" value="${info.semester }" id="semester"> <!-- 학기 -->
	<div class="select">
		<span class="intro1">등록금 조회</span>
		<button class="selectBtn" onclick="select();">조회</button>
		<table class="smsSelect">
			<tr>
				<td class="set1">학년</td>
				<td class="set2">
					<select id="select1">
						<option value="0">선택</option>
						<option value="2021">2021</option>
						<option value="2020">2020</option>
					</select>
				</td>
				<td class="set1">학기</td>
				<td class="set2">
					<select id="select2">
						<option value="0">선택</option>
						<option value="1">1</option>
						<option value="2">2</option>
					</select>
				</td>
			</tr>
		</table><br>
		<span class="intro2">학생정보</span>
		<table class="std">
			<tr>
				<td class="set3">학번</td>
				<td class="set4"><span id="stdInfo1" style="display: none;">${info.userId }</span></td>
				<td class="set3">성명</td>
				<td class="set4"><span id="stdInfo2" style="display: none;">${info.name }</span></td>
				<td class="set3">학년</td>
				<td class="set4"><span id="stdSem"></span></td>
				<td class="set3">소속</td>
				<td class="set4"><span id="stdMajor" style="display: none;"></span></td>
			</tr>
			<tr>
				<td class="set3">학적상태</td>
				<td class="set4">
					<c:if test="${info.isLeave eq 0 }">
						<span id="stdInfo3" style="display: none;">재학</span>
					</c:if>
					<c:if test="${info.isLeave eq 1 }">
						<span id="stdInfo3" style="display: none;">휴학</span>
					</c:if>
				</td>
				<td class="set3">장학금대상</td>
				<td class="set4">
						<span id="info2" style="display: none;"></span>
				</td>
				<td class="set3">학자금대상</td>
				<td class="set4"><span id="stdInfo4" style="display: none;">N</span></td>
				<td class="set3">구분</td>
				<td class="set4"><span id="stdInfo5" style="display: none;">학기제</span></td>
			</tr>
		</table>
		<span class="intro3">등록금 내역</span>
		<table class="tuiInfo">
			<tr>
				<td class="set5">입학금</td>
				<td class="set5">수업료</td>
				<td class="set5">장학금</td>
				<td class="set5">고지액</td>
				<td class="set5">환불액</td>
				<td class="set5">납입액</td>
			</tr>
			<tr>
				<td class="set6">ㅇㅇ</td>
				<td class="set6">ㅇㅇ</td>
				<td class="set6">ㅇㅇ</td>
				<td class="set6">ㅇㅇ</td>
				<td class="set6">ㅇㅇ</td>
				<td class="set6">ㅇㅇ</td>
			</tr>
		</table>
	</div>
</c:forEach>

</body>
<script>
	window.onload = function() {
        // 등록금 조회
        var tuition = document.getElementById("tuition").value;
        console.log(tuition);
        $.ajax({
        	url : "tuition",
        	type : "POST",
        	data : {
        		tuition : tuition
        	},
        	success : info_tuition,
        	error : function(error) {
        		console.log("실패");
        	}
        })
        // 학과 조회
        $.ajax({
        	url : "major",
        	type : "POST",
        	data : {
        		tuition : tuition
        	},
        	success : info_major,
        	error : function(error) {
        		console.log("실패");
        	}
        })
	}
	
    function info_tuition(data) {
    	var cv = "";
    	console.log("등록금 조회");
    	$.each(data, function(i, list) {
    		console.log(data[i].TUITION);
    		cv += "<p>등록금 : " + data[i].TUITION + " 원</p>"
    	})
    	$("#info").append(cv);
    }
    
    function info_major(data) {
    	var cv2 = "";
    	console.log("학과 조회");
    	$.each(data, function(i, list) {
    		console.log(data[i].NAME);
    		cv2 += data[i].NAME
    	})
    	$("#stdMajor").append(cv2);
    }
    
    function select() {
    	// 학년
    	var cv1 = "";
    	var semester = document.getElementById("semester").value;
    	cv1 += Math.ceil(semester/2) + "학년";
    	$("#stdSem").empty(); // 학년 지우기
    	$("#stdSem").append(cv1); // 학년
    	document.getElementById("stdInfo1").style.display = "block"; // 학번
    	document.getElementById("stdInfo2").style.display = "block"; // 이름
    	document.getElementById("stdMajor").style.display = "block"; // 학과
    	document.getElementById("info2").style.display = "block"; // 장학금
    	document.getElementById("stdInfo3").style.display = "block"; // 재학 여부
    	document.getElementById("stdInfo4").style.display = "block"; // 학자금 대상
    	document.getElementById("stdInfo5").style.display = "block"; // 학기제 구분
    	var target1 = document.getElementById("select1");
    	var target2 = document.getElementById("select2");
    	var sValue1 = target1.options[target1.selectedIndex].value;
    	var sValue2 = target2.options[target2.selectedIndex].value;
    	var sValue = sValue1 + "-" + sValue2;
    	if (sValue1 == 0 || sValue2 == 0) {
    		alert("학년, 학기를 선택해주세요")
    	} else {
    		console.log(sValue);
    		$.ajax({
    			url : "semesterScholar",
    			type : "POST",
    			data : {
    				sValue : sValue
    			},
    			success : selectScholar,
    			error : function(error) {
    				console.log("실패");
    			}
    		})
    	}
    }
    
    function selectScholar(data) {
    	var cv = "";
    	var cv3 = "";
    	$("#info").empty();
    	$("#info2").empty();
    	console.log("장학금 학기별 조회");
    	console.log("data : " + data);
    	if (data != "") {
	    	$.each(data, function(i, list) {
	    		console.log(data);
	    		console.log(data[i].amount);
	    		cv += "<p>장학금 : " + data[i].amount + " 원</p>"
	    		cv3 += "Y";
	    	})
	    	$("#info").append(cv);
	    	$("#info2").append(cv3);
    	} else if (data == "") {
    		cv3 += "N";
    		$("#info2").append(cv3);
    	}
    }
</script>
</html>