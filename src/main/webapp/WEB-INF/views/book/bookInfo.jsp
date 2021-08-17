<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/head.jsp" %>

<head>

</head>
<body>

		<c:forEach var="book" items="${bList}" varStatus="status">
			제목 : ${book.TITLE}<br>
			작가 : ${book.AUTHOR}<br>
			도서 정보 : ${book.INFO }<br>
			도서 재고 : ${book.BOOK_AMT }<br>
			대출 횟수 : ${book.RENT_CNT }<hr>
			
		<input type="hidden" value="${book.BOOK_AMT}" id="amt">
		<input type="hidden" value="${book.B_IDX}" id="idx">
		</c:forEach>
		
		<c:forEach var="User" items="${login}" varStatus="status">	
		<input type="hidden" value="${User.userId}" name="id" id="id">
		</c:forEach>
		
		<button  onclick="rent()">도서대출 신청하기</button>

</body>

<script>
	// 도서재고가 1권이상일 때 대출가능
	function rent() {
		
		var amt = document.getElementById("amt").value;
		var idx = document.getElementById("idx").value;
		var id = document.getElementById("id").value;
		console.log(amt);

		if(amt > 0){
			alert("대출신청이 완료되었습니다.\n도서목록 페이지로 이동합니다.");
			location.href="/potal/rent?bIdx="+idx+"&id="+id
		}else{
			alert("해당 도서의 재고가 없어 대출신청이 불가능합니다.\n도서목록 페이지로 이동합니다.");
			location.href="/potal/book"
		}	
	}

</script>

</html>