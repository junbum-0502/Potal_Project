<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%-- 모든 페이지에서 공통적으로 사용할 head를 작성한 페이지 --%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>TaeBumSik University Potal</title>
    
    <link href="/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">	
	<link
    href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
    rel="stylesheet">
<link href="/resources/css/sb-admin-2.min.css" rel="stylesheet">

<script type="text/javascript" src="/resources/js/common/asyncResponseError.js"></script>
<script type="text/javascript" src="/resources/js/common/urlEncoder.js"></script>



<c:set var="context" value="${pageContext.request.contextPath}"/>
<style type="text/css">
   a{
      text-decoration: none;   
      cursor:pointer;
   }
   
   #accordionSidebar{
   	min-height: 100vh;
   }
</style>


</head>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<body id="page-top">

 <div id="wrapper" style="float: left">
           <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/potal">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-laugh-wink"></i>
                </div>
                <div class="sidebar-brand-text mx-3">SB Admin <sup>2</sup></div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">
<!-- 
            Nav Item - Dashboard
            <li class="nav-item active">
                <a class="nav-link" href="index.html">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>Dashboard</span></a>
            </li> -->

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                수업/성적
            </div>

           <!--  Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
                    aria-expanded="true" aria-controls="collapseTwo">
                    <i class="fas fa-pencil-alt"></i>
                    <span>수업</span>
                </a>
                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
						<c:if test="${empty login }"> <!-- 비로그인 -->
                       		<a class="collapse-item" onclick="notLog();">수업시간표</a>
                       		<a class="collapse-item" onclick="notLog();">E-Class</a>
                       	</c:if>
                        <c:if test="${!empty login }"> <!-- 로그인 -->
	                    	<form method="POST" action="<%=request.getContextPath()%>/potal/schedule" id="schForm">
	                        		<a class="collapse-item" onclick="onSubmit();">수업시간표</a>	
	                        </form>
	                        <a class="collapse-item" href="">E-Class</a>
                        </c:if>
   							<c:if test="${empty login }"> <!-- 비로그인 -->
                        		<a class="collapse-item" href="#">교과목 조회</a>
                        	</c:if>
                        	<c:if test="${!empty login }"> <!-- 로그인 -->
                        		<a class="collapse-item" href="#">교과목 조회</a>
                        	</c:if>
                    </div>
                </div>
            </li>

            <!-- Nav Item - Utilities Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities"
                    aria-expanded="true" aria-controls="collapseUtilities">
                    <i class="fas fa-graduation-cap"></i>
                    <span>성적</span>
                </a>
                <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
   						<c:if test="${empty login }"> <!-- 비로그인 -->
                      		<a class="collapse-item" onclick="notLog();">성적조회 (현학기)</a>
                      		<a class="collapse-item" onclick="notLog();">성적조회 (전학기)</a>
                        </c:if>
                        <c:if test="${!empty login }"> <!-- 로그인 -->
                        	<c:forEach var="info" items="${login }" varStatus="status">
                       			<c:if test="${info.type eq 1 }"> <!-- 학생 -->
                        			<a class="collapse-item" href="#">성적조회 (현학기)</a>
                        			<a class="collapse-item" href="#">성적조회 (전학기)</a>
                        		</c:if>
                        		<c:if test="${info.type eq 2 }"> <!-- 교수 -->
                        			<a class="collapse-item" href="/potal/gradeAll?pId=${info.userId}">성적입력</a>
                        			<a class="collapse-item" href="#">성적수정</a>
                        			<a class="collapse-item" href="#">성적조회 (전학기)</a>
                        		</c:if>
                        	</c:forEach>
                        </c:if>
                    </div>
                </div>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                등록/장학
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages"
                    aria-expanded="true" aria-controls="collapsePages">
                    <i class="fas fa-clipboard"></i>
                    <span>등록</span>
                </a>
                <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="login.html">등록금조회</a>
                        <a class="collapse-item" href="register.html">등록금 납부확인서</a>
                    </div>
                </div>
            </li>
            
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages1"
                    aria-expanded="true" aria-controls="collapsePages1">
                    <i class="fas fa-comment-dollar"></i>
                    <span>장학</span>
                </a>
                <div id="collapsePages1" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="login.html">장학금조회</a>
                    </div>
                </div>
            </li>
            
            <hr class="sidebar-divider">
            
            <div class="sidebar-heading">
                도서관/서비스
            </div>
            
           <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages2"
                    aria-expanded="true" aria-controls="collapsePages2">
                    <i class="fas fa-book"></i>
                    <span>도서관</span>
                </a>
                <div id="collapsePages2" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
						<a class="collapse-item" href="/potal/book">도서 조회/대출</a>
                        <form method="GET" action="rentHistory" id="rentForm">
	                        <c:forEach var="User" items="${login}" varStatus="status">   
	                        <input type="hidden" value="${User.userId }" name="userId">  
	                        <a class="collapse-item" onclick="test();">대출조회</a>         
	                        </c:forEach>                 
                        </form>
                    </div>
                </div>
            </li>
            
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages3"
                    aria-expanded="true" aria-controls="collapsePages2">
                    <i class="fab fa-hire-a-helper"></i>
                    <span>서비스</span>
                </a>
                <div id="collapsePages3" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="/potal/serviceList">민원 조회/신청</a>
                        <a class="collapse-item" href="/potal/reqService">민원신청내역</a>
                    </div>
                </div>
            </li>
            
            <hr class="sidebar-divider">
            
            <div class="sidebar-heading">
                커뮤니티
            </div>
            
          <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages4"
                    aria-expanded="true" aria-controls="collapsePages4">
                    <i class="fas fa-clipboard"></i>
                    <span>게시판</span>
                </a>
                <div id="collapsePages4" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="login.html">자유 게시판</a>
                        <a class="collapse-item" href="login.html">익명 게시판</a>
                    </div>
                </div>
            </li>
            
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages5"
                    aria-expanded="true" aria-controls="collapsePages5">
                    <i class="fas fa-info"></i>
                    <span>공지사항</span>
                </a>
                <div id="collapsePages5" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="login.html">일반 공지사항</a>
                        <a class="collapse-item" href="register.html">학사 공지사항</a>
                    </div>
                </div>
            </li>





            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">

            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>

            <!-- Sidebar Message -->
            <div class="sidebar-card d-none d-lg-flex">
                <img class="sidebar-card-illustration mb-2" src="/resources/img/undraw_rocket.svg" alt="...">
                <p class="text-center mb-2"><strong>SB Admin Pro</strong> is packed with premium features, components, and more!</p>
                <a class="btn btn-success btn-sm" href="https://startbootstrap.com/theme/sb-admin-pro">Upgrade to Pro!</a>
            </div>

        </ul>
        
 
</div>

    <script src="/resources/vendor/jquery/jquery.min.js"></script>
    <script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="/resources/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="/resources/vendor/chart.js/Chart.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="/resources/js/demo/chart-area-demo.js"></script>
    <script src="/resources/js/demo/chart-pie-demo.js"></script>
	<script>
	function test() {
		rentForm.submit();
	}
	
	function onSubmit() {
		console.log("아아");
		$("#schForm").submit();
	}

	function notLog() {
		alert("로그인 해주세요.");
	}
	</script>
</body>


