<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="">
	<title>공동구매 리스트</title>
	<link href="resources/css/custom/group_buy/groupBuyList.css" rel="stylesheet">        
	<link href="resources/css/custom/group_buy/headerBalance.css" rel="stylesheet">
</head>

<body id="page-top">
	<!-- 헤더 페이지 적용(네비게이터) -->
	<jsp:include page="../common/header.jsp"/>
	
    <div id="wrapper">
    	<jsp:include page="groupBuySideBar.jsp"/>
      
        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">
        	<!-- Main Content -->
            <div id="content">
                <!-- Begin Page Content -->
                <div class="container-fluid">
	                <br>
  					<h1 class="display-5">공동구매 리스트</h1>
  					<br>
        			<c:if test="${!empty sessionScope.loginUser }">
        				<div class="container">
                			<a href="insertView.gb" class="btn btn-primary">판매 등록</a>
            			</div>
            			<br><br>
        			</c:if>
        			<div class="container">
            			<form class="form-inline" action="search.gb">
                			<select class="form-control mb-2 mr-sm-2" name="condition">
                    			<option value="title">제목</option>
                    			<option value="product">제품</option>
                			</select>
                			<input type="text" class="form-control mb-2 mr-sm-2" name="keyword" id="keyword" placeholder="검색어 입력"/>
                			<button type="submit" class="btn btn-primary mb-2">검색</button>
            			</form>
        			</div>
        		<div class="container-fluid" id="cardArea">
            		<c:forEach items="${list}" var="gbBoard">
                		<div class="card">
                    		<div class="card-header">
                        		<h5><b>${gbBoard.gbTitle}</b></h5>
                    		</div>
                    	<div>
                        	<img class="card-img-top" src="${pageContext.request.contextPath}/resources/images/group_buy/${gbBoard.gbChangedName}" height="400px"/>
                    	</div>
                    	<div class="card-body">
                        	<h4 class="card-title">${products[gbBoard.gbNo].PName}</h4>
                        	<p class="card-text">${products[gbBoard.gbNo].PLimit}명 도달시 종료</p>
                        	<p class="card-text">${products[gbBoard.gbNo].PPrice} 원</p>
                        	<a href="detail.gb?gbNo=${gbBoard.gbNo}" class="btn btn-primary">상세 보기</a>
                    	</div>
                		</div>
           	 		</c:forEach>
        		</div>
        		<br><br>
		        <ul class="pagination">
		            <c:url var="searchUrl" value="search.gb">
		                <c:param name="condition" value="${condition}"/>
		                <c:param name="keyword" value="${keyword}"/>
		            </c:url>
		            <c:choose>
		                <c:when test="${pageInfo.currentPage ne 1}">
		                    <c:if test="${empty keyword}">
		                        <li class="page-item">
		                            <a class="page-link" href="list.gb?currentPage=${pageInfo.currentPage-1}">Previous</a>
		                        </li>
		                    </c:if>
		                    <c:if test="${!empty keyword}">
		                        <li class="page-item">
		                            <a class="page-link" href="${searchUrl}&currentPage=${pageInfo.currentPage-1}">Previous</a>
		                        </li>
		                    </c:if>
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
		                        <c:if test="${empty keyword}">
		                            <li class="page-item">
		                                <a class="page-link" href="list.gb?currentPage=${p}">${p}</a>
		                            </li>
		                        </c:if>
		                        <c:if test="${!empty keyword}">
		                            <li class="page-item">
		                                <a class="page-link" href="${searchUrl}&currentPage=${p}">${p}</a>
		                            </li>
		                        </c:if>
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
		                    <c:if test="${empty keyword}">
		                        <li class="page-item">
		                            <a class="page-link" href="list.gb?currentPage=${pageInfo.currentPage+1}">Next</a>
		                        </li>
		                    </c:if>
		                    <c:if test="${!empty keyword}">
		                        <li class="page-item">
		                            <a class="page-link" href="${searchUrl}&currentPage=${pageInfo.currentPage+1}">Next</a>
		                        </li>
		                    </c:if>
		                </c:when>
		                <c:otherwise>
		                    <li class="page-item disabled">
		                        <a class="page-link" href="list.gb?currentPage=${pageInfo.currentPage+1}">Next</a>
		                    </li>
		                </c:otherwise>
		            </c:choose>
		        </ul>
                </div>
                <!-- /.container-fluid -->
            </div>
            <!-- End of Main Content -->
        </div>
        <!-- End of Content Wrapper -->
    </div>
    <!-- End of Page Wrapper -->
    <jsp:include page="../common/footer.jsp"/>
    <script>
	    $(function () {
	    	console.log("start");
	        if(${not empty message}){
	        	alert("${message}");
	        }
	        
	    })   
    </script>
</body>
</html>