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
                <div class="sidebar-brand-text mx-3">TB UNIVERSITY</div>
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
                       		<a class="collapse-item" href="notLog();">교과목 조회</a>
                       		<a class="collapse-item" onclick="notLog();">E-Class</a>
                       	</c:if>
                        <c:if test="${!empty login }"> <!-- 로그인 -->
                        	<c:forEach var="info" items="${login }" varStatus="status">
		                    	<form method="POST" action="<%=request.getContextPath()%>/potal/scheduleIndex" id="schForm">	
		                    		<input type="hidden" value="${info.userId }" name="userId">
	                       			<a class="collapse-item" onclick="onSubmit();">수업시간표</a>	
		                        </form>
	                        </c:forEach>
	                        <a class="collapse-item" href="#">교과목 조회</a>
	                        <c:forEach var="info" items="${login }" varStatus="status">
	                       		<a class="collapse-item" href="<%=request.getContextPath()%>/potal/classIndex?userId=${info.userId }">E-Class</a>
	                       	</c:forEach>
                        </c:if>
                    </div>
                </div>
            </li>

            <!-- Nav Item - Utilities Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities"
                    aria-expanded="true" aria-controls="collapseUtilities">
                    <i class="fas fa-graduation-cap"></i>
                    <c:if test="${!empty login }">
	                    <c:forEach var="info" items="${login }" varStatus="status">
	                    	<c:if test="${info.type eq 1 }">
	                    		<span>성적</span>
	                    	</c:if>
	                    	<c:if test="${info.type eq 2 }">
	                    		<span>학생 / 성적</span>
	                    	</c:if>
	                    </c:forEach>
                    </c:if>
                    <c:if test="${empty login }">
                    	<span>성적</span>
                    </c:if>
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
                        			<a class="collapse-item" href="<%=request.getContextPath()%>/potal/gradeIndex?userId=${info.userId }&type=1">성적조회 (현학기)</a>
                        			<a class="collapse-item" href="<%=request.getContextPath()%>/potal/gradeIndex?userId=${info.userId }&type=2">성적조회 (전학기)</a>
                        		</c:if>
                        		<c:if test="${info.type eq 2 }"> <!-- 교수 -->
                        			<a class="collapse-item" href="/potal/gradeAll?pId=${info.userId}">성적입력</a>
                        			<a class="collapse-item" href="/potal/gradeUpdateAll?pId=${info.userId}">성적수정</a>
                        			<a class="collapse-item" href="/potal/findStudentInfo?pId=${info.userId }&mIdx=${info.mIdx}">학생 조회</a>
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
                        <a class="collapse-item" href="<%=request.getContextPath()%>/potal/tuitionIndex">등록금조회</a>
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
                        <c:forEach var="info" items="${login }" varStatus="status">
                        	<a class="collapse-item" href="<%=request.getContextPath()%>/potal/schIndex?userId=${info.userId}&name=${info.name}">장학금조회</a>
                    	</c:forEach>
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
                    	<c:if test="${empty login }"> <!-- 비로그인 -->
                        <a class="collapse-item" onclick="notLog();">도서 조회/대출</a>
                        </c:if>
                         <c:if test="${!empty login }"> <!-- 로그인 -->
                        <a class="collapse-item" href="/potal/book">도서 조회/대출</a>
                        <form method="GET" action="potal/rentHistory" id="rentForm">
	                        <c:forEach var="User" items="${login}" varStatus="status">   
	                        <input type="hidden" value="${User.userId }" name="userId">  
	                        <a class="collapse-item" onclick="test();">대출조회</a>         
	                        </c:forEach>                 
                        </form>
                        </c:if>
                    </div>
                </div>
            </li>
            
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages3"
                    aria-expanded="true" aria-controls="collapsePages3">
                    <i class="fab fa-hire-a-helper"></i>
                    <span>서비스</span>
                </a>
                <div id="collapsePages3" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                    	<c:if test="${empty login }"> <!-- 비로그인 -->
                        <a class="collapse-item" onclick="notLog();">민원 조회/신청</a>
                        </c:if>
                         <c:if test="${!empty login }"> <!-- 로그인 -->
                        <a class="collapse-item" href="/potal/serviceList">민원 조회/신청</a>
                        <form method="GET" action="/potal/reqService" id="serForm">
	                        <c:forEach var="User" items="${login}" varStatus="status">   
	                        <input type="hidden" value="${User.userId }" name="userId">  
	                         <a class="collapse-item" onclick="test1();">민원신청내역</a>       
	                        </c:forEach>                 
                        </form>
                        </c:if>
                       <!--  <a class="collapse-item" href="/potal/reqService">민원신청내역</a> -->
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
</div>
               <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                    <!-- Sidebar Toggle (Topbar) -->
                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button>

                    <!-- Topbar Search -->
                    <form
                        class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                        <div class="input-group">
                            <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..."
                                aria-label="Search" aria-describedby="basic-addon2">
                            <div class="input-group-append">
                                <button class="btn btn-primary" type="button">
                                    <i class="fas fa-search fa-sm"></i>
                                </button>
                            </div>
                        </div>
                    </form>
					
					<!-- 로그인 화면 -->
                    <!-- Topbar Navbar -->
                    <c:if test="${!empty login }">
                    <ul class="navbar-nav ml-auto">

                        <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                        <li class="nav-item dropdown no-arrow d-sm-none">
                            <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-search fa-fw"></i>
                            </a>
                            <!-- Dropdown - Messages -->
                            <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                                aria-labelledby="searchDropdown">
                                <form class="form-inline mr-auto w-100 navbar-search">
                                    <div class="input-group">
                                        <input type="text" class="form-control bg-light border-0 small"
                                            placeholder="Search for..." aria-label="Search"
                                            aria-describedby="basic-addon2">
                                        <div class="input-group-append">
                                            <button class="btn btn-primary" type="button">
                                                <i class="fas fa-search fa-sm"></i>
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </li>
	                        <div class="topbar-divider d-none d-sm-block"></div>
	                        <!-- Nav Item - User Information -->
	                        <li class="nav-item dropdown no-arrow">
	                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
	                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                               	<c:forEach var="login" items="${login }" varStatus="status">
	                                	<span class="mr-2 d-none d-lg-inline text-gray-600 small">${login.name }</span>
	                                </c:forEach>
	                                <img class="img-profile rounded-circle"
	                                    src="/resources/img/undraw_profile.svg">
	                            </a>
	                            <!-- Dropdown - User Information -->
	                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
	                                aria-labelledby="userDropdown">
	                                <a class="dropdown-item" href="<%=request.getContextPath()%>/potal/myPageIndex">
	                                    <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
	                                 	내 정보
	                                </a>
	                                <div class="dropdown-divider"></div>
	                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
	                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
	                                   	로그아웃
	                                </a>
	                            </div>
	                        </li>
                    </ul>
                    </c:if>
					<c:if test="${empty login }">
						<form method="GET" action="<%=request.getContextPath()%>/potal/login" id="loginForm">
							<input type="submit" value="로그인" class="loginBtn">
						</form>
					</c:if>
					<!-- 여기까지 -->
                </nav>
                <!-- End of Topbar -->
                    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">로그아웃 하시겠습니까?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
                    <form method="GET" action="<%=request.getContextPath()%>/potal/logout" id="logoutForm">
                    	<button class="btn btn-primary" type="submit">로그아웃</button>
                    </form>
                </div>
            </div>
        </div>
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


