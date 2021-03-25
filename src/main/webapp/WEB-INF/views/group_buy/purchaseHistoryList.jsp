<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매내역 조회</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"><script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<script>
		$(function(){
			if(${not empty message}){
				alert("${message}");
			}
		})
	</script>
	<br><br>
	<div class="container">
	
		<h2>구매내역 조회</h2>
		<br>
		&nbsp 구매자 아이디 : ${loginUser.userId}
		<table class="table">
			<thead>
				<tr>
					<th>거래번호</th>
					<th>구매자명</th>
					<th>구매물품</th>
					<th>구매수량</th>
					<th>등록날짜</th>
					<th>수정날짜</th>
					<th>구매상태</th>
					<th>상태수정</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${purchaseHistories}" var="purchaseHistory">
				<tr>
					<td>${purchaseHistory.phNo}</td>
					<c:set var="sharp" value="<%='#'%>"/>
					<td><a data-toggle="collapse" href="${sharp}detail_${purchaseHistory.phNo}" aria-expanded="false" aria-controls="detail_${purchaseHistory.phNo}">${purchaseHistory.phBuyerName}</a></td>
					<td><a href="detail.gb?pNo=${purchaseHistory.phProduct}">${purchaseHistory.phProductName}</a></td>
					<td>${purchaseHistory.phQuantity}</td>
					<td>${purchaseHistory.phRecordDate}</td>
					<td>${purchaseHistory.phChangeDate}</td>
					<c:if test="${purchaseHistory.phStatus eq 'N'}">
					<td>거래 취소</td>
					<td> </td>
					</c:if>
					<c:if test="${purchaseHistory.phStatus eq 'Y'}">
						<c:if test="${purchaseHistory.phSalesStatus eq 'W'}">
						<td>거래 대기</td>
						<td>
							<a class="btn btn-danger btn-sm" href="cancelDeal.gb?phNo=${purchaseHistory.phNo}&phProduct=${purchaseHistory.phProduct}&phBuyer=${purchaseHistory.phBuyer}" onclick=" return cancelDeal();">취소하기</a>
						</td>		
						</c:if>	
						<c:if test="${purchaseHistory.phSalesStatus eq 'R'}">
						<td>발송 준비</td>
						<td> </td>		
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
								<li>제품명 : ${purchaseHistory.phProduct}</li>
								<li>판매자ID : ${purchaseHistory.phSeller}</li>
								<li>받는주소 : ${purchaseHistory.phAddress}</li>
								<li>배송정보 : ${purchaseHistory.phInvoice}</li>
							</ul>
						</div>							
					</td>
				</tr>		
				</c:forEach>	
			</tbody>
		</table>
	</div>
	
	<script>
		function cancelDeal(){
			return confirm("정말 취소하시겠습니까?");
		}
	
	
	</script>	
</body>
</html>