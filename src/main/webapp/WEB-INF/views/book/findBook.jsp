<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<head>

<style type="text/css">

	.book_div>a{
		color: black;
	}

	.nav{
	display: block !important;
	}
	
	.paging *{
	color: black !important;
	margin-left: 10px;
	}
	
	.bookKeyword{
		border-left: none;
		border-right: none;
		border-top:none;
	    width: 300px;
        margin-top: 10px;
	}
	
	.bookKeyword:focus{
		outline: none;
	}
	
	.bookTable {
		height: 500px;
		border-left: none;
		border-right: none;
		border-bottom: none;
	    transform: translateY(60px);
	}
	
	th{
		border-bottom: medium;
	}
	
	.searchBook{
	    margin-left: 250px;
		transform: translateY(80px);
	}
	
	.ip_rd{
		margin-right: 5px;
	}
	
	.btn_searchBook{
		margin-left:10px;
		border: none;
		background-color:rgba(255,255,255,0.1);
	}



</style>

</head>
<body>
	1111111111111111111111
	<div class="searchBook">
	
		<input class="ip_rd" type="radio" name="keyword" id="title" >제목
		<input class="ip_rd" type="radio" name="keyword" id="author" >작가<br>
		제목 : <input class="bookKeyword" type="text" id="key" placeholder="검색어를 입력하세요">
		<button type="submit" class="btn_searchBook" onclick="findBook()"><i class="fas fa-search"></i></button><br><br><br><br>
	
	</div>
	
	
	<div class="book_div">

 		<table class="bookTable" style="text-align: center;margin-left: 250px" border="1">
	       <thead>
	           <tr>
	               <th style="width: 200px; height:20%;"><span>도서번호</span></th>
	               <th style="width: 800px;"><span>제목</span></th>
	               <th style="width: 200px;"><span>작성자</span></th>
	                <th style="width: 200px;"><span></span></th>
	           </tr>
	       </thead>
	       <tbody id="resultR">      
	       	   	<c:forEach var="book" items="${bList}" varStatus="status">
	       			<tr id=resultTr1>
	       			<td id="resultA">${book.B_IDX }</td>
	       			<td id="resultB"><a style="color: black" href="/potal/bookInfo?bIdx=${book.B_IDX}">${book.TITLE }</a></td> 
	       			<td id="resultC">${book.AUTHOR }</td>
	       			<td id="resultD"><a href="/potal/bookInfo?bIdx=${book.B_IDX}">대출 신청</a></td>
	       			</tr id=resultTr2>
				</c:forEach>
	       </tbody>
	    </table>
	
		<br><br><br> 
      	<div class="paging" style="display:flex;margin-left: 750px">
	         <a href="/potal/book" class="nav first"><i class="fas fa-angle-double-left"></i> </a>
	         <a href="/potal/book?page=${paging.prev}"><i class="fas fa-angle-left"></i> </a>
	       
	         <c:forEach begin="${paging.blockStart}" end="${paging.blockEnd}" var="page">
	         	<a href="/potal/book?page=${page}"><span>${page}</span></a>
	         </c:forEach> 
	        
	         <a href="/potal/book?page=${paging.next}"><i class="fas fa-angle-right"></i></a>
	 	   	 <a href="/potal/book?page=${paging.lastPage}"><i class="fas fa-angle-double-right"></i></a>
	   </div>
	</div>

</body>

<script>

	function findBook(){
		
		var titleC;
		var authorC;
		
		if(document.getElementById("title").checked){
	/* 		var titleC = document.getElementById("title").value; */
			titleC = true;
			authorC = false;
		}else if(document.getElementById("author").checked){
/* 			var authorC = document.getElementById("author").value; */
 			titleC = false;
			authorC = true;
 
		}
		
		/* var tCheck = document.getElementById("title").checked;
		var aCheck = document.getElementById("author").checked; */
		
		var title = document.getElementById("title").value;
		var author = document.getElementById("author").value;
		var key = document.getElementById("key").value;
		
		console.log("titlle : " + title);
		console.log("author : " + author);
		console.log("key : " + key);
		
		$.ajax({
			url : "bookSearch",
			type : "POST",
			data : {
				title : title,
				author : author,
				key : key,
				titleC : titleC,
				authorC : authorC
			},
			dataType : "JSON",
			success : bookList,
			error : function(error) {
				console.log("실패");
			}
		})
		
	}
	
	function bookList(data) {
		var cv = "";
		var cv1 = "";
		var cv2 = "";
		var cv3 = "";
	
		/* $("#resultR").empty(); */
		$("#resultA").empty();
		$("#resultB").empty();
		$("#resultC").empty();
		$("#resultD").empty();
	    $("#resultTr").empty();
		
 		$(".paging").remove();
		console.log("책 검색 완료");
		console.log("검색된 책 : " + data);
		$.each(data, function(i, list) {
			console.log(data[i]);
			
			cv += data[i].B_IDX + "<br>"
			cv1 += "<a href='/potal/bookInfo?bIdx="+data[i].B_IDX+"'>"+data[i].TITLE+"</a>" + "<br>"
			cv2 += data[i].AUTHOR + "<br>"
			cv3 += "<a href='/potal/bookInfo?bIdx="+data[i].B_IDX+"'>"+'대출 신청'+"</a>" + "<br>"

		})
		/* $("#resultTr1").append(); */
 		$("#resultA").append(cv);
		$("#resultB").append(cv1);
		$("#resultC").append(cv2);
		$("#resultD").append(cv3);
		/* $("#resultTr2").append(); */
	
	}

</script>

	<div class="book_div">

		<c:forEach var="book" items="${bList}" varStatus="status">
			<a href="/potal/bookInfo?bIdx=${book.B_IDX}">${book.TITLE }</a>
			<hr>

		</c:forEach>
	
	</div>

</body>

</html>