<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <title>하우징 게시물 등록</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  	<script src="https://cdn.ckeditor.com/ckeditor5/25.0.0/classic/ckeditor.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css"></script>
  <style>
    /* Remove the navbar's default margin-bottom and rounded borders */ 
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
    }
    
    /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
    .row.content {height: 450px}
    
    /* Set gray background color and 100% height */
    .sidenav {
      padding-top: 20px;
      background-color: #f1f1f1;
      height: 100%;
    }
    
    
    
    /* On small screens, set height to 'auto' for sidenav and grid */
    @media screen and (max-width: 767px) {
      .sidenav {
        height: auto;
        padding: 5px;
      }
      .row.content {height:auto;} 
    }
	.select_img img {margin: 20px 0;}
	
	
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
	<div class="col-sm-2 sidenav">
      <ul class = "list-group">
      	<a href="${pageContext.servletContext.contextPath}"  class="list-group-item list-group-item-success">Home</a></p>
      	<a href="Toplist.ho" class="list-group-item list-group-item-success">하우징 메인 페이지</a></p>
      	<a href="list.ho" class="list-group-item list-group-item-success">하우징 게시물</a></p>
      	<a href="blist.ho" class="list-group-item list-group-item-success">하우징 최신뉴스</a></p>
      	<a href="list.no" class="list-group-item list-group-item-success">공지사항</a></p>
      </ul>
	</div>
	<div class="col-sm-8 text-left" style="padding:5% 10%;"> 
            <h2>하우징 사진 작성하기</h2>
            <br>
			
			<!-- 첨부파일도 등록할꺼니깐 Multipart/form-data encType 지정!! -->
            <form id="enrollForm" method="post" action="insertP.ho" enctype="multipart/form-data">
                <table align="center">
                     <div class="form-group">
                        <label for="title">제목</label>
                        <input type="text" id="ftitle" class="form-control" name="housingPTitle" required>
                    </div>
                     <div class="form-group">
                        <label for="writer">작성자</label>
                        <input type="text" id="fwriter" class="form-control" value="${ loginUser.userId }" name="housingPWriter" readonly>
                    </div>
                    <div class="form-group">
                        <label for="upfile">이미지</label>
                        <input type="file" id="upfile" class="form-control-file border" name="uploadFile">

                    </div>
              		<div class="form-group">
                		<label for="housingPcontent">내용 : </label>
                		<textarea class="form-control" id="housingPContent" name = "housingPContent"></textarea>
            		</div>      
         
                </table>
                
              
				<script>
            
                ClassicEditor
                    .create(document.querySelector('#housingPContent'))
                    .catch(error=>{
                        console.error(error);
                    });

            		</script>
                <div align="center">
                    <button type="submit" class="btn btn-primary">등록하기</button>
                    <button type="reset" class="btn btn-danger">취소하기</button>
                </div>
            </form>
        </div>
        <div class="col-sm-2 sidenav">
      	<body onload = "showImage()">
      	<div class = "well" >
      		<h2>오늘의 하우징</h2>
			<img class = "introImg" id = "introImg" border="0" >
       	<br><br><br>
        <hr>
        <br><br>
        	<h2>오늘의 침대</h2>
			<img class = "introImg1" id = "introImg1" border="0" >
      	</div>
      	</body>
    <script>
    var imgArray = new Array();
	imgArray[0] = "resources/img/라자가구.jfif";
	imgArray[1] = "resources/img/가구.jfif";
	imgArray[2] = "resources/img/영국 가구.jfif";
	imgArray[3] = "resources/img/의자.jfif";
	
	var imgArray1 = new Array();
	imgArray1[0] = "resources/img/크렌시아.jfif";
	imgArray1[1] = "resources/img/모던바로크.jfif";
	imgArray1[2] = "resources/img/소파.jfif";
	imgArray1[3] = "resources/img/스퀘어.jfif";

			
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
