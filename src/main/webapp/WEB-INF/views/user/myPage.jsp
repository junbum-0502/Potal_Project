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
<style>
body {
    font-family: 'NanumSquare', sans-serif !important;
}

.intro {
	color : blue;
}

.infoAll {
	text-align: center;
    border-collapse: collapse;
    border: 1px solid #ccc;
    border-top: 3px solid #4e73df;
    margin: auto;
    width: 900px;
    height: 300px;
}

.img {
	width: 130px;
    height: 130px;
}

td {
	width: 230px;
    height: 130px;
}

.update {
	text-align: center;
	width: 900px;
	margin: auto;
	border-collapse: collapse;
    border: 1px solid #ccc;
    border-top: 3px solid #4e73df;
}

.guide {
	float: left;
    font-size: 20px;
    color: black;
}

input[type="text"] {
	margin-bottom: 10px;
}

input[type="password"] {
	margin-bottom: 10px;
}

.upBtn {
	width: 180px;
	border-radius: 6px;
	border: 0;
    color: #fff;
    background-color: #4e73df;
}

.upBtn:hover {
	background-color: #224abe;
}

.upMent {
	color: black;
}

.upSpace {
	height: 30px;
}

.guideInfo {
	text-align: left;
    height: 60px;
    width: 900px;
    margin-left: 370px;
}
</style>

</head>
<body>
<jsp:include page="/WEB-INF/views/include/head.jsp"></jsp:include>
<c:forEach var="info" items="${login }" varStatus="status">
	<input type="hidden" value="${info.userId }" id="id"> <!-- 학번 -->
	<input type="hidden" value="${info.mIdx }" id="tuition"> <!-- 학과번호 -->
	<input type="hidden" value="${info.semester }" id="semester"> <!-- 학기 -->
	<br><br>
	<div class="guideInfo">
		<c:if test="${info.type eq 1}">
			<p class="guide">학생 정보</p>
		</c:if>	
		<c:if test="${info.type eq 2}">
			<p class="guide">교수 정보</p>
		</c:if>
	</div>
	<table class="infoAll">
		<tr>
			<td rowspan="2">
				<div id="profile"></div>
				${info.name } <br><br>
				${info.userId } <br>
				${info.phone } <br>
				${info.email } <br>
				${info.birth } <br>
			</td>
			<td id="major"></td>
			<c:if test="${info.type eq 1}">
				<td>학생</td>
			</c:if>	
			<c:if test="${info.type eq 2}">
				<td>교수</td>
			</c:if>
		</tr>
		<tr>
			<td id="grade"></td>
			<td id="sms"></td>	
		</tr>
	</table><br><br>
	<div class="guideInfo">
		<c:if test="${info.type eq 1}">
			<p class="guide">학생 정보 변경</p>
		</c:if>	
		<c:if test="${info.type eq 2}">
			<p class="guide">교수 정보 변경</p>
		</c:if>
	</div>
	<table class="update">
		<tr>
		<c:if test="${updatePwd ne 1}">\
			<tr>
				<td class="upSpace"></td>
				<td class="upSpace"></td>
				<td class="upSpace"></td>
			</tr>
			<tr>
				<td class="upSpace"><p class="upMent">비밀번호 변경</p></td>
				<td class="upSpace"><p class="upMent">이메일 변경</p></td>
				<td class="upSpace"><p class="upMent">핸드폰 번호 변경</p></td>
			</tr>
			<td>
				<form method="POST" action="updateInfo" onsubmit="return testEqual();">
					<input type="hidden" value="${info.userId }" name="id">
					<input type="password" id="pwd" name="pwd" placeholder="새 비밀번호"><br>
					<input type="password" id="rePwd" placeholder="새 비밀번호 확인"><br>
					<button type="submit" class="upBtn">비밀번호 변경</button>
				</form>
			</td>
		</c:if>
		<c:if test="${updatePwd eq 1}">
			<td>
				<p class="intro">비밀번호 변경이 완료되었습니다.</p>
			</td>
		</c:if>
		<c:if test="${updateEmail ne 1 }">
			<td>
				<form method="POST" action="updateInfo" onsubmit="return testEmail();" >
					<input type="hidden" value="${info.userId }" name="id">
					<input type="text" id="email" name="email"placeholder="새 이메일"><br>
					<button type="submit" class="upBtn">이메일 변경</button>
				</form>
			</td>
		</c:if>
		<c:if test="${updateEmail eq 1 }">
			<td>
				<p class="intro">이메일 변경이 완료되었습니다.</p>
			</td>
		</c:if>
		<c:if test="${updatePhone ne 1 }">
			<td>
				<form method="POST" action="updateInfo" onsubmit="return testPhone();">
					<input type="hidden" value="${info.userId }" name="id">
					<input type="text" id="phone" name="phone"placeholder="새 핸드폰 번호"><br>
					<button type="submit" class="upBtn">핸드폰 번호 변경</button>
				</form>
			</td>
		</c:if>
		<c:if test="${updatePhone eq 1 }">
			<td>
				<p class="intro">핸드폰 번호 변경이 완료되었습니다.</p>
			</td>
		</c:if>
		</tr>
		<!-- <tr>
			<td>
				<div id="info">
				</div>
				<button id="btn_open">메세지</button>
				<button id="btn_close">메세지닫기</button>
			</td>
		</tr>  -->
	</table>
</c:forEach>
</body>
<script>
	function testEqual() {
		var pwd = document.getElementById("pwd").value;
		var rePwd = document.getElementById("rePwd").value;
		console.log(pwd);
		console.log(rePwd);
		if (pwd == "") {
			console.log("새 비밀번호 미입력");
			alert("새 비밀번호를 입력해주세요.");
			document.getElementById("pwd").focus();
			return false
		} else if (rePwd == "") {
			console.log("새 비밀번호 확인 미입력");
			alert("새 비밀번호 확인을 입력해주세요.");
			document.getElementById("rePwd").focus();
			return false
		} else if (pwd != rePwd) {
			console.log("비밀번호 불일치");
			alert("비밀번호가 일치하지 않습니다.");
			document.getElementById("pwd").focus();
			document.getElementById("rePwd").value = "";
			return false;
		} else if (pwd == rePwd) {
			console.log("비밀번호 일치");
			return true;
		}
	}
	
	function testEmail() {
		var email = document.getElementById("email").value;
		if (email == "") {
			alert("새 이메일을 입력해주세요.");
			return false;
		}
	}
	
	function testPhone() {
		var phone = document.getElementById("phone").value;
		if (phone == "") {
			alert("새 핸드폰 번호를 입력해주세요.");
			return false;
		}
	}
    window.onload = function () {
        //새창
        $("#btn_open").click(fopen);
        $("#btn_close").click(fclose);

        let opened_win_01 = null;
        function fopen() {
            opened_win_01 = window.open("message", "Message", "width=400, height=500, toolbar=yes");
        }
        function fclose() {
            opened_win_01.close();
        }
        // 프로필 사진
        var id = document.getElementById("id").value;
        $.ajax({
        	url : "profileImg",
        	type : "POST",
        	data : {
        		id : id
        	},
        	success : img,
        	error : function(error) {
        		console.log("실패");
        	}
        })
        // 등록금 조회
        var tuition = document.getElementById("tuition").value;
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
        // 장학금 조회
        $.ajax({
        	url : "scholarship",
        	type : "POST",
        	data : {
        		id : id
        	},
        	success : info_scholarship,
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
        // 학년 조회
        var cv = "";
        var cv2 = "";
        var semester = document.getElementById("semester").value;
        console.log("학기 : " + semester);
        console.log("학년 : " + Math.ceil(semester/2));
        cv += Math.ceil(semester/2) + "학년";
        cv2 += semester + "/8학기";
        $("#grade").append(cv);
        $("#sms").append(cv2);
    }
    
    function img(data) {
    	var cv = "";
    	console.log("이미지 업로드");
    	$.each(data, function(i, list) {
    		console.log(data[i].SAVE_PATH);
    		cv += "<input type='image' class='img' src='<%=request.getContextPath()%>" + data[i].SAVE_PATH + "'>"
    	})
    	$("#profile").append(cv);
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
    
    function info_scholarship(data) {
    	var cv = "";
    	console.log("장학금 조회");
    	$.each(data, function(i, list) {
    		console.log(data[i].amount);
    		cv += "<p>장학금 : " + data[i].amount + " 원</p>"
    	})
    	$("#info").append(cv);
    }
    
    function info_major(data) {
    	var cv = "";
    	console.log("학과 조회");
    	$.each(data, function(i, list) {
    		console.log(data[i].NAME);
    		cv += data[i].NAME
    	})
    	$("#major").append(cv);
    }
</script>
</html>