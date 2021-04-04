<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
	
    <title>푸드 게시판 top 리스트</title>

    <!-- Custom fonts for this template 
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">
	-->
    <!-- Custom styles for this template 
    <link href="css/sb-admin-2.min.css" rel="stylesheet">
	-->
    <!-- Custom styles for this page 
    <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
	-->
	<style>
    /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
    .row.content {height: 100%;}
    
    /* Set gray background color and 100% height */
    .sidenav {
      height: 100%;
    }

    /* On small screens, set height to 'auto' for sidenav and grid */
    @media screen and (max-width: 767px) {
      .sidenav {
        height: auto;
      }
      .row.content {height:auto;} 
    }
    
    #showImage {
    	height: auto;
    	
    }
    
    #page-top{ padding-top: 61px; }
   
    </style>
</head>

	  <jsp:include page="../common/header.jsp"/>
<body id="page-top" >
	
	<!-- Page Wrapper -->
    <div id="wrapper">
	

	
	
		<!-- 사이드 부분 -->
        <!-- Sidebar -->
           <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" a href="${pageContext.servletContext.contextPath}">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-laugh-wink"></i>
                </div>
                <div class="sidebar-brand-text mx-3">패션</div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
             <li class="nav-item">
               <hr class="sidebar-divider">
               <a href="Toplistf.fo" class="list-group-item list-group-item-success">푸드 메인 </a></p>
      			<hr class="sidebar-divider">
      			<a href="list.fo" class="list-group-item list-group-item-success">푸드 게시물</a></p>
      			<hr class="sidebar-divider">
      			<a href="blist.fo" class="list-group-item list-group-item-success">푸드 최신뉴스</a></p>
      			<hr class="sidebar-divider">
      			
      			<a href="list.no" class="list-group-item list-group-item-success">공지사항</a></p>
            </li>


            <!-- Divider -->
            

            <!-- Heading -->
            
            <!-- Nav Item - Pages Collapse Menu -->
          </ul>
       	 <!-- End of Sidebar -->


		<!-- 바디부분  -->
        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

              <div class="col-sm-15 text-center">

                <!-- Begin Page Content -->
                <div class="container-fluid center">
				

	<br>      
      <h3 align="center"><i class="far fa-clipboard"></i> TOP 5 목록</h3>
        <table id="foodList" class="table table-hover" align="center">
      <thead>
      <tr>
		<th>번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>날짜</th>
		<th>조회수</th>
	  </tr></thead><tbody></tbody></table>
      <a class="btn btn-secondary" style="float:right" href="list.fo">목록</a>
      <hr>
		<script>
		
		$(function(){
			topList();
			$("#foodList").on("click",".foodList",function(){
				var fdno = $(this).data("fdno");
				location.href="detailf.fo?fdno=" + $(this).children().eq(0).text();
		    });
		});
		function topList(){
			$.ajax({
				url: 'topListf.fo',
				success: function(list){
					$tableBody = $('#foodList tbody');
					$tableBody.html('');
    				$.each(list, function(i, obj){
						var $tr = $('<tr class = "foodList">');
						var $bId = $('<td>').text(obj.foodNo);
						var $bTitle = $('<td>').text(obj.foodTitle);
						var $bWriter = $('<td>').text(obj.foodWriter);
						var $bCreateDate = $('<td>').text(obj.createDate);
						var $bCount = $('<td>').text(obj.count);
						if(obj.originName != null){
							$bFile = $('<td>').text("O");
						}
						$tr.append($bId);
						$tr.append($bTitle);
						$tr.append($bWriter);
						$tr.append($bCreateDate);
						$tr.append($bCount);
						$tableBody.append($tr);
					});
				}
			});
		}
		$(function(){

			topList();
			setInterval(function(){ //일시적으로 주기적으로 돌려주는것 
				topList();
			}, 5000);

		})
	</script>
		
		<br>
      <h1 align="center">푸드 <i class="fa fa-camera"></i> TOP 5 목록</h1>
      <table id="foodPList" class="table table-hover" align="center">
      <thead>
      <tr>
		<th>번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>날짜</th>
		<th>조회수</th>
	  </tr></thead><tbody></tbody></table>
      <a class="btn btn-secondary" style="float:right" href="blist.fo">목록</a>
      <hr>
		<script>
		$(function(){
			topListF();
			$("#foodPList").on("click",".foodPList",function(){
				var fdpno = $(this).data("fdpno");
				location.href="detailP.fo?fdpno=" + $(this).children().eq(0).text();
		    });
		});
		function topListF(){
			$.ajax({
				url: 'topListP.fo',
				success: function(list){
					$tableBody = $('#foodPList tbody');
					$tableBody.html('');
    				$.each(list, function(i, obj){
						var $tr = $('<tr class = "foodPList">');
						var $fId = $('<td>').text(obj.foodPNo);
						var $fTitle = $('<td>').text(obj.foodPTitle);
						var $fWriter = $('<td>').text(obj.foodPWriter);
						var $fCreateDate = $('<td>').text(obj.foodPCreateDate);
						var $fCount = $('<td>').text(obj.foodPCount);
						if(obj.foodPOriginName != null){
							$fFile = $('<td>').text("O");
						}
						$tr.append($fId);
						$tr.append($fTitle);
						$tr.append($fWriter);
						$tr.append($fCreateDate);
						$tr.append($fCount);
						$tableBody.append($tr);
					});
				}
			});
		}
		$(function(){

			topListF();
			setInterval(function(){ //일시적으로 주기적으로 돌려주는것 
				topListF();
			}, 5000);

		})
		</script>
		<br>
		
    
    </div>
                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

        </div>
        <!-- End of Content Wrapper -->
	
    
    <!-- End of Page Wrapper -->
	<div class="col-sm-2 sidenav">
      	<body onload = "showImage()">
    
      	<div class = "well" >
      	<br>
      		<h3>오늘의 푸드</h3>
			<img class = "introImg" id = "introImg" border="0" >
       	<br><br><br>
        <hr>
        <br><br>
        	<h3>오늘의 디저트</h3>
			<img class = "introImg1" id = "introImg1" border="0" >
      	</div>
      	</body>
    <script>
			var imgArray = new Array();
			imgArray[0] = "resources/img/오사카.jfif";
			imgArray[1] = "resources/img/토스트.jfif";
			imgArray[2] = "resources/img/프랑스.jfif";
			imgArray[3] = "resources/img/국수.jfif";
			
			var imgArray1 = new Array();
			imgArray1[0] = "resources/img/딸기 케이크.jfif";
			imgArray1[1] = "resources/img/마카로.jfif";
			imgArray1[2] = "resources/img/마카롱.jfif";
			imgArray1[3] = "resources/img/케이크.jfif";

			
			function showImage(){
				var imgNum = Math.round(Math.random()*3);
				var objImg = document.getElementById("introImg");
				objImg.src = imgArray[imgNum];
				
				var imgNum1 = Math.round(Math.random()*3);
				var objImg1 = document.getElementById("introImg1");
				objImg1.src = imgArray1[imgNum1];
			
			}
			
			
	</script>
  </div>
  
</div>
	
   
	
	
    <!-- Bootstrap core JavaScript
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	-->
    <!-- Core plugin JavaScript
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
	-->
    <!-- Custom scripts for all pages
    <script src="js/sb-admin-2.min.js"></script>
	-->
    <!-- Page level plugins 
    <script src="vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>
	-->
    <!-- Page level custom scripts 
    <script src="js/demo/datatables-demo.js"></script>
	-->
</body>

	  <jsp:include page="../common/footer.jsp"/>
</html>