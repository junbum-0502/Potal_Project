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
	border-radius: 6px;
	border: 0;
    color: #fff;
    background-color: #4e73df;
}

.selectBtn:hover {
	background-color: #224abe;
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

.intro4 {
	margin-right: 980px;
	color: black;
    font-size: 20px;
}

.selectIntro {
	width: 1121px;
	margin: auto;
	border: 1px solid #ccc;
	border-top: 3px solid #4e73df;
	margin-top: 20px;
	margin-bottom: 20px;
}

.how1 {
	border-bottom: none;
	float: left;
	color: black;
}

.how2 {
	border-bottom: none;
	float: left;
	color: black;
}
</style>
<body>
<jsp:include page="/WEB-INF/views/include/head.jsp"></jsp:include>
<c:forEach var="info" items="${login }" varStatus="status">
	<div id="info">
	</div>
	<input type="hidden" value="${info.userId }" id="id"> <!-- ????????? -->
	<input type="hidden" value="${info.mIdx }" id="tuition"> <!-- ???????????? -->
	<input type="hidden" value="${info.semester }" id="semester"> <!-- ?????? -->
	<div class="select">
		<span class="intro1">????????? ??????</span>
		<button class="selectBtn" onclick="select();">??????</button>
		<table class="smsSelect">
			<tr>
				<td class="set1">??????</td>
				<td class="set2">
					<select id="select1">
						<option value="0">??????</option>
						<option value="2021">2021</option>
						<option value="2020">2020</option>
					</select>
				</td>
				<td class="set1">??????</td>
				<td class="set2">
					<select id="select2">
						<option value="0">??????</option>
						<option value="1">1</option>
						<option value="2">2</option>
					</select>
				</td>
			</tr>
		</table><br>
		<span class="intro4">????????? ?????? ??????</span>
		<table class="selectIntro">
			<tr>
				<td class="how1">
					1. ??????, ????????? ???????????????.
				</td>
			</tr>
			<tr>
				<td class="how2">
					2. ????????? ???????????? ??????????????? ???????????????.
				</td>
			</tr>
		</table>
		<span class="intro2">????????????</span>
		<table class="std">
			<tr>
				<td class="set3">??????</td>
				<td class="set4"><span id="stdInfo1" style="display: none;">${info.userId }</span></td>
				<td class="set3">??????</td>
				<td class="set4"><span id="stdInfo2" style="display: none;">${info.name }</span></td>
				<td class="set3">??????</td>
				<td class="set4"><span id="stdSem"></span></td>
				<td class="set3">??????</td>
				<td class="set4"><span id="stdMajor" style="display: none;"></span></td>
			</tr>
			<tr>
				<td class="set3">????????????</td>
				<td class="set4">
					<c:if test="${info.isLeave eq 0 }">
						<span id="stdInfo3" style="display: none;">??????</span>
					</c:if>
					<c:if test="${info.isLeave eq 1 }">
						<span id="stdInfo3" style="display: none;">??????</span>
					</c:if>
				</td>
				<td class="set3">???????????????</td>
				<td class="set4">
						<span id="info2" style="display: none;"></span>
				</td>
				<td class="set3">???????????????</td>
				<td class="set4"><span id="stdInfo4" style="display: none;">N</span></td>
				<td class="set3">??????</td>
				<td class="set4"><span id="stdInfo5" style="display: none;">?????????</span></td>
			</tr>
		</table>
		<span class="intro3">????????? ??????</span>
		<table class="tuiInfo">
			<tr>
				<td class="set5">?????????</td>
				<td class="set5">?????????</td>
				<td class="set5">?????????</td>
				<td class="set5">?????????</td>
				<td class="set5">?????????</td>
				<td class="set5">?????????</td>
			</tr>
			<tr>
				<td class="set6"><span id="info3" style="display: none;"></span></td>
				<td class="set6"><span id="info4" style="display: none;"></span></td>
				<td class="set6"><span id="info5" style="display: none;"></span></td>
				<td class="set6"><span id="stdInfo6" style="display: none;"></span></td>
				<td class="set6"><span id="stdInfo7" style="display: none;">0</span></td>
				<td class="set6"><span id="stdInfo8" style="display: none;">0</span></td>
			</tr>
		</table>
	</div>
</c:forEach>

</body>
<script>
	
	window.onload = function() {
        // ????????? ??????
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
        		console.log("??????");
        	}
        })
        // ?????? ??????
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
	
    function info_tuition(data) {
    	var cv = "";
    	var cv1 = "";
    	var cv2 = "";
    	var semester = document.getElementById("semester").value;
    	console.log("????????? ??????");
    	if (semester == 1) {
	    	$.each(data, function(i, list) {
	    		console.log(data[i].TUITION);
	    		cv += data[i].TUITION
	    	})
	    	$("#info3").append(cv);
    	} else if (semester != 1) {
    		cv1 += "0"
    		$("#info3").append(cv1);
    		$.each(data, function(i, list) {
	    		console.log(data[i].TUITION);
	    		cv2 += data[i].TUITION
	    	})
	    	$("#info4").append(cv2);
    	}
    }
    
    function info_major(data) {
    	var cv2 = "";
    	console.log("?????? ??????");
    	$.each(data, function(i, list) {
    		console.log(data[i].NAME);
    		cv2 += data[i].NAME
    	})
    	$("#stdMajor").append(cv2);
    }
    
    function select() {

    	// ??????
    	var cv1 = "";
    	var semester = document.getElementById("semester").value;
    	cv1 += Math.ceil(semester/2) + "??????";
    	$("#stdSem").empty(); // ?????? ?????????
    	$("#info5").empty(); // ????????? ?????????
    	$("#stdInfo6").empty(); // ????????? ?????????
    	// $("#stdInfo1").empty(); // ?????? ?????????
    	// $("#stdInfo2").empty(); // ?????? ?????????
    	// $("#stdInfo3").empty(); // ?????? ?????? ?????????
    	// $("#stdInfo4").empty(); // ????????? ?????? ?????????
    	// $("#stdInfo5").empty(); // ????????? ?????? ?????????
    	// $("#stdMajor").empty(); // ?????? ?????????
    	// $("#info2").empty(); // ????????? ?????????
    	$("#stdSem").append(cv1); // ??????
    	document.getElementById("stdInfo1").style.display = "block"; // ??????
    	document.getElementById("stdInfo2").style.display = "block"; // ??????
    	document.getElementById("stdMajor").style.display = "block"; // ??????
    	document.getElementById("info2").style.display = "block"; // ?????????
    	document.getElementById("stdInfo3").style.display = "block"; // ?????? ??????
    	document.getElementById("stdInfo4").style.display = "block"; // ????????? ??????
    	document.getElementById("stdInfo5").style.display = "block"; // ????????? ??????
    	document.getElementById("info3").style.display = "block"; // ?????????
    	document.getElementById("info4").style.display = "block"; // ?????????
    	document.getElementById("info5").style.display = "block"; // ?????????
    	document.getElementById("stdInfo6").style.display = "block"; // ?????????
    	document.getElementById("stdInfo7").style.display = "block"; // ?????????
    	document.getElementById("stdInfo8").style.display = "block"; // ?????????
    	var target1 = document.getElementById("select1");
    	var target2 = document.getElementById("select2");
    	var sValue1 = target1.options[target1.selectedIndex].value;
    	var sValue2 = target2.options[target2.selectedIndex].value;
    	var sValue = sValue1 + "-" + sValue2;
    	var id = document.getElementById("id").value;
    	if (sValue1 == 0 || sValue2 == 0) {
    		alert("??????, ????????? ??????????????????")
    	} else {
    		console.log(sValue);
    		$.ajax({
    			url : "semesterScholar",
    			type : "POST",
    			data : {
    				id : id,
    				sValue : sValue
    			},
    			success : selectScholar,
    			error : function(error) {
    				console.log("??????");
    			}
    		})
    	}
    }
    
    function selectScholar(data) {
    	var cv = "";
    	var cv3 = "";
    	var cv4 = "";
    	$("#info").empty();
    	$("#info2").empty();
    	console.log("????????? ????????? ??????");
    	console.log("data : " + data);
    	if (data != "") {
	    	$.each(data, function(i, list) {
	    		console.log(data);
	    		console.log(data[i].amount);
	    		cv += "<p>????????? : " + data[i].amount + " ???</p>"
	    		cv3 += "Y";
	    		cv4 += data[i].amount;
	    	})
	    	$("#info2").append(cv3);
	    	$("#info5").append(cv4);
    	} else if (data == "") {
    		cv3 += "N";
    		cv4 += "0";
    		$("#info2").append(cv3);
    		$("#info5").append(cv4);
    	} 
    	var a = parseInt($("#info4").text());
    	var b = parseInt($("#info5").text());
    	console.log("a : " + a);
    	console.log("b : " + b);
    	var c = a-b;
    	console.log("c : " + c);
    	$("#stdInfo6").append(c);
    }
</script>
</html>