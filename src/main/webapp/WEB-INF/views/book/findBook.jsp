<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<head>


</head>
<body>
	
	<div class="book_div">

		<c:forEach var="book" items="${bList}" varStatus="status">
			${book.BOOK_AMT }
		</c:forEach>
	
	</div>

</body>
</html>