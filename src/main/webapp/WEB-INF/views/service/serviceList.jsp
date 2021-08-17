<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/head.jsp" %>

<head>

</head>
<body>

	<c:forEach var="service" items="${sList}" varStatus="status">
		<a href="/potal/serviceDetail?stIdx=${service.ST_IDX }"> ▶ ${service.INFO}  바로가기</a>  <hr>
		<%-- <button value="${service.ST_IDX }" id="loc" onclick="pageMove()">신청 바로가기</button> <br><hr> --%>
	</c:forEach>

</body>

<script>

/* 	function pageMove(){
		var loc = document.getElementById("loc").value;
		console.log(loc);
		location.href = "/potal/serviceDetail?idx="+loc;
	} */

</script>

</html>