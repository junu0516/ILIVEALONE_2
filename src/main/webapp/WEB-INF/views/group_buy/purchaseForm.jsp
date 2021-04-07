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
    <title>구매하기</title>
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
					<h1 class="display-5">공동구매 신청</h1>
					<br>
					<div class="row">
						<div class="col-sm-6"> 
							<form action="purchase.gb" id="purchaseForm" method="post">
								<input type="hidden" name="phCno" value="${gbBoard.gbNo}"/>
								<input type="hidden" name="phSeller" value="${gbBoard.gbMno}"/>					
								<!-- 제품명 -->
								<div class="form-group">
									<label for="pName">제품명 : </label>
									<input type="hidden" name="phProduct" value="${gbProduct.PNo}"/>
									<input type="text" class="form-control " id="pName" name="quantity" value="${gbProduct.PName}" readOnly />
								</div>
								<!-- 구매 수량 -->
								<div class="form-group">
									<label for="phQuantity">수량 : </label>
									<select class="form-control" name="phQuantity" id="phQuantity">
										<c:forEach var="count" begin="0" end="${gbProduct.PMaxPurchase}" >
										<option>${count}</option>
										</c:forEach>
									</select>
								</div>				
								<!-- 구매자 이름 -->
								<div class="form-group">
									<label for="userName">구매자명 : </label>
									<input type="hidden" name="phBuyer" value="${loginUser.userId}"/>
									<input type="text" class="form-control" id="phBuyerName" name="phBuyerName" value="${loginUser.userName}" required/>
								</div>			
								<!-- 주소 -->
								<label for="address"> 주소  :</label>
				             	<div class="form-inline">
									<label> &nbsp; 우편번호 : &nbsp;</label>
									<input type="text"  id="post" name="post" class="form-control mr-2 postcodify_postcode5" size="6">
									<button type="button" class="btn btn-primary" id="postcodify_search_button">검색</button>
								</div><br>
								<label> &nbsp; 도로명주소 : </label>
								<input type="text" id="address1" name="address1" class="form-control postcodify_address" size="30"><br>
								<label> &nbsp; 상세주소 : </label>
								<input type="text" id="address2" name="address2" class="form-control postcodify_extra_info" size="30">					
							</form>
						</div>
						<div class="col-sm-6"> 
							<br>
							<!-- 제품 이미지 -->
							<img src="${pageContext.request.contextPath}/resources/images/group_buy/${gbBoard.gbChangedName}" class="img-thumbnail" width="500px" height="350px"/>
						 	<br><br>				 
							 <!-- 총 가격 -->
						 	<label for="totalPrice">총 가격 : </label>
							 <h1><b id="totalPrice"> </b><small>원</small></h1>
						 	<br><br>		 	
						 	<!-- 구매하기 버튼 -->
						 	<button type="button" class="btn btn-primary" onclick="purchase();">구매하기</button>
						</div>
					</div>
				</div>
	    		<!-- /.container-fluid -->
			</div>
	    	<!-- End of Main Content -->
	 	</div>
		<!-- End of Content Wrapper -->
    </div>
    <!-- End of Page Wrapper -->
	 <jsp:include page="../common/footer.jsp"/>
    <script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
	<script>
		$(function(){
			$("#postcodify_search_button").postcodifyPopUp();
		});
	
		$(function(){
			$('#phQuantity').change(function(){
				var quantity = this.value;
				var price = "${gbProduct.PPrice}";
	 			$("#totalPrice").html(price*quantity);
			});
		})
	
			
		$(function(){
	 		$("#phQuantity").click(function(){
	 			var quantity = $("#phQuantity").val();
	 			var price = "${gbProduct.PPrice}";
	 			$("#totalPrice").html(price*quantity);
	 		});
		})
			
		function purchase(){
			console.log($("#phQuantity").val());
			console.log($("#post").val());
			console.log($("#phBuyer").val());
			if($("#phBuyerName").val() == null){
				alert("구매자명을 입력하세요");
			}else if($("#phQuantity").val()<=0 || $("#phQuantity").val() == null){
				alert("수량을 선택하세요");
			}else if($("#post").val() == null || $("#address1").val() == null || $("#address2").val() == null){
				alert("주소를 입력하세요");
			}else{
				$("#purchaseForm").submit();			 				
			}
		}													
	</script>
</body>
</html>