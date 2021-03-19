<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
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
      height: auto%;
    }

    /* On small screens, set height to 'auto' for sidenav and grid */
    @media screen and (max-width: 767px) {
      .sidenav {
        height: auto;
        padding: 15px;
      }
      .row.content {height:auto;} 
    }
    
    #showImage {
    	height: auto;
    	
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
      	<a href="Toplist.bo" class="list-group-item list-group-item-success">패션 메인 페이지</a></p>
      	<a href="list.bo" class="list-group-item list-group-item-success">패션 게시물</a></p>
      	<a href="blist.bo" class="list-group-item list-group-item-success">패션 최신뉴스</a></p>
      	<a href="list.no" class="list-group-item list-group-item-success">공지사항</a></p>
      </ul>
    </div>
    
	
	    
    <div class="col-sm-8 text-left">
      <br><br> 
      
      <h1 align="center">게시글 TOP 5 목록</h1>
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
		function topList(){
			$.ajax({
				url: 'topList.bo',
				success: function(list){
					$tableBody = $('#boardList tbody');
					$tableBody.html('');
    				$.each(list, function(i, obj){
						var $tr = $('<tr>');
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
      <h1 align="center">사진 TOP 5 목록</h1>
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
		function topListF(){
			$.ajax({
				url: 'topList.fo',
				success: function(list){
					$tableBody = $('#fashionList tbody');
					$tableBody.html('');
    				$.each(list, function(i, obj){
						var $tr = $('<tr>');
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
		
      <h1>공지사항</h1>
      <p>우리들이 지켜야 할 수칙</p>
      <a class="btn btn-secondary" style="float:right" href="list.no">목록</a>
    </div>
    <div class="col-sm-2 sidenav">
      	<body onload = "showImage()">
      	<div class = "well" >
      		<h2>오늘의 패션(남자)</h2>
			<img class = "introImg" id = "introImg" border="0" >
       	<br><br><br>
        <hr>
        <br><br>
        	<h2>오늘의 패션(여자)</h2>
			<img class = "introImg1" id = "introImg1" border="0" >
      	</div>
      	</body>
    <script>
			var imgArray = new Array();
			imgArray[0] = "resources/img/A1.jfif";
			imgArray[1] = "resources/img/A2.jfif";
			imgArray[2] = "resources/img/A3.jfif";
			imgArray[3] = "resources/img/A4.jfif";
			
			var imgArray1 = new Array();
			imgArray1[0] = "resources/img/B1.jfif";
			imgArray1[1] = "resources/img/B2.jfif";
			imgArray1[2] = "resources/img/B3.jfif";
			imgArray1[3] = "resources/img/B4.jfif";

			
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
