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
a {
	text-decoration-line: none;
	color: black;
}

a:hover {color:#00BFFF;}
a:active {color:#00BFFF;}
</style>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<body>
<c:forEach var="eClass" items="${eClass }" varStatus="status">
	제목 : <a href="<%=request.getContextPath()%>/potal/class?userId=${eClass.USER_ID }">${eClass.TITLE }</a>
	, 교수 : ${eClass.P_NAME } <br>
</c:forEach>
</body>
</html>