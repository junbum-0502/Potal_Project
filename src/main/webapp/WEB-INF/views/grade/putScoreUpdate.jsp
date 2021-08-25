<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/head.jsp" %>

<head>

<style type="text/css">

	.putSD{
		margin-left: 300px;
		width: 80%;
	}
	 
	.putSB{
		width:150px;
		height:40px;
		border: none;
		background-color: #4e73df;
		color: white;
	}
	
	.putSB:hover {
		background-color: #224abe;
	}
	
	h2{
		width:500px;
		margin-left: 300px;
		color:rgb(051,051,102);
		font-weight: bold;
	}
	 
	.backPage{
		margin-left: 310px;
	}
	
	#warn{
		color: red;
		margin-left: 80px;
	}
 
</style>

</head>
<body>
	<br>
	<h2 >성적수정</h2>
	<div class="backPage" style="width:80vw;">
		<a style="color: gray"> <i class="fas fa-graduation-cap"></i></a> > 과목선택 > 학생선택 > 성적수정<br>
	</div>
	<br>
	
	<c:if test="${empty scoList}">
		<small>
				<span id="warn">
					※성적입력을 하지 않았다면 해당 학생의 성적 정보가 화면에 출력되지 않습니다.<br>
				</span>
		</small>
	</c:if>
	
	<br>
	
	<div class="putSD">
	<c:forEach var="sc" items="${scoList}" varStatus="status">
	<form method="post" id="scoreForm" action="/potal/updateScoreUpdate">
	
	과목 번호 : <input type="text" id="idx" name="idx" value="${idx }"><br><br>
	학생 번호 : <input type="text" id="uid" name="uid" value="${uid }"><br><br>
	학생 이름 : <input type="text" id="name" name="name" value="${sc.NAME }"><br><br>
	중간 점수 : <input type="text" id="mid" name="mid" value="${sc.MID_SCORE }"><br><br>
	기말 점수 : <input type="text" id="final" name="final" value="${sc.FINAL_SCORE }"><br><br>
	총합 점수 : <input type="text" id="score" name="score" value="${sc.SCORE }"><br><br>
	최종 학점 : <input type="text" id="credit" name="credit" value="${sc.CREDIT }"><br><br>
	최종 학점 : <input type="text" id="grade" name="grade" value="${sc.GRADE }"><br><br>
	수강 학기 : <input type="text" id="semester" name="semester" value="${sc.YEAR_SEMESTER }"><br>
	
	<input type="hidden" value="${pid}" id="pid" name="pid">

	 
	<br><br><br>
	</form>	
	<button class="putSB" onclick="sub()">성적 수정하기</button>
	</c:forEach>
	</div>
	
</body>

 <script>

		function sub(){
			
			var mid = document.getElementById("mid").value;
			var finalS = document.getElementById("final").value;
			var score = document.getElementById("score").value;
			var credit = document.getElementById("credit").value;
			var grade = document.getElementById("grade").value;
			
 			if(mid == ""){
				alert("중간고사 성적을 입력하세요.");
				document.getElementById("mid").focus();
				return false;				
			}else if(finalS == ""){
				alert("기말고사 성적을 입력하세요.");
				document.getElementById("final").focus();
				return false;
			}else if(score == ""){
				alert("총합 성적을 입력하세요.");
				document.getElementById("score").focus();
				return false;
			}else if(credit == ""){
				alert("학점을 입력하세요.");
				document.getElementById("credit").focus();
				return false;
			}else if(grade == ""){
				alert("학점을 입력하세요.");
				document.getElementById("grade").focus();
				return; 
			}else{
				alert("성적이 수정되었습니다.");
				scoreForm.submit();
			} 						

		}
 
</script>
</html>