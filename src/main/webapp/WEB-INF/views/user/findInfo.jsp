<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<style>
#result {
	color: blue;
	margin-top: 0;
}

#result2 {
	color: red;
	margin-top: 0;
}

.tab_menu li {
	overflow: auto;
	/* hidden : 화면이 정해지면 최대한 보여줄 수 있는 만큼 보여주고 넘치는 부분은 안보여줌 */
	/* auto : width 또는 height 를 하나만 지정한다면 지정한 것에 대해서만 제한을 걸어주고 다른 부분은 늘어나면서 보여지게 됌 */
	padding: 10px;
	border: black solid 1px;
	border-top: none;
}

.thumnail {
	float: left;
}

/* 라디오 첫번째가 눌려지면  형제 중 label 첫째가 선택되도록 함 */
input:nth-of-type(1):checked ~ label:nth-of-type(1) {
	background-color: #4e73df;
	color: #fff;
}
/* 라디오 두번째가 눌려지면  형제 중 label 둘째가 선택되도록 함 */
input:nth-of-type(2):checked ~ label:nth-of-type(2) {
	background-color: #4e73df;
	color: #fff;
}

aside>div {
	display: none;
}
/* 라디오 첫번째가 눌려지면  형제 중 div 첫째가 display 되도록 함 */
input:nth-of-type(1):checked ~ div:nth-of-type(1) {
	display: block;
}
/* 라디오 두번째가 눌려지면  형제 중 div 둘째가 display 되도록 함 */
input:nth-of-type(2):checked ~ div:nth-of-type(2) {
	display: block;
}

#main_aside {
	width: 400px;
	margin: auto;
}

label {
	/* display: inline-block; */
	display: block;
	float: left;
	width: 50%;
	height: 30px;
	border: 1px solid black;
	box-sizing: border-box;
	text-align: center;
	line-height: 30px;
	background-color: #fff;
	color: black;
}

aside>div {
	display: none;
}

#first {
	display: none;
}

#second {
	display: none;
}

.tab_menu {
	text-align: center;
}

input[type="text"] {
	height: 40px;	
	width: 392px;
	margin-bottom: 20px;
	border-radius: 5px;
}

.idName {
	margin-top: 20px;
}

.logo {
	width: 250px;
    margin-bottom: 20px;
}

.find {
	text-align: center;
    margin: auto;
    margin-top: 300px;
}

.findBtn {
	border-radius: 6px;
	border: 0;
    height: 35px;
    width: 400px;
    color: #fff;
    background-color: #4e73df;
    margin-bottom: 10px;
}

.findBtn:hover {
	background-color: #224abe;
}

.id {
	border-top-left-radius: 5px;
    border-bottom-left-radius: 5px;
}

.pwd {
	border-top-right-radius: 5px;
    border-bottom-right-radius: 5px;
}

</style>
</head>
<body>
	<div class="find">
		<a href="<%=request.getContextPath()%>/potal"><input type="image" src="<%=request.getContextPath()%>/resources/img/logo1.PNG" class="logo"></a>
		<aside id="main_aside">
		    <input type="radio" name="tab" id="first" checked>
		    <input type="radio" name="tab" id="second">
		    <label for="first" class="id">아이디 찾기</label>
		    <label for="second" class="pwd">비밀번호 찾기</label>
		    <div class="tab_menu">
		        <!-- 아이디 찾기 -->
				<input type="text" id="name" class="idName" placeholder="이름을 입력해주세요.">
				<input type="text" id="birth" placeholder="생년월일을 입력해주세요."><br>
				<div id="info"></div>
				<button onclick="findId()" class="findBtn">찾기</button>
		    </div>
		    <div class="tab_menu">
		        <!-- 비밀번호 찾기 -->
				<input type="text" id="id" class="idName" placeholder="아이디를 입력해주세요."><br>
				<input type="text" id="name2" placeholder="이름을 입력해주세요."><br>
				<input type="text" id="phone" placeholder="핸드폰 번호를 입력해주세요. (-포함)"><br>
				<div id="info2"></div>
				<button onclick="findPwd()" class="findBtn">찾기</button><br>
		    </div>
		</aside>
	</div>
</body>
<script>
	function findId() { // 아이디, 비밀번호 찾기
		var name = document.getElementById("name").value;
		var birth = document.getElementById("birth").value;
		$.ajax({
			url : "findInfo",
			type : "POST",
			data : {
				name : name,
				birth : birth
			},
			dataType : "JSON",
			success : id,
			error : function(error) {
				console.log("실패");
			}
		})
	}

	function findPwd() {
		var id = document.getElementById("id").value;
		var name = document.getElementById("name2").value;
		var phone = document.getElementById("phone").value;
		$.ajax({
			url : "findInfo",
			type : "POST",
			data : {
				id : id,
				name : name,
				phone : phone
			},
			dataType : "JSON",
			success : pwd,
			error : function(error) {
				console.log("실패");
			}
		})
	}

	function id(data) {
		var cv = "";
		if (data != "") {
			$("#result").remove();
			$("#result2").remove();
			console.log("아이디 찾기 ajax 성공");
			console.log("data : " + data);
			$.each(data, function(i, list) {
				cv += "<p id='result'>아이디는 " + data[i].userId + " 입니다.</p>"
			})
			$("#info").append(cv);
		} else if (data == "") {
			$("#result").remove();
			$("#result2").remove();
			console.log("아이디 찾기 ajax 실패");
			console.log("data : " + data);
			cv += "<p id='result2'>잘못된 정보입니다.</p>"
			$("#info").append(cv);
		}
	}

	function pwd(data) {
		var cv = "";
		if (data != "") {
			$("#result").remove();
			$("#result2").remove();
			console.log("비밀번호 찾기 ajax 성공");
			console.log("data : " + data);
			$.each(data, function(i, list) {
				cv += "<p id='result'>비밀번호는 " + data[i].password + " 입니다.</p>"
			})
			$("#info2").append(cv);
		} else if (data == "") {
			$("#result").remove();
			$("#result2").remove();
			console.log("비밀번호 찾기 ajax 성공");
			console.log("data : " + data);
			cv += "<p id='result2'>잘못된 정보입니다.</p>"
			$("#info2").append(cv);
		}
	}
</script>
</html>