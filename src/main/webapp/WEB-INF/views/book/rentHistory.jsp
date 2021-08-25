<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/head.jsp" %>

<head>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<style type="text/css">
	
		.rentTable{
			width:1500px;
			border-left: none;
			border-bottom: none;
			border-right: none;
			position: absolute;
			position: absolute;
		}
		
			
	th{
		border-left: none;
		border-right: none;
		border-color: gray;
	}
	
	td{
		border: none;
		padding-top: 3px;
	}
	
	.backPage{
		margin-left: 310px;
	}
	
	h2{
		width:500px;
		margin-left: 300px;
		color:rgb(051,051,102);
		font-weight: bold;
	}
	
	#canBtn,#longBtn{
		color:blue;
	}
	
	#canBtn:hover,#longBtn:hover {
		text-decoration: underline;
	}
	
	#titleColor{
		color: black;
	}
	
	</style>

</head>
<body>
	
	<br>
	<h2 >대출내역</h2>
	<div class="backPage" style="width:80vw;">
		<a style="color: gray"><i class="fas fa-book"></i></a> > 대출내역<br>
	</div>
	<br>
	
	<div class="rentHisDiv">
					
		<table class="rentTable" style="text-align: center;margin-left: 250px" border="1">
	       <thead>
	           <tr>
	               <th style="width: 150px; height:20%;"><span>대출번호</span></th>
	               <th style="width: 150px; height:20%;"><span>도서번호</span></th>
	               <th style="width: 800px;"><span>도서 제목</span></th>
	               <th style="width: 150px;"><span>대출신청일자</span></th>
	               <th style="width: 150px;"><span>대출가능기간</span></th>
	               <th id="cancelRent" style="width: 200px;"><span>대출 현황</span></th>
	           </tr>
	       </thead>
	       <tbody id="resultR"> 
	       	   	<c:forEach var="rent" items="${rList}" varStatus="status">
	       			<tr id="tdvalue">
		       			<td>${rent.R_IDX }</td>
		       			<td>${rent.B_IDX }</td>
		       			<td><a id="titleColor" href="/potal/bookInfo?bIdx=${rent.B_IDX}">${rent.TITLE }</a></td> 
		       			<td>${rent.REGDATE }</td>
		       			<td>${rent.RETURN_DATE }</td>
		       			
		       			<c:choose>
		       				<c:when test="${rent.ALLOW == 0}">          									
		       					<td id="cancelRent">	       					 				
	       							신청완료<a id="canBtn" onclick="delRent('${rent.B_IDX}','${rent.R_IDX}','${rent.USER_ID}','${rent.TITLE }')">(취소하기)</a>
	       							<input type="hidden" value = ${rent.R_IDX } id="CRIDX">
	       							<input type="hidden" value = ${rent.B_IDX } id="CBIDX">
	       							<input type="hidden" value = ${rent.TITLE } id="Ctitle">     
		       					</td>   	       										
		       				</c:when>
		       				<c:when test="${rent.ALLOW == 1 }">
		       				   	<td id="longRent">대출중<a id="longBtn" onclick="longRent('${rent.USER_ID}','${rent.R_IDX}','${rent.TITLE}')">(연장하기)</a></td>
		       				</c:when>
		       				<c:otherwise>
		       					<td id="finRent">대출완료(반납)</td>      					
		       				</c:otherwise>
		       			</c:choose>
		       			       			
	       			</tr>
				</c:forEach>
	       </tbody>
	    </table>
	    
	    <br><br><br> 

	</div>
				
		
</body>

<script>

	function delRent(bIdx,rIdx,id,title){

		var check = confirm("대출번호 "+rIdx+"\n'"+title+"' \n대출신청을 취소합니다");
		console.log("취소여부 : "+ check);
		
		if(check == false){
			return;
		}
		
/* 		var bIdx = bIdx;
		var rIdx = rIdx;
		var id = id; */

		console.log(bIdx);
		console.log(rIdx);
		console.log(id);
		console.log(title);
		
		$.ajax({
			url : "delRentHis",
			type : "POST",
			data : {
				rIdx : rIdx,
				bIdx : bIdx,
				id : id
			},
			dataType : "JSON",
			success : rentList,
			error : function(error) {
				console.log("에러발생");
			}			
		})
		
	}
	
	function rentList(data){
		
		var cv = "";
		var cnt = 0;
		
		$("#resultR").empty();
		
		console.log("data : "+data);
		
		$.each(data, function(i, map) {
			
		console.log(data[i]);
		cnt = data.length;
		console.log(cnt);
		console.log(data[i]["TITLE"]);
		console.log(data[i]["R_IDX"]);
		console.log(data[i]["ALLOW"]);
		var title = data[i]["TITLE"];
		var rIdx = data[i]["R_IDX"];
		var allow = data[i]["ALLOW"];
		
		if(data[i]["ALLOW"] == 0){
			cv += "<tr><td>"+data[i]["R_IDX"]+"</td><td>"+data[i]["B_IDX"]+"</td><td><a id='titleColor' href='/potal/bookInfo?bIdx="+data[i]["B_IDX"]+"'>"+data[i]["TITLE"]+"</a></td>"
					+"<td>"+data[i]["REGDATE"]+"</td><td>"+data[i]["RETURN_DATE"]+"</td>"
					+"<td id='cancelRent'>신청완료<a id='canBtn' onclick='delRent(\""+data[i]["B_IDX"]+"\",\""+data[i]["R_IDX"]+"\",\""+data[i]["USER_ID"]+"\",\""+data[i]["TITLE"]+"\")'>(취소하기)</a>"
					+"<input type='hidden' value="+data[i]["R_IDX"]+" id='CRIDX'>"
					+"<input type='hidden' value="+data[i]["B_IDX"]+" id='CBIDX'>"
					+"<input type='hidden' value="+data[i]["TITLE"]+" id='Ctitle'></td></tr>";
		}else if(data[i]["ALLOW"] == 1){
			cv += "<tr><td>"+data[i]["R_IDX"]+"</td><td>"+data[i]["B_IDX"]+"</td><td><a id='titleColor' href='/potal/bookInfo?bIdx="+data[i]["B_IDX"]+"'>"+data[i]["TITLE"]+"</a></td>"
					+"<td>"+data[i]["REGDATE"]+"</td><td>"+data[i]["RETURN_DATE"]+"</td>"
					+"<td id='longRent'>대출중<a id='longBtn' onclick='longRent(\""+data[i]["USER_ID"]+"\",\""+data[i]["R_IDX"]+"\",\""+data[i]["TITLE"]+"\")'>(연장하기)</a></td></tr>";
		}else{
			cv += "<tr><td>"+data[i]["R_IDX"]+"</td><td>"+data[i]["B_IDX"]+"</td><td><a id='titleColor' href='/potal/bookInfo?bIdx="+data[i]["B_IDX"]+"'>"+data[i]["TITLE"]+"</a></td>"
					+"<td>"+data[i]["REGDATE"]+"</td><td>"+data[i]["RETURN_DATE"]+"</td>"
					+"<td id='finRent'>대출완료(반납)</td></tr>";
		}

		
		
		console.log(cv);
			
		})
		
		alert("대출신청이 취소처리 되었습니다.");
	 	$("#resultR").append(cv);
		
	}
	
	function longRent(id,rIdx,title){
		
		var check = confirm("대출번호 "+rIdx+"\n'"+title+"' \n대출기간을 연장합니다");
		console.log("취소여부 : "+ check);
		
		if(check == false){
			return;
		}
		
		$.ajax({
			url : "upRentReturn",
			type : "POST",
			data : {
				rIdx : rIdx,
				id : id
			},
			dataType : "JSON",
			success : longList,
			error : function(error) {
				console.log("에러발생");
			}			
		})
		
	}
	
	function longList(data){
		
		var cv = "";
		var cnt = 0;
		
		$("#resultR").empty();
		
		console.log("data : "+data);
		
		$.each(data, function(i, map) {
			
		console.log(data[i]);
		cnt = data.length;

		var title = data[i]["TITLE"];
		var rIdx = data[i]["R_IDX"];
		var allow = data[i]["ALLOW"];
		
		if(data[i]["ALLOW"] == 0){
			cv += "<tr><td>"+data[i]["R_IDX"]+"</td><td>"+data[i]["B_IDX"]+"</td><td><a id='titleColor' href='/potal/bookInfo?bIdx="+data[i]["B_IDX"]+"'>"+data[i]["TITLE"]+"</a></td>"
					+"<td>"+data[i]["REGDATE"]+"</td><td>"+data[i]["RETURN_DATE"]+"</td>"
					+"<td id='cancelRent'>신청완료<a id='canBtn' onclick='delRent(\""+data[i]["B_IDX"]+"\",\""+data[i]["R_IDX"]+"\",\""+data[i]["USER_ID"]+"\",\""+data[i]["TITLE"]+"\")'>(취소하기)</a>"
					+"<input type='hidden' value="+data[i]["R_IDX"]+" id='CRIDX'>"
					+"<input type='hidden' value="+data[i]["B_IDX"]+" id='CBIDX'>"
					+"<input type='hidden' value="+data[i]["TITLE"]+" id='Ctitle'></td></tr>";
		}else if(data[i]["ALLOW"] == 1){
			cv += "<tr><td>"+data[i]["R_IDX"]+"</td><td>"+data[i]["B_IDX"]+"</td><td><a id='titleColor' href='/potal/bookInfo?bIdx="+data[i]["B_IDX"]+"'>"+data[i]["TITLE"]+"</a></td>"
					+"<td>"+data[i]["REGDATE"]+"</td><td>"+data[i]["RETURN_DATE"]+"</td>"
					+"<td id='longRent'>대출중<a id='longBtn' onclick='longRent(\""+data[i]["USER_ID"]+"\",\""+data[i]["R_IDX"]+"\",\""+data[i]["TITLE"]+"\")'>(연장하기)</a></td></tr>";
		}else{
			cv += "<tr><td>"+data[i]["R_IDX"]+"</td><td>"+data[i]["B_IDX"]+"</td><td><a id='titleColor' href='/potal/bookInfo?bIdx="+data[i]["B_IDX"]+"'>"+data[i]["TITLE"]+"</a></td>"
					+"<td>"+data[i]["REGDATE"]+"</td><td>"+data[i]["RETURN_DATE"]+"</td>"
					+"<td id='finRent'>대출완료(반납)</td></tr>";
		}

		
		
		console.log(cv);
			
		})
		
		alert("대출연장이 정상처리 되었습니다.");
	 	$("#resultR").append(cv);
		
	}


</script>

</html>