<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/head.jsp" %>

<head>

	<style type="text/css">
	
	.subList{
		margin-left: 300px; 
	}
	 
	h2{
		width:500px;
		margin-left: 300px;
		color:rgb(051,051,102);
		font-weight: bold;
	}
	 
	.backPage{
		margin-left: 310px;
	}
	
	hr{
	
	}
	
	</style>

</head>
<body>

	<br>
	<h2 >성적입력</h2>
	<div class="backPage" style="width:80vw;">
		<a style="color: gray"> <i class="fas fa-graduation-cap"></i></a> > 과목선택<br>
	</div>
 
	<br><br>
	<div class="subList">
		<c:forEach var="score" items="${gList }" varStatus="status">
			<a href="/potal/titleByGrade?pId=${score.USER_ID}&cIdx=${score.C_IDX}">과목명(과목번호) : ${score.TITLE}(<small>${score.C_IDX}</small>)<br></a>
			<hr>
		</c:forEach>
	</div>	

	

</body>
</html>