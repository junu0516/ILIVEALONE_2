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
	
    <title>패션 게시판 top 리스트</title>
	<style>
    .row.content {height: 100%;}
    .sidenav {
      height: 100%;
    }
	@media screen and (max-width: 767px) {
      .sidenav {
        height: auto;
      }
      .row.content {height:auto;} 
    }
    
   
    #page-top{ padding-top: 61px; }
   
    </style>
</head>

	  <jsp:include page="../common/header.jsp"/>
<body id="page-top" >
	
	<!-- Page Wrapper -->
    <div id="wrapper">
	<jsp:include page="boardSideBar.jsp"/>



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
      
      <table id="boardList" class="table table-hover" align="center">
      <thead>
      <tr>
		<th>번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>날짜</th>
		<th>조회수</th>
	  </tr></thead><tbody></tbody></table>
      <a class="btn btn-secondary" style="float:right" href="list.bo">목록</a>
      <hr>
		<script>
		
		$(function(){
			topList();
			$("#boardList").on("click",".boardList",function(){
				var bno = $(this).data("bno");
				location.href="detail.bo?bno=" + $(this).children().eq(0).text();
		    });
		});
		function topList(){
			$.ajax({
				url: 'topList.bo',
				success: function(list){
					$tableBody = $('#boardList tbody');
					$tableBody.html('');
    				$.each(list, function(i, obj){
						var $tr = $('<tr class = "boardList">');
						var $bId = $('<td>').text(obj.boardNo);
						var $bTitle = $('<td>').text(obj.boardTitle);
						var $bWriter = $('<td>').text(obj.boardWriter);
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
      <h3 align="center"><i class="fa fa-camera"></i> TOP 5 목록 </h3>
      
      <table id="fashionList" class="table table-hover" align="center">
      <thead>
      <tr>
		<th>번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>날짜</th>
		<th>조회수</th>
	  </tr></thead><tbody></tbody></table>
      <a class="btn btn-secondary" style="float:right" href="blist.bo">목록</a>
      <hr>
		<script>
		
		$(function(){
			topListF();
			$("#fashionList").on("click",".fashionList",function(){
				var fno = $(this).data("fno");
				location.href="detail.fo?fno=" + $(this).children().eq(0).text();
		    });
		});
		function topListF(){
			$.ajax({
				url: 'topList.fo',
				success: function(list){
					$tableBody = $('#fashionList tbody');
					$tableBody.html('');
    				$.each(list, function(i, obj){
						var $tr = $('<tr class = "fashionList">');
						var $fId = $('<td>').text(obj.fashionNo);
						var $fTitle = $('<td>').text(obj.fashionTitle);
						var $fWriter = $('<td>').text(obj.fashionWriter);
						var $fCreateDate = $('<td>').text(obj.fashionCreateDate);
						var $fCount = $('<td>').text(obj.fashionCount);
						if(obj.fashionOriginName != null){
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
	 <jsp:include page="boardSideBar2.jsp"/>
  
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