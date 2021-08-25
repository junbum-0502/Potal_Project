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
	
	.tableBody{
	
	}
	
	.scoreTable{
		
	}
	
	.tableDiv{
		margin-left: 200px;
	}
	 
	th{
		text-align: center;
		border: none;
		color:gray;
		width:200px;
	}
	 
	td{
		padding-left:20px;
		text-align: left;
		border: none;
		padding-top: 2px;
	}
	  
	</style>

</head>
<body> 
 
<br> 
	<h2 >학생정보</h2>
	<div class="backPage" style="width:80vw;"> 
		<a style="color: gray"> <i class="fas fa-graduation-cap"></i></a> > 학생정보<br>
	</div>
	
<br>

<br><br>
	<div class="tableDiv">
	<c:forEach var="info" items="${uList }" varStatus="status">
	
	
	<table class="scoreTable">
		<tbody class="tableBody">
			<tr>
				<th>학생 이름</th>
				<td>${info.NAME }</td>
			</tr>	
			<tr>
				<th>학생 학번</th>
				<td>${info.USER_ID }</td>
			</tr>	
			<tr>
				<th>학생 번호</th>
				<td>${info.PHONE }</td>
			</tr>	
			<tr>
				<th>학생 이메일</th>
				<td>${info.EMAIL }</td>
			</tr>	
		</tbody>
	</table>

	</c:forEach>
	
	<c:forEach var="grade" items="${gList }" varStatus="status">
	
		<table class="scoreTable">
		<tbody class="tableBody">
			<tr>
				<th>학생 중간고사 성적</th>
				<td>${grade.MID_SCORE }</td>
			</tr>	
			<tr>
				<th>학생 기말고사 성적</th>
				<td>${grade.FINAL_SCORE }</td>
			</tr>	
			<tr>
				<th>학생 총합 성적</th>
				<td>${grade.SCORE }</td>
			</tr>	
			<tr>
				<th>학생 학점</th>
				<td>${grade.GRADE }</td>
			</tr>	
			<tr>
				<th>학생 학점</th>
				<td>${grade.CREDIT }</td>
			</tr>	
		</tbody>
	</table>
	
	</c:forEach>
	</div>

	
	
</body>
</html>