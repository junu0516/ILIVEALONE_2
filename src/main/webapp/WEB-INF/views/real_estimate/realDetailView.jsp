<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html5>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Insert title here</title>
<style>
	#contentArea{width:100%}
	#contentArea *{margin:5px}
	.content{
        background-color:rgb(247, 245, 245);
        width:80%;
        margin:auto;
    }
    .innerOuter{
        border:1px solid lightgray;
        width:80%;
        margin:auto;
        padding:5% 10%;
        background:white;

    }
     #page-top{
padding-top:13px;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Custom fonts for this template -->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/sb-admin-2.min.css" rel="stylesheet">

<!-- Custom styles for this page -->
<link href="vendor/datatables/dataTables.bootstrap4.min.css"
	rel="stylesheet">
</head>

		<jsp:include page="../common/header.jsp"/>
		
<body id="page-top">

<c:if test="${ !empty result }">
	<script>
	if(${result}==0){
		alert("이미 찜했거나 찜하기에 실패했습니다.");
	}else if( ${result}==1){
		alert("찜하기 성공!");
	}
	</script>
</c:if>
	
		
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

			
<c:if test="${ !empty loginUser }">
			<!-- Nav Item - Dashboard -->
			<li class="nav-item"><a class="nav-link" onclick="postFormSubmit()" style="cursor: pointer">
					<i class="fas fa-fw fa-tachometer-alt"></i> <span>찜한 목록</span>
			</a></li>
			
			<!-- Divider -->
			<hr class="sidebar-divider">

			<li class="nav-item"><a class="nav-link" href='enrollform.re'>
					<i class="fas fa-fw fa-tachometer-alt"></i> <span>매물 등록</span>
			</a></li>
			
			</li>
			
			
</c:if>


		</ul>
		<!-- End of Sidebar -->
		
		
		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">



				<!-- Begin Page Content -->
				<div class="container-fluid">
	
	<div class="container" style="height:1200px">
	
        <br><br>
        <div class="innerOuter">
            <h2 style="align:center">매물 상세보기</h2>
            
            <br><br>
            
            <c:if test="${ !empty r.originName }">
				<img src="${ pageContext.servletContext.contextPath }/resources/upload_file_real/${r.changeName}" alt="">
			</c:if>
			<c:if test="${ empty r.originName }">
				<img src="resources/img/thumbnail.jpeg" alt="">
			</c:if>
			
			<br><br>
			
            <table id="contentArea" align="center" class="table">
            
            	 <tr>
                    <th width="100">등록자</th>
                    <td colspan="3">${ r.userId }</td>
                </tr>
                
                
                <tr>
                    <th width="100">세 종류</th>
                    <td colspan="3">${ r.money_kind }</td>
                </tr>
           
                <tr>
                    <th width="100">면적</th>
                    <td colspan="3">${ r.area }m²</td>
                </tr>
                <tr>
                    <th width="100">층</th>
                    <td colspan="3">${ r.floors }</td>
                </tr>
                <tr>
                    <th width="100">위치</th>
                    <td colspan="3">${ r.location }</td>
                </tr>
                <tr>
                    <th width="100">엘리베이터 여부</th>
                    <td colspan="3">${ r.elevator }</td>
                </tr>
                <tr>
                    <th width="100">관리비</th>
                    <td colspan="3">${ r.admin_money }</td>
                </tr>
                <tr>
                    <th width="100">구조</th>
                    <td colspan="3">${ r.structure }</td>
                </tr>
                <tr>
                    <th width="100">전체 층 수</th>
                    <td colspan="3">${ r.entire_floors }</td>
                </tr>
                <tr>
                    <th width="100">가격</th>
                    <td colspan="3">${ r.money1 }</td>
                </tr>
             
            </table>
            
            <br>

             <div align="center">
             		<c:if test="${ r.userId eq loginUser.userId }">
	                	<button onclick="postFormSubmit(1);">수정하기</button>
	                	<button onclick="postFormSubmit(2);">삭제하기</button>
	                 </c:if>
	                 <button class="form-control bg-light border" onclick="postFormSubmit(3);">찜하기</button>
	         </div>
	
			
			
			
        
        </div>
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

	<!-- Bootstrap core JavaScript-->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="js/sb-admin-2.min.js"></script>

	<!-- Page level plugins -->
	<script src="vendor/datatables/jquery.dataTables.min.js"></script>
	<script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>

	<!-- Page level custom scripts -->
	<script src="js/demo/datatables-demo.js"></script>
	
	
	
		<form id="postForm" action="wishform.re" method="post"> <!-- 삭제, 수정 시 필요한 매물 번호와 이미지 제목을 위한 form -->
				<input type="hidden" name="userId" value="${loginUser.getUserId() }">
			</form>
				
			<script>
				function postFormSubmit(){
					var postForm = $("#postForm");
				
					postForm.submit();
				}
			</script>

	  <jsp:include page="../common/footer.jsp"/>


</body>
</html>