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
	    margin-left: 270px;
	}
	
	.ip_rd{
		margin-right: 5px;
	}
	
	.btn_searchBook{
		margin-left:10px;
		border: none;
		background-color:rgba(255,255,255,0.1);
	}

	h2{
		width:500px;
		transform:translateX(50px);
		color:rgb(051,051,102);
		font-weight: bold;	
	}


</style>

</head>
<body>
	<h2 >도서조회/대출<small><a href="/potal/book" style="color: gray"><i class="fas fa-book"></i></a></small></h2><br>

	<div class="searchBook">
	
		<input class="ip_rd" type="radio" name="keyword" id="title" >제목
		<input class="ip_rd" type="radio" name="keyword" id="author" >작가<br>
		<input class="bookKeyword" type="text" id="key" placeholder="검색어를 입력하세요">
		<button type="submit" class="btn_searchBook" onclick="findBook()"><i class="fas fa-search"></i></button>
	
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
	       			<tr id="why2">
	       			<td id="resultA">${book.B_IDX }</td>
	       			<td id="resultB"><a style="color: black" href="/potal/bookInfo?bIdx=${book.B_IDX}">${book.TITLE }</a></td> 
	       			<td id="resultC">${book.AUTHOR }</td>
	       			<td id="resultD"><a href="/potal/bookInfo?bIdx=${book.B_IDX}">대출 신청</a></td>
	       			</tr>
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

		var cv = new Array();
		var cnt = 0;
		var newPaging = "";
		var pagingFor = new Array();
		var pagingLast = "";
		var start =0;
		var end = 0;
		
		$("#resultR ").empty();
 		$(".paging").empty(); 
		
		console.log("책 검색 완료");
		console.log("검색된 책 : " + data);
		$.each(data, function(i, map) {
			
			console.log("에러가 여기서? : " + data[i].B_IDX);
			console.log(data);
			console.log(i);
			console.log(map);
			console.log(data["bList"]);
			console.log(data["bList"][0]);
			console.log(data["bList"].length);
			console.log(data["bList"][0]["TITLE"]);
			/* console.log("data(bList) : " + data(bList)); */

			cnt = data["bList"].length
			
			// 도서배열
			for(var x=0; x<cnt; x++){
				console.log("반복문처음"+cv[x])
				cv[x] = "<tr><td>"+data["bList"][x]["B_IDX"]+"<br>"+"</td>"
				+"<td><a href='/potal/bookInfo?bIdx="+data["bList"][x]["B_IDX"]+"'>"+data["bList"][x]["TITLE"]+"</a><br></td>"
				+"<td>"+ data["bList"][x]["AUTHOR"] + "<br></td>"
				+"<td><a href='/potal/bookInfo?bIdx="+data["bList"][x]["B_IDX"]+"'>"+'대출 신청'+"</a><br></td></tr>";
				console.log("반복문 마지막"+cv[x])
			}
			
			console.log("여기 " + cv[0]);
			console.log("여기 " + cv[5]);

			console.log(map);
			
			console.log("여기 " + cv[x]);
			
			// 페이징처리
			console.log(data["newPaging"]);
			console.log();
			console.log(data["newPaging"].prev);
			console.log(data["newPaging"].blockStart);
			console.log(data["newPaging"].blockEnd);
			console.log(data["newPaging"].next);
			
			start = data["newPaging"].blockStart;
			end = data["newPaging"].blockEnd;
			
			const s = data["newPaging"].blockStart;
			const e = data["newPaging"].blockEnd;
			
			console.log("start : " + parseInt(start));
			console.log("end : " + parseInt(end));
			
			console.log("start타입 : " + typeof(start));
			console.log("start타입 : " + typeof(data["newPaging"].blockEnd));
			
			console.log("end : "+end);
			
	
	 		console.log(start);
			console.log(end); 
			
			console.log("뉴페이징 :: ");
			console.log("검색결과"+data["newPaging"]);
			
			newPaging = "<a href='/potal/bookSearch' class='nav first'><i class='fas fa-angle-double-left'></i> </a>"
					+"<a href='/potal/bookSearch?page="+data["newPaging"].prev+"'><i class='fas fa-angle-left'></i> </a>"
	
					
			 		+"<c:forEach begin='1' end='4' var='pageFind'>"  	 
	         		+"<a href='/potal/bookSearch?page="+${pageFind}+"'><span>"+${pageFind}+"</span></a>"	
		         	+"</c:forEach>"	 
		        	
					+"<a href='/potal/bookSearch?page="+data["newPaging"].next+"'><i class='fas fa-angle-right'></i></a>"
					+"<a href='/potal/bookSearch?page="+data["newPaging"].lastPage+"'><i class='fas fa-angle-double-right'></i></a>";
			
	       
			
			console.log("newPaging ?? " + newPaging);
			console.log("pagingLast ?? " + pagingLast);
			
		 	
			
		})
		console.log("여기는 " + cv[0]);
		console.log("페이징" + newPaging)
		
		console.log(cv[0]);
		
		for(var x=0; x<cnt; x++){
 		$("#resultR").append(cv[x]);
		}
		
/* 		$("#resultR").append(cv);
		$("#resultR").append(cv1);
		$("#resultR").append(cv2);
		$("#resultR").append(cv3);  */
 		$(".paging").append(newPaging);
		console.log("여기까지 오나?");
	}

</script>


</body>

</html>