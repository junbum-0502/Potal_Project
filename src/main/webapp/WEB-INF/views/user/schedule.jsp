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
<style>
.schedule {
	text-align: center;
}
</style>
<body>
시간표입니다.
<c:forEach var="sch" items="${schedule }" varStatus="status">
	<p>
		${sch.TITLE }
		${sch.TIME }
		${sch.P_NAME }
		${sch.CLASSROOM }
	</p>
</c:forEach>
<table class="schedule">
	<tr>
		<td></td>
		<td>월</td>
		<td>화</td>
		<td>수</td>
		<td>목</td>
		<td>금</td>
	</tr>
	<tr>
		<td>1교시</td>
		<td>ㅇㅇ</td>
		<td>ㅇㅇ</td>
		<td>ㅇㅇ</td>
		<td>ㅇㅇ</td>
		<td>ㅇㅇ</td>
	</tr>
	<tr>
		<td>2교시</td>
		<td>ㅇㅇ</td>
		<td>ㅇㅇ</td>
		<td>ㅇㅇ</td>
		<td>ㅇㅇ</td>
		<td>ㅇㅇ</td>
	</tr>
	<tr>
		<td>3교시</td>
		<td>ㅇㅇ</td>
		<td>ㅇㅇ</td>
		<td>ㅇㅇ</td>
		<td>ㅇㅇ</td>
		<td>ㅇㅇ</td>
	</tr>
	<tr>
		<td>4교시</td>
		<td>ㅇㅇ</td>
		<td>ㅇㅇ</td>
		<td>ㅇㅇ</td>
		<td>ㅇㅇ</td>
		<td>ㅇㅇ</td>
	</tr>
	<tr>
		<td>5교시</td>
		<td>ㅇㅇ</td>
		<td>ㅇㅇ</td>
		<td>ㅇㅇ</td>
		<td>ㅇㅇ</td>
		<td>ㅇㅇ</td>
	</tr>
	<tr>
		<td>6교시</td>
		<td>ㅇㅇ</td>
		<td>ㅇㅇ</td>
		<td>ㅇㅇ</td>
		<td>ㅇㅇ</td>
		<td>ㅇㅇ</td>
	</tr>
	<tr>
		<td>7교시</td>
		<td>ㅇㅇ</td>
		<td>ㅇㅇ</td>
		<td>ㅇㅇ</td>
		<td>ㅇㅇ</td>
		<td>ㅇㅇ</td>
	</tr>
	<tr>
		<td>8교시</td>
		<td>ㅇㅇ</td>
		<td>ㅇㅇ</td>
		<td>ㅇㅇ</td>
		<td>ㅇㅇ</td>
		<td>ㅇㅇ</td>
	</tr>
	<tr>
		<td>9교시</td>
		<td>ㅇㅇ</td>
		<td>ㅇㅇ</td>
		<td>ㅇㅇ</td>
		<td>ㅇㅇ</td>
		<td>ㅇㅇ</td>
	</tr>
	<tr>
		<td>10교시</td>
		<td>ㅇㅇ</td>
		<td>ㅇㅇ</td>
		<td>ㅇㅇ</td>
		<td>ㅇㅇ</td>
		<td>ㅇㅇ</td>
	</tr>
</table>
</body>
</html>