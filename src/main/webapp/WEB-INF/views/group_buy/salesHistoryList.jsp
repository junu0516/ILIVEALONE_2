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
    <title>판매내역 조회</title>       
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
			                    <th>수정날짜</th>
			                    <th>판매상태</th>
			                    <th>상태수정</th>   
	                    	</tr>
	                	</thead>
	                	<tbody>
	                    	<c:forEach items="${purchaseHistories}" var="purchaseHistory">
	                        <tr>
								<td>${purchaseHistory.phNo}</td>
	                            <c:set var="sharp" value="<%='#'%>"/>
		                        <td>
		                        	<a data-toggle="collapse" href="${sharp}detail_${purchaseHistory.phNo}" aria-expanded="true" aria-controls="detail_${purchaseHistory.phNo}">${purchaseHistory.phBuyer}</a>
		                            <input type="hidden" id="phBuyer_${purchaseHistory.phBuyer}" value="${purchaseHistory.phBuyer}">
		                            <input type="hidden" id="phProduct_${purchaseHistory.phProduct}" value="${purchaseHistory.phProduct}">
		                        </td>
		                        <td>
		                        	<a href="detail.gb?pNo=${purchaseHistory.phProduct}">${purchaseHistory.phProductName}</a>
		                        </td>
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
		                            	<form action="prepareDeal.gb" method="post">
		                            		<input type="hidden" name="phProduct" value="${purchaseHistory.phProduct}"/>
		                            		<input type="hidden" name="phBuyer" value="${purchaseHistory.phBuyer}"/>
		                            		<input type="hidden" name="phNo" value="${purchaseHistory.phNo}"/>
		                            		<button type="submit" class="btn btn-primary btn-sm">입금확인</button>
		                            	</form>
		                            </td>
		                            </c:if>
		                           	<c:if test="${purchaseHistory.phSalesStatus eq 'R'}">
		                            <td>발송 준비</td>
		                            <td>
		                            	<a class="btn btn-success btn-sm" id="insertDeliveryInfo_${purchaseHistory.phNo}" data-toggle="modal" data-target="#invoiceModal">배송정보 입력</a>
		                            </td>
		                            <script>
			                            var buyerId = "null";
	                                	var productId = "null";
	                                	
                                        $(window).on('load',function(){
                                        	$("#insertDeliveryInfo_${purchaseHistory.phNo}").on("click", function () {
                                                buyerId = "<c:out value='${purchaseHistory.phBuyer}'/>";
                                                productId = "<c:out value='${purchaseHistory.phProduct}'/>";
                                                console.log(buyerId);
                                                console.log(productId);
                                            });	
                                        })
                                        
                                    </script>
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
    <script>
    
    </script>
    <!-- 송장번호 입력 모달 -->
	<div class="modal fade" id="invoiceModal">
    	<div class="modal-dialog modal-sm">
        	<div class="modal-content">
            	<div class="modal-header">
                	<h4 class="modal-title">운송장 번호 입력</h4>
                    	<button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <form id="postForm" action="completeDeal.gb" method="post">
                    <div class="modal-body">
                    	<input type="hidden" id="phProduct-modal" name="phProduct" value=""/>
                       	<input type="hidden" id="phBuyer-modal" name="phBuyer" value=""/>
                        <label for="company" class="mr-sm-2">택배사 :</label>
                        <input type="text" class="form-control" name="company" id="company"/>
                        <label for="invoice" class="mr-sm-2">송장번호 :</label>
                        <input type="text" class="form-control" name="invoice" id="invoice"/>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" id="submitBtn" class="btn btn-primary">입력</button>
                    	<button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
                	</div>
				</form>
			</div>
		</div>
	</div>        
    <script>
	    $(function () {
	    	console.log("start");
	        if(${not empty message}){
	        	alert("${message}");
	        }
	        
	    })       
                                                                      
        $("#submitBtn").on("click", function () {
            $("#phBuyer-modal").val(buyerId);
            $("#phProduct-modal").val(productId);
        });            
	</script>
    <!-- End of Page Wrapper -->	
    <jsp:include page="../common/footer.jsp"/>
   
</body>
</html>