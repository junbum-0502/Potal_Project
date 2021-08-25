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
	    width: 650px;
	    height: 200px;
	    text-align: center;
        outline: auto;
        outline-color: #4e73df;
    	transform: translateX(80px);
    	margin-left: 570px;
    	position: absolute;
	}
	
	.serviceImg{
	    width: 50%;
	    height: 300px;
	    margin-left: 300px;
		position: absolute;
    	margin-top: 200px;
	} 
  
</style> 

</head>
<body>

	<h2>공인결석 신청</h2>
	<div class="backPage" style="width:80vw;">
		<a style="color: gray" href="/potal/serviceList"> <i class="fab fa-hire-a-helper"></i></a> > 공인결석 신청<br>
	</div>
	
	<div class="report">
	<small style="margin-right: 15px">첨부파일</small>
	<a  class="normalA" href="<c:url value="/resources/file/공인결석 신청서 양식.docx"/>">공인결석 신청서 양식.docx</a>
	</div>

<br><br><br>
	
	<div class="info">
	<br>
	<h4>＊공인결석 신청 방법＊</h4><br>
	  
	1. 우측 상단의 <span style="font-weight: bold; margin-left: 3px; margin-right: 3px;"> '공인결석 신청서 양식' </span> 출력<br>
	2. 출력한 공인결석 신청서를 양식에 맞게 작성한 후 <span style="font-weight: bold; margin-left: 3px; margin-right: 3px;"> '담당 교수님' , '학과사무실' </span>에 제출<br><br>
	<div style="color:red;">
	※ 정당하지 않은 사유에 대해서는 공인결석 처리가 되지 않습니다.
	</div>
	</div>
	 
	<br><br>
	
	 <img class="serviceImg" src="/resources/img/공결서 신청.png">
	

<c:forEach var="User" items="${login}" varStatus="status">	
		<input type="hidden" value="${User.userId}" name="id" id="id">
</c:forEach>

</body>



</html>