<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<head>


</head>
<body>
	
	<div class="book_div">

		<c:forEach var="book" items="${bList}" varStatus="status">
			<a href="/potal/bookInfo?bIdx=${book.B_IDX}">${book.TITLE }</a>
			<hr>

		</c:forEach>
	
	</div>

</body>
</html>