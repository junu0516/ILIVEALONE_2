<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>상세보기</title>
	<link href="resources/css/custom/group_buy/groupBuyDetail.css" rel="stylesheet"> 
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
					<h1 class="display-5">상세보기</h1><br>
        			<input type="hidden" name="gbMno" value="${gbBoard.gbMno}"/>
        			<table class="table" id="detail-table">
            			<thead>
              				<tr>
                				<th colspan="2" id="head">${gbBoard.gbTitle}</th>
              				</tr>
            			</thead>
            			<tbody>
              				<tr>
                				<th>등록일 : ${gbBoard.gbDate}</th>
                				<th>조회수 : ${gbBoard.gbCount}</th>
              				</tr>
              				<tr>
				              	<c:if test="${gbProduct.PStatus eq 'N'}">
				              	<th>현재 구매가 불가한 상품입니다.</th>
				              	</c:if>
				              	<c:if test="${gbProduct.PStatus eq 'Y'}">
				                <th>달성률 : 현재까지 ${gbProduct.PPurchase} / ${gbProduct.PLimit}명이 구매를 신청했습니다.</th>
				                </c:if>
                				<th>가격 : ${gbProduct.PPrice} 원</th>
              				</tr>
              				<tr>
				                <td colspan="2">
				                 	${gbBoard.gbContent}
				                </td>
              				</tr>
            			</tbody>
          			</table>
					<c:if test="${gbBoard.gbMno eq sessionScope.loginUser.userId}">
          				<form class="form-inline" id="postForm" method="post">
          					<input type="hidden" name="gbNo" value="${gbBoard.gbNo}"/>		
          				</form>
          				<c:if test="${gbProduct.PStatus eq 'Y'}">
	        			<a href="updateForm.gb?gbNo=${gbBoard.gbNo}" class="btn btn-primary">수정하기</a>	
          				</c:if>
	          			<button class="btn btn-danger" onclick="postFormSubmit(2);">삭제하기</button>     				
          			</c:if>
          			<c:if test="${gbBoard.gbMno ne sessionScope.loginUser.userId }">
          				<button type="button" onclick="checkPurchase();" class="btn btn-primary" id="purchase">구매하기</button>
          			</c:if>
          			<a href="list.gb" class="btn btn-secondary">목록으로</a>
                </div>
                <!-- /.container-fluid -->
            </div>
            <!-- End of Main Content -->
        </div>
        <!-- End of Content Wrapper -->
    </div>
    <!-- End of Page Wrapper -->
    
   
	<script>
		$(function(){
			if(${not empty message}){
				alert("${message}");
			}
			
			if(${gbProduct.PPurchase} >= ${gbProduct.PLimit}){
      			$("#purchase").attr("disabled",true);
      		}; 
		})
		
		function checkPurchase(){
        	if(${empty sessionScope.loginUser}){
            	alert("로그인하세요");          			
          	}else{
          		alert("구매페이지로 넘어갑니다.");
          		location.href="purchaseForm.gb?phCno=${gbBoard.gbNo}&phProduct=${gbProduct.PNo}&phBuyer=${loginUser.userId}";	
          	}
         }
		
		function postFormSubmit(){
			
			$("#postForm").attr("action","delete.gb");
			$("#postForm").submit();
		}
	</script>
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>