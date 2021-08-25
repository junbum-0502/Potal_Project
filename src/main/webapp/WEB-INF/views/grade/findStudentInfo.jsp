<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/head.jsp" %>

<head>

	<style type="text/css">
	
	h2{
		width:500px;
		margin-left: 300px;
		color:rgb(051,051,102);
		font-weight: bold;
	}
	 
	.backPage{
		margin-left: 310px;
	}
	
	.stInfo{
		margin-left: 300px;
		width: 80%;
	}
	
	</style>

</head>
<body>

	<br>
	<h2 >학생조회</h2>
	<div class="backPage" style="width:80vw;">
		<a style="color: gray"> <i class="fas fa-graduation-cap"></i></a> > 학생선택<br>
	</div>
	<br><br>
	
	<div class="stInfo">
	<c:forEach var="who" items="${uList }" varStatus="status">
	학생 이름<small>(학생 번호)</small> : <a href="/potal/studentInfoGradeAll?name=${who.NAME }&uId=${who.USER_ID}">${who.NAME }<small>(${who.USER_ID })</small></a><br>
	<hr>
	</c:forEach>
	</div>
	
</body>
</html>