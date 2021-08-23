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

.message {
	height: 320px;
}

.text {
	text-align: center;
}

.textarea {
	height: 81px;
    width: 260px;
    float: left;
    margin-left: 6px;
    border-radius: 6px;
    border-top: 3px solid #4e73df;
}

.input {
	float: left;
	height: 87px;
    width: 74px;
    border-radius: 6px;
	border: 0;
    color: #fff;
    background-color: #4e73df;
    margin-left: 7px;
}

.input:hover {
	background-color: #224abe;
}

.msgT {
	width: 350px;
}

.set1 {
	width: 80px;
}

.set2 {
	float: right;
    width: auto;
    border-radius: 6px;
	border: 0;
	color: black;
	background-color: rgb(242, 246, 250);
	padding: 10px;
}

.set3 {
	float: left;
    width: auto;
    border-radius: 6px;
	border: 0;
	color: black;
	background-color: #4e73df80;
	padding: 10px;
}

.set4 {
	width: 80px;
}
</style>
<script>
	
	var cv = "";
	
	$(document).ready(function() {
		var id = document.getElementById("id").value;
		var proId = document.getElementById("proId").value;
		$.ajax({
			url : "readMessage",
			type : "POST",
			data : {
				content : content,
				id : id,
				proId : proId
			},
			dataType : "JSON",
			success : msg,
			traditional : true,
			error : function(error) {
				console.log("실패");
			}
		})
	});
	
	function sendMessage() {
		var content = document.getElementById("content").value;
		var id = document.getElementById("id").value;
		var proId = document.getElementById("proId").value;
		console.log("메세지 보낼 내용 : " + content);
		if (content == "") {
			alert("메세지를 입력해주세요.");
		} else {
			$.ajax({
				url : "sendMessage",
				type : "POST",
				data : {
					content : content,
					id : id,
					proId : proId
				},
				dataType : "JSON",
				success : msg,
				traditional : true,
				error : function(error) {
					console.log("실패");
				}
			})
		}
	}
	
	function msg(data) {
		var id = document.getElementById("id").value;
		var proId = document.getElementById("proId").value;
		$("#content").val("");
		$("#msg").empty();
		cv = "";
		console.log("메세지 전송 성공");
		console.log("data : " + data);
		$.each(data, function(i, list) {
			if (data[i].USER_ID == id) {
			cv += "<tr>"
			cv += "<td class='set1'></td>"
			cv += "<td class='set2'>"
			cv += "<span class='send'>" + data[i].CONTENT + "</span><br>"
			cv += "<span class='send'>" + data[i].REGDATE + "</span>"
			cv += "</td>"
			cv += "</tr>"
			} else if (data[i].USER_ID == proId) {
				cv += "<tr>"
				cv += "<td class='set3'>"
				cv += "<span class='send'>" + data[i].CONTENT + "</span><br>"
				cv += "<span class='send'>" + data[i].REGDATE + "</span>"
				cv += "</td>"
				cv += "<td class='set4'></td>"
				cv += "</tr>"
			}
		})
		$("#msg").append(cv);
	}
</script>
<body onresize="parent.resizeTo(400,500)" onload="parent.resizeTo(400,500)">
<c:if test="${!empty login }">
	<div class="message" id="input">	
	<table class="msgT" id="msg">
	</table>
	</div>
	<div class="text">
		<textarea class="textarea" id="content"></textarea>
		<button class="input" onclick="sendMessage();">입력</button>
	</div>
	<c:forEach var="info" items="${login }" varStatus="status">
		<input type="hidden" id="id" value="${info.userId }">
	</c:forEach>
	<input type="hidden" id="proId" value="${proId }">
</c:if>
<c:if test="${empty login }">
	로그인해주세요.
</c:if>

</body>
</html>