<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<title>공동구매 리스트!</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
   
    <style>
    
        .container{
            display: flex;
            float:left;
        }
        
        .card{
            display: inline-block;
            justify-content: center;
            margin-left: 20px;
            margin-top: 20px;
            width: 30%;
        }
        
        .pagination{
            display: flex;
            justify-content: center;
        }
        
        #cardArea{
        	display: flex;
        	flex-wrap: wrap;
        	
        }
        
        #cardArea>.card{
        	border : 1px solid gray;
        	box-shadow : 5px 5px lightgray;
        }
        
        #mainTitle{
        	margin-top : 20px;
        }
        
    </style>
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
	<h1 class="display-4" align="center" id="mainTitle">공동구매</h1>
	<a href="test.gb">트랜잭션 테스트</a>
	<c:if test="${!empty sessionScope.loginUser }">
	<div class="container">
		<a href="insertView.gb" class="btn btn-primary">판매 등록</a>
	</div>
	</c:if>
	<br><br><br>
	<a href="salesHistory.gb">판매내역 조회하기</a>
	<a href="purchaseHistory.gb">구매내역 조회하기</a>
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
					<img class="card-img-top" src="${pageContext.request.contextPath}/resources/upload_files/${gbBoard.gbChangedName}" height="400px"/>
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
	    		<li class="page-item"><a class="page-link" href="list.gb?currentPage=${pageInfo.currentPage-1}">Previous</a></li>
	    		</c:if>
	    		<c:if test="${!empty keyword}">
				<li class="page-item"><a class="page-link" href="${searchUrl}&currentPage=${pageInfo.currentPage-1}">Previous</a></li>    
	    		</c:if>
	     	</c:when>
	     	<c:otherwise>
	     	<li class="page-item disabled"><a class="page-link" href="">Previous</a></li>
	     	</c:otherwise>
	     </c:choose>
	     	
	     <c:forEach begin="${pageInfo.startPage}" end="${pageInfo.endPage}" var="p">
	     	<c:choose>
	     		<c:when test="${pageInfo.currentPage ne p}">
	     			<c:if test="${empty keyword}">
		     		<li class="page-item"><a class="page-link" href="list.gb?currentPage=${p}">${p}</a></li>	     			
	     			</c:if>
	     			<c:if test="${!empty keyword}">
		     		<li class="page-item"><a class="page-link" href="${searchUrl}&currentPage=${p}">${p}</a></li>	     			
	     			</c:if>
	     		</c:when> 
	     		<c:otherwise>
	     		<li class="page-item disabled"><a class="page-link" href="">${p}</a></li>
	     		</c:otherwise>
	     	</c:choose>
	     </c:forEach>
	     	
	     <c:choose>
	     	<c:when test="${pageInfo.currentPage ne pageInfo.maxPage}">
	     		<c:if test="${empty keyword}">
	     			<li class="page-item"><a class="page-link" href="list.gb?currentPage=${pageInfo.currentPage+1}">Next</a></li>
	     		</c:if>
	     		<c:if test="${!empty keyword}">
	     			<li class="page-item"><a class="page-link" href="${searchUrl}&currentPage=${pageInfo.currentPage+1}">Next</a></li>	     		
	     		</c:if>
	     	</c:when>
	     	<c:otherwise>
	     		<li class="page-item disabled"><a class="page-link" href="list.gb?currentPage=${pageInfo.currentPage+1}">Next</a></li>
	     	</c:otherwise>
	     </c:choose>	
	</ul>
		
	<jsp:include page="../common/footer.jsp"/>
	
</body>
</html>