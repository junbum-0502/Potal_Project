<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/head.jsp" %>

<head>

</head>
<body>

일반휴학 신청 페이지 <br>
<button onclick="pageMove()">신청하기</button>

<c:forEach var="User" items="${login}" varStatus="status">	
		<input type="hidden" value="${User.userId}" name="id" id="id">
</c:forEach>

</body>

<script>

	function pageMove(){
		var id = document.getElementById("id").value;
		
		alert("일반 휴학 신청이 완료되었습니다. \n포탈 메인 페이지로 이동합니다.")
		location.href = "/potal/listCheck?id="+id+"&stIdx=1001";
		
	}

</script>

</html>