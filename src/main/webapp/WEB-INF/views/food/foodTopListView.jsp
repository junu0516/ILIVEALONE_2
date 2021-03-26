<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>푸드 탑 리스트 </title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style>
    /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
    .row.content {height: auto;}
    
    /* Set gray background color and 100% height */
    .sidenav {
      padding-top: 20px;
      background-color: #f1f1f1;
      height: auto;
    }

    /* On small screens, set height to 'auto' for sidenav and grid */
    @media screen and (max-width: 767px) {
     .sidenav {
        height: auto;
        padding: 15px;
      }
     .row.content {height:auto;} 
    }
    
    .introImg{
    	height: 150px;
    	weight: 150px;
    }
    .introImg1{
       	height: 150px;
    	weight: 150px; 
    }
    
  </style>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
 
<div class="container-fluid text-center">    
  <div class="row content">
    <div class="col-sm-2 sidenav">
      <ul class = "list-group">
      	<a href="main.bo" class="list-group-item list-group-item-success">Home</a></p>
      	<a href="Toplistf.fo" class="list-group-item list-group-item-success">푸드 메인 페이지</a></p>
      	<a href="list.fo" class="list-group-item list-group-item-success">푸드 게시물</a></p>
      	<a href="blist.fo" class="list-group-item list-group-item-success">푸드 최신뉴스</a></p>
      	<a href="list.no" class="list-group-item list-group-item-success">공지사항</a></p>
      </ul>
    </div>
    
	
	    
    <div class="col-sm-8 text-left">
      <br><br> 
      
      <h1 align="center">푸드 게시글 TOP 5 목록</h1>
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
		function topList(){
			$.ajax({
				url: 'topListf.fo',
				success: function(list){
					$tableBody = $('#foodList tbody');
					$tableBody.html('');
    				$.each(list, function(i, obj){
						var $tr = $('<tr>');
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
      <h1 align="center">푸드 사진 TOP 5 목록</h1>
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
		function topListF(){
			$.ajax({
				url: 'topListP.fo',
				success: function(list){
					$tableBody = $('#foodPList tbody');
					$tableBody.html('');
    				$.each(list, function(i, obj){
						var $tr = $('<tr>');
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
		
      <h1>공지사항</h1>
      <p>우리들이 지켜야 할 수칙</p>
      <a class="btn btn-secondary" style="float:right" href="list.no">목록</a>
    </div>
    <div class="col-sm-2 sidenav">
      	<body onload = "showImage()">
      	<div class = "well" >
      		<h2>오늘의 푸드</h2>
			<img class = "introImg" id = "introImg" border="0" >
       	<br><br><br>
        <hr>
        <br><br>
        	<h2>오늘의 디저트</h2>
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

  <jsp:include page="../common/footer.jsp"/>

</body>
</html>
