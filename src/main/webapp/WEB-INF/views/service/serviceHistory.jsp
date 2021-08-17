<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/head.jsp" %>

<html>
<head>

</head>
<body>

민원신청내역<br><br><br><br>
<hr>
	<c:forEach var="serviceHis" items="${shList}" varStatus="status">
		분류 : ${serviceHis.INFO }<br>
		신청일자 :  ${serviceHis.REGDATE }<br>
		신청자 아이디: ${serviceHis.USER_ID }<br>
		
		상태 : <c:if test="${serviceHis.ALLOW == 0}"> 심사중 </c:if>
		<c:if test="${serviceHis.ALLOW == 1}"> 승인완료 </c:if>
		<hr>
	</c:forEach>

</body>
</html>