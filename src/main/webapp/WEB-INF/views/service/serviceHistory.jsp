<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/head.jsp" %>

<html>
<head>

	<style type="text/css">
	
	th{
		text-align: right;
		border: none;
		color:gray;
		width:130px;
	}
	
	td{
		padding-left:20px;
		text-align: left;
		border: none;
		padding-top: 2px;
	}
	
	h2{
		width:500px;
		transform:translateX(50px);
		color:rgb(051,051,102);
		font-weight: bold;
	}
	
	.backPage{
		transform:translateX(50px);
	}
	
	</style>

</head>
<body>

	<br>
	<h2 >상세정보</h2>
	<div class="backPage" style="width:90vw;">
		<a style="color: gray"><i class="fas fa-book"></i></a> > 민원 신청내역<br>
	</div>
	<br><br>

	<c:forEach var="serviceHis" items="${shList}" varStatus="status">
		<table>
			<tbody>
			<tr>
				<th>신청번호</th> 
				<td>${serviceHis.S_IDX}</td>
			</tr>
			<tr>
				<th>분류</th>  
				<td>${serviceHis.INFO }</td>
			</tr>
			<tr>
				<th>신청일자</th>  
				<td>${serviceHis.REGDATE}</td>
			</tr>
			<tr>
				<th>신청자 아이디</th> 
				<td>${serviceHis.USER_ID}</td>
			</tr>
			<tr>
				<th>상태</th>
				<td>	
					<c:if test="${serviceHis.ALLOW == 0}"> 심사중 </c:if>
					<c:if test="${serviceHis.ALLOW == 1}"> 승인완료 </c:if>
				</td>
			</tr>	
			</tbody>
		</table>
		<hr>
	</c:forEach>

</body>
</html>