<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<%@ page import="java.io.File" %>

<head>

<style type="text/css">

	.report{
		 float: right; 
		 margin-right: 150px;
	}

	.serviceBtn{
		width:150px;
		height:40px;
		border: none;
		color: #fff;
    	background-color: #4e73df;
    	margin-top: 550px;
    	position: absolute;
	}
	 
	.serviceBtn:hover {
		background-color: #224abe;
	}
	
 	.normalA{
		color:gray;
		text-decoration: underline;
	}
	
	.normalA:hover {
		color:rgb(051,051,102);
	}
	
	h2{
		width:500px;
		margin-left: 300px;
		color:rgb(051,051,102);
		font-weight: bold;
		margin-top: 30px;
	}
	
	h4{
		color:rgb(051,051,102);
	}
	
	.btnDiv{
		margin: auto;
	    width: 0px;
	    margin-top: 10px;
	}
	
	.backPage{
		margin-left: 310px;
	}
	
	.info{
	    margin: auto;
	    width: 600px;
	    height: 200px;
	    text-align: center;
        outline: auto;
        outline-color: #4e73df;
    	transform: translateX(80px);
    	margin-left: 570px;
    	position: absolute;
	}
	
	.serviceImg{
		width: 60%;
		height: 300px;
		margin-left:200px;
		position: absolute;
    	margin-top: 200px;
	} 
  
</style> 

</head>
<body>

	<h2>취업계 신청</h2>
	<div class="backPage" style="width:80vw;">
		<a style="color: gray" href="/potal/serviceList"> <i class="fab fa-hire-a-helper"></i></a> > 취업계 신청<br>
	</div>
	
	<div class="report">
	<small style="margin-right: 15px">첨부파일</small>
	<a  class="normalA" href="<c:url value="/resources/file/취업계 신청서 양식.docx"/>">취업계 신청서 양식.docx</a>
	</div>

<br><br><br>
	
	<div class="info">
	<br>
	<h4>＊취업계 신청 방법＊</h4><br>
	
	1. 우측 상단의 <span style="font-weight: bold; margin-left: 3px; margin-right: 3px;"> '취업계 신청서 양식' </span> 출력<br>
	2. 화면 하단의 <span style="font-weight: bold; margin-left: 3px; margin-right: 3px;"> '신청하기' </span> 버튼 클릭<br>
	3. 출력한 신청서를 양식에 맞게 작성한 후 본교 <span style="font-weight: bold; margin-left: 3px; margin-right: 3px;"> '교무처' </span> 방문 후 휴학신청 진행<br>
	</div>
	
	<br><br>
	
	 <img class="serviceImg" src="/resources/img/민원신청.jpg">
	
	<div class="btnDiv">
		<button class="serviceBtn" onclick="pageMove()">신청하기</button>
	</div>

<c:forEach var="User" items="${login}" varStatus="status">	
		<input type="hidden" value="${User.userId}" name="id" id="id">
</c:forEach>

</body>

<script>

	function pageMove(){
		var id = document.getElementById("id").value;
		
		var check = confirm("\n※휴학 신청 방법을 잘 확인하시고, 절차에 따라 진행하시기 바랍니다.\n"
				+"\n취업계 신청을 접수하시겠습니까?");
		
		
		if(check == false){
			alert("취업계 신청 접수를 취소합니다.");
			return;
		}
		
		alert("취업계 신청이 접수되었습니다. \n신청 내역 페이지로 이동합니다.")
		location.href = "/potal/listCheck?id="+id+"&stIdx=1001";
		
	}

</script>

</html>