<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
	<title>구매내역 조회</title>
	<link href="resources/css/custom/group_buy/headerBalance.css" rel="stylesheet">
	<style>
    
    	.pagination{
    		float : right;
    	}
    	
    </style>
</head>
<body  id="page-top">
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
	            	<h2>구매내역 조회</h2>
					<br>
					&nbsp 구매자 아이디 : ${loginUser.userId}
					<ul class="pagination pagination-sm">
			            <c:choose>
			                <c:when test="${pageInfo.currentPage ne 1}">
			                   
			                        <li class="page-item">
			                            <a class="page-link" href="purchaseHistory.gb?currentPage=${pageInfo.currentPage-1}">Previous</a>
			                        </li>
			                 
			                </c:when>
			                <c:otherwise>
			                    <li class="page-item disabled">
			                        <a class="page-link" href="">Previous</a>
			                    </li>
			                </c:otherwise>
			            </c:choose>
			            <c:forEach begin="${pageInfo.startPage}" end="${pageInfo.endPage}" var="p">
			                <c:choose>
			                    <c:when test="${pageInfo.currentPage ne p}">
			                    	<li class="page-item">
			                        	<a class="page-link" href="purchaseHistory.gb?currentPage=${p}">${p}</a>
			                    	</li>
			                    </c:when>
			                    <c:otherwise>
			                        <li class="page-item disabled">
			                            <a class="page-link" href="">${p}</a>
			                        </li>
			                    </c:otherwise>
			                </c:choose>
			            </c:forEach>
			            <c:choose>
			                <c:when test="${pageInfo.currentPage ne pageInfo.maxPage}">
			                	<li class="page-item">
			                    	<a class="page-link" href="purchaseHistory.gb?currentPage=${pageInfo.currentPage+1}">Next</a>
			                	</li> 
			                </c:when>
			                <c:otherwise>
			                    <li class="page-item disabled">
			                        <a class="page-link" href="purchaseHistory.gb?currentPage=${pageInfo.currentPage+1}">Next</a>
			                    </li>
			                </c:otherwise>
			            </c:choose>
			        </ul>
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
											<li>입금계좌 : ${purchaseHistory.phAccount}</li>
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
            	<!-- /.container-fluid -->
			</div>
        	<!-- End of Main Content -->
		</div>
    	<!-- End of Content Wrapper -->
    </div>	
	
	<jsp:include page="../common/footer.jsp"/>
	<script>
		$(function () {
	        if(${not empty message}){
	        	alert("${message}");
	        };
	        
	    })  
	    
		function cancelDeal(){
			return confirm("정말 취소하시겠습니까?");
		}
	</script>
</body>
</html>