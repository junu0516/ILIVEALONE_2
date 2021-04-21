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
	<title>공동구매 게시물 등록하기</title>
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
			              <label for="pName">제품명:</label>
			              <input type="text" class="form-control" id="pName" placeholder="제품명 입력" name="pName" required>
			            </div>           
			            <div class="form-group">
			                <label for="pPrice">가격:</label>
			                <input type="range" class="form-control-range" id="pPrice" name="pPrice" value = "0" min="1000" max="500000" step="1000" oninput="document.getElementById('result').innerHTML=this.value;" required>
			                <span id="result">0</span>
			            </div>           
			            <div class="form-group">
			                <label for="pLimit">목표 인원:</label>
			                <input type="number" class="form-control" id="pLimit" placeholder="목표 인원 입력" name="pLimit" required>
			            </div><br>           
			            <div class="form-group">
			                <label for="pMaxPurchase">인당 최대 구매 수량 :</label>
			                <input type="number" class="form-control" id="pMaxPurchase" placeholder="최대 구매수량 입력" name="pMaxPurchase" required>
			            </div><br>           
			            <div class="form-group">
			                <label>입금 계좌 정보 : </label>
			                <input type="text" class="form-control" id="accountName" placeholder="예금주" name="accountName" required>&nbsp
			                <select type="text" class="form-control" id="accountBankType" name="accountBankType" required>
			                	<option>농협</option>
			                	<option>우리</option>
			                	<option>국민</option>
			                	<option>신한</option>
			                	<option>기업</option>
			                	<option>경남</option>
			                	<option>광주</option>
			                	<option>대구</option>
			                	<option>부산</option>
			                	<option>산업</option>
			                	<option>새마을금고</option>
			                	<option>수협</option>
			                	<option>신협</option>
			                	<option>우체국</option>
			                	<option>전북</option>
			                	<option>제주</option>
			                	<option>KEB하나</option>
			                	<option>한국씨티</option>
			                	<option>SC(구 제일)</option>
			                </select><br>
			                <input type="text" class="form-control" id="accountNumber" placeholder="계좌번호(-포함)" name="accountNumber" required>
			            </div>
            			<br>
			            <div class="form-group">
			                <label for="gbContent">내용 : </label>
			                <textarea class="form-control" id="gbContent" name = "gbContent" required></textarea>
			            </div>
            			<button type="submit" class="btn btn-primary">등록하기</button>
            			<a class="btn btn-danger" href=list.gb>뒤로가기</a>
            			<br><br>
         			</form> 
                </div>
                <!-- /.container-fluid -->
            </div>
            <!-- End of Main Content -->
        </div>
        <!-- End of Content Wrapper -->
    </div>
    <!-- End of Page Wrapper -->
    <jsp:include page="../common/footer.jsp"/>
	<script src="//cdn.ckeditor.com/4.16.0/standard/ckeditor.js"></script>
	<script>
    	CKEDITOR.replace('gbContent',{
        	height: 500,
           	filebrowserUploadUrl: '${pageContext.request.contextPath}/ckeditor/upload.ck?function=4'
        });	
    </script>	                          	
</body>
</html>