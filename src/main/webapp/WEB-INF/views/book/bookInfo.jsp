<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/head.jsp" %>

<head>

<style type="text/css">

	.bInfo{
		margin:auto;
		width:1100px;
		height:520px;
		border: 1px solid;
		position: absolute;
  		left: 400px;
	}
	 
	.bInfoDiv{
		width:1000px;
		margin: auto;
	}
	
	.bInfoBtn{
		color: #fff;
    	background-color: #4e73df;
		border:none;
		height:40px;
		margin-top: 50px;
	    transform: translateX(-50px);
        position: absolute;
	    top: 750px;
	    left: 450px;
	    width: 150px;
	    height: 40px;
	}
	 
	.bInfoBtn:hover{
		background-color: #224abe;
	}
	
	h3{
		color: #003d54;
		font-weight: bold;
	}
	
	h4{
		font-weight: lighter;
		font-size: x-large;
	}
	
	h2{
		width:500px;
		margin-left: 300px;
		color:rgb(051,051,102);
		font-weight: bold;
	}
	 
	
	#titleDiv{
		width:800px;
		padding-top:30px;
		margin-left: 50px;
	}
	
	#infoDiv{
		width:800px;
		margin: auto;
		padding-top: 100px;
		color:black;
	}
	
	.bookInfoTable{
		width:700px;
		border: none;
		border-collapse: collapse;
		transform:translate(-350px,-40px);
	}
	
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
	
	.bookImg{
		width:180px;
		height: 250px;
		position: absolute;
	    left: 150px;
	    top: -230px;

	} 
	  
	.backPage{
		margin-left: 310px;
	}

	#storyInfo{
		max-height: 100px;
	}
	
	#imgPosition{
	
		position: absolute;
		right: 430px;
    	top: 40vh;
	}
		
</style>

</head>
<body>

	<br>
	<h2 >상세정보</h2>
	<div class="backPage" style="width:80vw;">
		<a href="/potal/book" style="color: gray"><i class="fas fa-book"></i></a> > 대출신청<br>
	</div>
	<br>
	<div class="bInfo">
		<c:forEach var="book" items="${bList}" varStatus="status">
			<div id="titleDiv">
			<h3>${book.TITLE}<br></h3>
			<h4>${book.AUTHOR}<br></h4>
			</div>
			
			<div id="infoDiv" >
						
						
			<table class="bookInfoTable" style="text-align: center;margin-left: 250px" border="1">
	       <tbody id="bookInfoTBody"> 
	       			<tr>
	       				<th>카테고리</th>
	       				<td> ${book.CATEGORY}</td>
	       			</tr>
	       			<tr>
	       				<th>ISBN</th>
	       				<td> ${book.ISBN}</td>
	       			</tr>
	       			<tr>
	       				<th>도서 등록일자</th>
	       				<td> ${book.REG_DATE}</td>
	       			</tr>
	       			<tr>
	       				<th>줄거리 요약</th>
	       				<td id="storyInfo">${book.INFO }</td>
	       			</tr>
	       			<tr>
	       				<th>도서 재고</th>
	       				<td>  ${book.BOOK_AMT }</td>
	       			</tr>
	       			<tr>
	       				<th>대출 횟수</th>
	       				<td> ${book.RENT_CNT }</td>
	       			</tr>
	       </tbody>
	    </table>			
				
<%-- 			카테고리  :  ${book.CATEGORY}<br>
			ISBN  :  ${book.ISBN}<br>
			도서 등록일자  :  ${book.REG_DATE}<br>
			줄거리 요약  :  ${book.INFO }<br>
			도서 재고  :  ${book.BOOK_AMT }<br>
			대출 횟수  :  ${book.RENT_CNT } --%>
			
			<div id="imgPosition">
				<img class="bookImg" src="/resources/img/bookLogo/${book.B_IDX}.jpg">
			</div>
			
			</div>
		
		<input type="hidden" value="${book.TITLE}" id="title">
		<input type="hidden" value="${book.BOOK_AMT}" id="amt">
		<input type="hidden" value="${book.B_IDX}" id="idx">
		</c:forEach>
		
		<c:forEach var="User" items="${login}" varStatus="status">	
		<input type="hidden" value="${User.userId}" name="id" id="id">
		</c:forEach>
			
	</div>	
	<div class="bInfoDiv">
		<button class="bInfoBtn" onclick="rent()">대출 신청</button>
	</div>
</body>

<script>
	// 도서재고가 1권이상일 때 대출가능
	function rent() {
		
		var title = document.getElementById("title").value;
		var amt = document.getElementById("amt").value;
		var idx = document.getElementById("idx").value;
		var id = document.getElementById("id").value;
		console.log(amt);
	
		var check = confirm(title+"\n해당 도서를 대출하시겠습니까?");
		
		if(check == false){
			return;
		}
		 
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