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
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<style>
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
}

.input {
	height: 87px;
    width: 74px;
}
</style>
<script>
	
	var cv = "";
	
	$(document).ready(function() {
		var id = document.getElementById("id").value;
		console.log(id);
		$.ajax({
			url : "readMessage",
			type : "POST",
			data : {
				content : content,
				id : id
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
		console.log("메세지 보낼 내용 : " + content);
		$.ajax({
			url : "sendMessage",
			type : "POST",
			data : {
				content : content,
				id : id
			},
			dataType : "JSON",
			success : msg,
			traditional : true,
			error : function(error) {
				console.log("실패");
			}
		})
	}
	
	function msg(data) {
		$("#content").val("");
		$(".message").empty();
		cv = "";
		console.log("메세지 전송 성공");
		console.log("data : " + data);
		$.each(data, function(i, list) {
			cv += "<span class='send'>" + data[i].CONTENT + "</span><br>"
			cv += "<span class='send'>" + data[i].REGDATE + "</span><br>"
		})
		$("#input").append(cv);
	}
</script>
<body onresize="parent.resizeTo(400,500)" onload="parent.resizeTo(400,500)">
<c:if test="${!empty login }">
	<div class="message" id="input">
	</div>
	<div class="text">
		<textarea class="textarea" id="content"></textarea>
		<button class="input" onclick="sendMessage();">입력</button>
	</div>
	<c:forEach var="info" items="${login }" varStatus="status">
		<input type="hidden" id="id" value="${info.userId }">
	</c:forEach>
</c:if>
<c:if test="${empty login }">
	로그인해주세요.
</c:if>

</body>
</html>