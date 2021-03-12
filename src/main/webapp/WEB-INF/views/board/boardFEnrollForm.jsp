<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <title>패션 게시물 등록</title>
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
    
    /* Set black background color, white text and some padding */
    footer {
      background-color: #555;
      color: white;
      padding: 15px;
    }
    
    /* On small screens, set height to 'auto' for sidenav and grid */
    @media screen and (max-width: 767px) {
      .sidenav {
        height: auto;
        padding: 5px;
      }
      .row.content {height:auto;} 
    }

  </style>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
<div class="container-fluid text-center">  
	<div class="col-sm-2 sidenav">

      <p><a href="list.bo">패션 게시물</a></p>
      <p><a href="blist.bo">패션 최신뉴스</a></p>
      <p><a href="#">공지사항</a></p>
	
	</div>
	<div class="col-sm-8 text-left" style="padding:5% 10%;"> 
            <h2>게시글 작성하기</h2>
            <br>
			
			<!-- 첨부파일도 등록할꺼니깐 Multipart/form-data encType 지정!! -->
            <form id="enrollForm" method="post" action="insert.fo" enctype="multipart/form-data">
                <table align="center">
                     <div class="form-group">
                        <label for="title">제목</label>
                        <input type="text" id="ftitle" class="form-control" name="fashionTitle" required>
                    </div>
                     <div class="form-group">
                        <label for="writer">작성자</label>
                        <input type="text" id="fwriter" class="form-control" value="${ loginUser.userId }" name="fashionWriter" readonly>
                    </div>
                    <div class="form-group">
                        <label for="upfile">첨부파일</label>
                        <input type="file" id="upfile" class="form-control-file border" name="uploadFile">
                    </div>
              		<div class="form-group">
                		<label for="boardcontent">내용 : </label>
                		<textarea class="form-control" id="fashionContent" name = "fashionContent"></textarea>
            		</div>      
         
                </table>
                
              
				<script>
            
                ClassicEditor
                    .create(document.querySelector('#fashionContent'))
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
      <div class="well">
        <p>ADS</p>
      </div>
      <div class="well">
        <p>ADS</p>
      </div>
    </div>
	
</div>
<jsp:include page="../common/footer.jsp"/>

</body>
</html>
