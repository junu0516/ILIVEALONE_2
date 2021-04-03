<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
	<title>공동구매 게시물 수정하기</title>
	<link href="resources/css/custom/group_buy/groupBuyInsert.css" rel="stylesheet"> 
	<link href="resources/css/custom/group_buy/headerBalance.css" rel="stylesheet">
</head>
<body id="page-top">
	<jsp:include page="../common/header.jsp"/>
	<div id="wrapper">
  		<!-- Sidebar -->
        <jsp:include page="groupBuySideBar.jsp"/>
        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">
            <!-- Main Content -->
            <div id="content">        
                <!-- Begin Page Content -->
                <div class="container-fluid">
                	<br>
  					<h1 class="display-5">수정하기</h1>
        			<br>
			        <form id="insertForm" method="post" action="update.gb" enctype="multipart/form-data">
			        	<input type="hidden" name="gbNo" value="${gbBoard.gbNo}"/>
			            <div class="form-group">
			              <label for="gbTitle">제목:</label>
			              <input type="text" class="form-control" id="gbTitle" name="gbTitle" value="${gbBoard.gbTitle}">
			            </div>
			            
			            <div class="form-group">
			              <label for="gbMno">작성자:</label>
			              <input type="text" class="form-control" id="gbMno" name="gbMno" value="${gbBoard.gbMno}" readOnly>
			            </div>
			            
			            <div class="form-group">
			              <label for="thumbnail">대표 이미지:</label><br>
			              	현재 업로드된 이미지 : 
			              <c:if test="${!empty gbBoard.gbOriginalName }">
			              	${gbBoard.gbOriginalName}
			              	<input type="hidden" name="gbOriginalName" value="${gbBoard.gbOriginalName}"/>
			              	<input type="hidden" name="gbChangedName" value="${gbBoard.gbChangedName}"/>
			              </c:if>
			              <input type="file" class="form-control-file border" id="reuploadedThumbnail" name="reuploadedThumbnail">
			            </div>
			            
			            <div class="form-group">
			              <label for="name">제품명:</label>
			              <input type="text" class="form-control" id="pName" name="pName" value="${gbProduct.PName}">
			            </div>
			            
			            <div class="form-group">
			            	<label for="price">가격:</label>
			                <input type="range" class="form-control-range" id="pPrice" name="PPrice" value = "${gbProduct.PPrice}" min="0" max="500000" step="500" oninput="document.getElementById('result').innerHTML=this.value;">
			                <span id="result">${gbProduct.PPrice}</span>
			            </div>
			            <div class="form-group">
			                <label for="limit">목표 인원:</label>
			                <input type="number" class="form-control" id="pLimit" name="pLimit" value="${gbProduct.PLimit}">
			            </div><br>
			            <div class="form-group">
			                <label for="gbContent">내용 : </label>
			                <textarea class="form-control" id="gbContent" name = "gbContent">${gbBoard.gbContent}</textarea>
			            </div>           
            			<button type="submit" class="btn btn-primary">수정하기</button>
         			</form>
				</div>
            	<!-- /.container-fluid -->
			</div>
        	<!-- End of Main Content -->
		</div>
    	<!-- End of Content Wrapper -->
    </div>
    <!-- End of Page Wrapper -->
    <script src="//cdn.ckeditor.com/4.16.0/standard/ckeditor.js"></script>
	<script>
    	CKEDITOR.replace('gbContent',{
        	height: 500,
           	filebrowserUploadUrl: '${pageContext.request.contextPath}/ckeditor/upload.ck?function=4'
        });	
    </script>	
</body>
</html>