<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매내역 조회</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<br><br>
	<div class="container">
		<h2>판매기록 관리/조회</h2>
		<br>
		&nbsp 판매자 아이디 : ${loginUser.userId}
		<table class="table">
			<thead>
				<tr>
					<th>판매번호</th>
					<th>구매자ID</th>
					<th>판매물품</th>
					<th>구매수량</th>
					<th>등록날짜</th>
					<th>판매날짜</th>
					<th>판매상태</th>
					<th>상태수정</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${purchaseHistories}" var="purchaseHistory">
				<tr>
					<td>${purchaseHistory.phNo}</td>
					<c:set var="sharp" value="<%='#'%>"/>
					<td><a data-toggle="collapse" href="${sharp}detail_${purchaseHistory.phNo}">${purchaseHistory.phBuyer}</a></td>
					<td><a href="detail.gb?pNo=${purchaseHistory.phProduct}">${purchaseHistory.phProductName}</a></td>
					<td>${purchaseHistory.phQuantity}</td>
					<td>${purchaseHistory.phRecordDate}</td>
					<td>${purchaseHistory.phChangeDate}</td>
					<c:if test="${purchaseHistory.phStatus eq 'N'}">
					<td>거래 취소</td>
					<td></td>
					</c:if>
					<c:if test="${purchaseHistory.phStatus eq 'Y'}">
						<c:if test="${purchaseHistory.phSalesStatus eq 'W'}">
						<td>판매 모집</td>
						<td>
							<a class="btn btn-primary btn-sm" href="prepareDeal.gb?phProduct=${purchaseHistory.phProduct}&phBuyer=${purchaseHistory.phBuyer}">마감하기</a>
						</td>
						</c:if>
						<c:if test="${purchaseHistory.phSalesStatus eq 'R'}">
						<td>발송 준비</td>
						<!-- 나중에 발송 완료 버튼 클릭시 송장번호 입력해서, purchaseHistory에 송장번호 업데이트 해야 함 -->
						<td><a class="btn btn-success btn-sm" data-toggle="modal" data-target="#invoiceModal" data-phProduct="${purchaseHistory.phProduct}" data-phBuyer="${purchaseHistory.phBuyer}">발송 완료</a></td>
						</c:if>
						<c:if test="${purchaseHistory.phSalesStatus eq 'C'}">
						<td>발송 완료</td>
						<td></td>
						</c:if>
					</c:if>
				</tr>
				<tr>
					<td colspan="8">
						<div id="detail_${purchaseHistory.phNo}" class="collapse">
							<b>세부정보 조회</b>
							<br><br>
							<ul>
								<li>제품명 : ${purchaseHistory.phProductName}</li>
								<li>구매자명 : ${purchaseHistory.phBuyerName}</li>
								<li>받는주소 : ${purchaseHistory.phAddress}</li>
							</ul>
						</div>							
					</td>
				</tr>
				
				
				</c:forEach>	
			</tbody>
		</table>
	</div>	
	<!-- 송장번호 입력 모달 -->
				<div class="modal fade" id="invoiceModal">
					<div class="modal-dialog modal-sm">
						<div class="modal-content">
							<div class="modal-header">
								<h4 class="modal-title">운송장 번호 입력</h4>
								<button type="button" class="close" data-dismiss="modal">&times;</button>
							</div>
							<form action="completeDeal.gb" method="post">
								<div class="modal-body">			
									<input type="hidden" id="phProduct11" name="phProduct" value="test"/>
									<input type="hidden" id="phBuyer" name="phBuyer" value="test"/>
									<label for="company" class="mr-sm-2">택배사 : </label>
									<input type="text" class="form-control" name="company" id="company"/>
									<label for="invoice" class="mr-sm-2">송장번호 : </label>
									<input type="text" class="form-control" name="invoice" id="invoice"/>
								</div>
								<div class="modal-footer">
									<button type="button" onclick="test();">테스트</button>
									<button type="submit" class="btn btn-primary">입력</button>
									<button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
								</div>
							</form>
						</div>
					</div>
				</div>						
	
	<script>
		var phProduct1 = "";
		var phBuyer1 = "";
		$(document).ready(function(){
			$("#invoiceModal").on("show.bs.modal",function(event){
				phProduct1 = $(event.relatedTarget).data('phProduct');
				console.log(phProduct1);
				phBuyer1 = $(event.relatedTarget).data('phBuyer');
				console.log(phBuyer1);
				
				$("#phProduct11").val(phProduct1);
				$("#phBuyer").val(phBuyer);
				
				console.log($("#phProduct11").val());
			});			
		})
	
		function test(){
			var pno = $("#phProduct_${purchaseHistory.phNo}").val();
			var buyer = $("#phBuyer_${purchaseHistory.phNo}").val();
			console.log(pno);
			console.log(buyer)
		}
	
	</script>
	<!-- 
	<script>
		function insertInvoice(){

			var company = $("#company").val();
			var invoice = $("#invoice").val();
			
			$.ajax({
				url:"insertInvoice.gb",
				type:"post",
				data:{
					company:company,
					invoice:invoice
				},
				success:function(status){
					console.log(status);
					if(status=="success"){
						console.log("송장번호 등록 성공");
						//location.href="completeDeal.gb?phProduct=${purchaseHistory.phProduct}&phBuyer=${purchaseHistory.phBuyer}";
					}else{
						console.log("송장번호 등록 실패")
					}
				},
				error:function(){
					console.log("error");
				}
			})
		}	
	</script>
	 -->
	<!-- 
	<jsp:include page="../common/footer.jsp"/>
	-->
</body>
</html>