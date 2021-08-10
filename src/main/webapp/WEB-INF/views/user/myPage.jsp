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
.intro {
	color : blue;
}

</style>
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
    }
    
    function img(data) {
    	var cv = "";
    	console.log("이미지 업로드");
    	$.each(data, function(i, list) {
    		console.log(data[i].SAVE_PATH);
    		cv += "<input type='image' src='<%=request.getContextPath()%>" + data[i].SAVE_PATH + "'>"
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
</script>
</head>
<body>
<c:forEach var="info" items="${login }" varStatus="status">
	<!-- form enctype="multipart/form-data"를 적어줘야 한다. -->
	<input type="hidden" value="${info.userId }" id="id"> <!-- 학번 -->
	<input type="hidden" value="${info.mIdx }" id="tuition"> <!-- 학과번호 -->
	<div id="profile">
	</div>
	<c:if test="${info.type eq 1}">
		학생입니다.
	</c:if>
	<c:if test="${info.type eq 2}">
		교수입니다.
	</c:if>
	<p>아이디 : ${info.userId }</p>
	<p>비밀번호 : ${info.password }</p>
	<p>이름 : ${info.name }</p>
	<p>이메일 : ${info.email }</p>
	<p>핸드폰 번호 : ${info.phone }</p>
	<p>생년월일 : ${info.birth }</p>
	<div id="info">
	</div>
	<p>비밀번호 변경</p>
	<c:if test="${updatePwd ne 1}">
		<form method="POST" action="updateInfo" onsubmit="return testEqual();">
			<input type="hidden" value="${info.userId }" name="id">
			새 비밀번호 <input type="password" id="pwd" name="pwd"><br>
			새 비밀번호 확인<input type="password" id="rePwd">
			<button type="submit">변경</button>
		</form>
	</c:if>
	<c:if test="${updatePwd eq 1}">
		<p class="intro">비밀번호 변경이 완료되었습니다.</p>
	</c:if>
	<p>이메일 변경</p>
	<c:if test="${updateEmail ne 1 }">
		<form method="POST" action="updateInfo" onsubmit="return testEmail();" >
			<input type="hidden" value="${info.userId }" name="id">
			새 이메일 <input type="text" id="email" name="email">
			<button type="submit">변경</button>
		</form>
	</c:if>
	<c:if test="${updateEmail eq 1 }">
		<p class="intro">이메일 변경이 완료되었습니다.</p>
	</c:if>
	<p>핸드폰 번호 변경</p>
	<c:if test="${updatePhone ne 1 }">
		<form method="POST" action="updateInfo" onsubmit="return testPhone();">
			<input type="hidden" value="${info.userId }" name="id">
			새 핸드폰 번호 <input type="text" id="phone" name="phone">
			<button type="submit">변경</button>
		</form>
	</c:if>
	<c:if test="${updatePhone eq 1 }">
		<p class="intro">핸드폰 번호 변경이 완료되었습니다.</p>
	</c:if>
</c:forEach>
<button id="btn_open">메세지</button>
<button id="btn_close">메세지닫기</button>
</body>
</html>