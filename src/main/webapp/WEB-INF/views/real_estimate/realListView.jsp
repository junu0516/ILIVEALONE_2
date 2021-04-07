<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"/>
<title>부동산</title>
<style>
html,body{width:100%;height:100%}
body,p,h1,h2h3,h4,h5,h6,ul,ol,li,dl,dt,dd,table,th,td,form,fieldset,legend,input,textarea,button,select{margin:0;padding:0}
img,filedset{border:0;}
ul,ol{list-style:none;}
em,address{font-style:normal;}
a{text-decoration:none;}
a:hover, a:active,a:focus{text-decoration;underline;}
.b{
padding:10px;
}
#list{
overflow-y:auto; 
}
strong{
word-break : nowrap;
}
    #page-top{
padding-top:13px;
}
.input-group{
padding:10px;
}


</style>
<!--
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
-->

</head>
<jsp:include page="../common/header.jsp"/>

<body id="page-top">
		<script>
	function formChange(obj) {
		obj.submit();
	}
</script>
		<br><br>
		
		<!-- 바디 부분 -->
	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<ul
			class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
			id="accordionSidebar">

			<!-- Sidebar - Brand -->
			<a
				class="sidebar-brand d-flex align-items-center justify-content-center"
				href="list.re">
				<div class="sidebar-brand-icon rotate-n-15">
					<i class="fas fa-laugh-wink"></i>
				</div>
				<div class="sidebar-brand-text mx-3">부동산</div>
			</a>

			<!-- Divider -->
			<hr class="sidebar-divider my-0">

			<!-- Nav Item - Dashboard -->
			<li class="nav-item"><a class="nav-link" onclick="postFormSubmit()" style="cursor: pointer">
					<i class="fas fa-fw fa-tachometer-alt"></i> <span>찜한 목록</span>
			</a></li>
			
			<!-- Divider -->
			<hr class="sidebar-divider">

			<li class="nav-item"><a class="nav-link" onclick="enroll()">
					<i class="fas fa-fw fa-tachometer-alt"></i> <span>매물 등록</span>
			</a></li>
			
			</li>

		</ul>
		<!-- End of Sidebar -->
		
		
		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                    <!-- Sidebar Toggle (Topbar) -->
                    <form class="form-inline">
                        <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                            <i class="fa fa-bars"></i>
                        </button>
                    </form>

                    <!-- Topbar Search -->
                    <form action="houselist" method="get">
                    
                        <div class="input-group" style="margin-left:20%;">
                           
                            <div class="input-group-prepend" style="padding:10px;">
                            	<input type="text" class="form-control bg-light border-0 small" placeholder="Search for..."
                                aria-label="Search" aria-describedby="basic-addon2" name="search">
                                <button class="btn btn-primary">
                                    <i class="fas fa-search fa-sm"></i>
                                </button>
                            </div>
                            
                            <div class="input-group-append" style="padding:10px;">
                            <select name="type" onchange="formChange(this.form)" class="form-control bg-light border-0 small">
								<option value="none" <c:if test="${type eq 'none'}">selected</c:if>>방
								타입</option>
								<option value="원룸" <c:if test="${type eq '원룸'}">selected</c:if>>원룸</option>
								<option value="투룸" <c:if test="${type eq '투룸'}">selected</c:if>>투룸</option>
								<option value="오피스텔" <c:if test="${type eq '오피스텔'}">selected</c:if>>오피스텔</option>
								<option value="아파트" <c:if test="${type eq '아파트'}">selected</c:if>>아파트</option>
							</select>
							</div>
							
							<div class="input-group-append" style="padding:10px;">
							<select name="setype" onchange="formChange(this.form)" class="form-control bg-light border">
								<option value="none"
									<c:if test="${setype eq 'none'}">selected</c:if>>세 종류</option>
								<option value="월세" <c:if test="${setype eq '월세'}">selected</c:if>>월세</option>
								<option value="전세" <c:if test="${setype eq '전세'}">selected</c:if>>전세</option>
							</select>
							</div>
							
							<div class="input-group-append" style="padding:10px;">
							<select name="money" onchange="formChange(this.form)" class="form-control bg-light border">
								<option value="none" <c:if test="${money eq 'none'}">selected</c:if>>가격대</option>
								<c:if test="${setype eq '월세'}">
									<option value="30" <c:if test="${money eq '30'}">selected</c:if>>0~30만원</option>
									<option value="60" <c:if test="${money eq '60'}">selected</c:if>>30~60만원</option>
									<option value="90" <c:if test="${money eq '90'}">selected</c:if>>60~90만원</option>
									<option value="120" <c:if test="${money eq '120'}">selected</c:if>>90~120만원</option>
									<option value="max" <c:if test="${money eq 'max'}">selected</c:if>>120만원
										이상</option>
								</c:if>
								<c:if test="${setype eq '전세'}">
									<option value="1" <c:if test="${money eq '1'}">selected</c:if>>0~1억</option>
									<option value="2" <c:if test="${money eq '2'}">selected</c:if>>1억~2억</option>
									<option value="3" <c:if test="${money eq '3'}">selected</c:if>>2억~3억</option>
									<option value="max" <c:if test="${money eq 'max'}">selected</c:if>>3억
										이상</option>
								</c:if>
							</select>
							</div>
							
							<div class="input-group-append" style="padding:10px;">
							<select name="admin" onchange="formChange(this.form)" class="form-control bg-light border">
								<option value="none" <c:if test="${admin eq 'none'}">selected</c:if>>관리비</option>
								<option value="5" <c:if test="${admin eq '5'}">selected</c:if>>~5만</option>
								<option value="10" <c:if test="${admin eq '10'}">selected</c:if>>~10만</option>
								<option value="20" <c:if test="${admin eq '20'}">selected</c:if>>~20만</option>
							</select>
							</div>
							
							<div class="input-group-append" style="padding:10px; margin-right:0px;">
							<input type="button" value="필터 초기화" class="form-control bg-light border" onclick="location.href='list.re'">
							</div>
							
                        </div>
                        
                    </form>

                </nav>
                <!-- End of Topbar -->
				

				<!-- Begin Page Content -->
				<div class="container-fluid">
	
	<div class="container" style="height:1000px">
	
	<br><br>

	<jsp:include page="realMap.jsp"/>
	<jsp:include page="realList.jsp"/>
	
	</div>
    
	  </div>
				<!-- /.container-fluid -->

			</div>
			<!-- End of Main Content -->

		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<form id="postForm" action="wishform.re" method="post"> <!-- 삭제, 수정 시 필요한 매물 번호와 이미지 제목을 위한 form -->
				<input type="hidden" name="userId" value="${loginUser.getUserId() }">
			</form>
			
			<c:if test="${ !empty loginUser }">
			<script>
				
				function postFormSubmit() {
					var postForm = $("#postForm");

					postForm.submit();
				}
				function enroll(){
					location="enrollform.re"
				}
				</script>
			</c:if>
			<c:if test="${ empty loginUser }">
			<script>
				function postFormSubmit(){
				alert("로그인이 필요합니다.");
				}
				function enroll(){
					alert("로그인이 필요합니다.");
				}
			</script>
			</c:if>
		
 <jsp:include page="../common/footer.jsp"/>

</body>
</html>