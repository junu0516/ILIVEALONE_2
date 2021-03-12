<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Insert title here</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
	<script src="https://cdn.ckeditor.com/4.16.0/standard/ckeditor.js"></script>
	<style>
	
		thead>tr>th{
			text-align: center;
	    }
	    
		tbody>tr>td{
			text-align:center;
		}
		
	</style>
	
</head>

<body>
	<jsp:include page="../common/header.jsp"/>
	<br>
    <div class="container">
        <h1 class="display-5">공동구매 등록하기</h1>
        <br>
        <form id="insertForm" method="post" action="insert.gb" enctype="multipart/form-data">
            <div class="form-group">
              <label for="gbTitle">제목:</label>
              <input type="text" class="form-control" id="gbTitle" name="gbTitle" placeholder="글 제목 입력" required>
            </div>
            
            <div class="form-group">
              <label for="gbMno">작성자:</label>
              <input type="text" class="form-control" id="gbMno" name="gbMno" value="${loginUser.userId}" readOnly>
            </div>
            
            <div class="form-group">
              <label for="thumbnail">대표 이미지:</label>
              <input type="file" class="form-control-file border" id="thumbnail" name="thumbnail" required>
            </div>
            
            <div class="form-group">
              <label for="name">제품명:</label>
              <input type="text" class="form-control" id="pName" placeholder="제품명 입력" name="pName" required>
            </div>
            
            <div class="form-group">
                <label for="price">가격:</label>
                <input type="range" class="form-control-range" id="pPrice" name="pPrice" value = "0" min="0" max="500000" step="500" oninput="document.getElementById('result').innerHTML=this.value;" required>
                <span id="result">0</span>
            </div>
            <div class="form-group">
                <label for="limit">목표 인원:</label>
                <input type="number" class="form-control" id="pLimit" placeholder="목표 인원 입력" name="pLimit" required>
            </div><br>
            
            <div class="form-group">
                <label for="gbContent">내용 : </label>
                <textarea class="form-control" id="gbContent" name = "gbContent" required></textarea>
            </div>
            
            <script>
            	CKEDITOR.replace('gbContent');
            </script>
            
            <button type="submit" class="btn btn-primary">등록하기</button>
            <a class="btn btn-danger" href=list.gb>뒤로가기</a>
         </form>
    </div>
</body>
</html>