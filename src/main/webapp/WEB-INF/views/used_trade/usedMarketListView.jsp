<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.card{
 	
	  	float:left;
	  	margin:4px; } 

				
.pagination{
	display:block;
	text-align:center;	


}

				
.pagination{	position: absolute;
			     bottom: 0; 
			     
			     left:50%;
				margin:auto; }
</style>
</head>
<body>
	  <jsp:include page="../common/header.jsp"/>


 <div align="center">
 
 <h2>중고거래</h2>

 <hr>
 <a class="btn btn-secondary" style="float:right" href="enrollForm.um">글쓰기</a> 
 </div>
	<c:forEach items="${ list }" var="u">
 	<form id="cardForm" >
				<div class="card" style="width: 18rem;">
				  <img src="./resources/upload_file/${u.changeName }" class="card-img-top"  width="200" height="200">
				  <div class="card-body">
				  	<input type="hidden" value =${u.um_No }>
				    <h5 class="card-title"><b>${u.um_Title }</b></h5>
				    <hr>
				    <p class="card-text"><b>가격: </b>${u.um_Price}<b> 원</b></p>
				    <hr>
				    <p class="card-text"><b>작성자: </b>${u.um_Writer} </p>
				    <a href="detail.um?uno=${u.um_No }" class="btn btn-primary">상세보기</a>
				  </div>
				</div>
		</c:forEach>
				
		</form>		
		
		
		<div id="pagingArea" align="center">
                <ul class="pagination">
                	<c:choose>
                		<c:when test="${ pi.currentPage ne 1 }">
                			<li class="page-item"><a class="page-link" href="list.um?currentPage=${ pi.currentPage-1 }">이전으로</a></li>
                		</c:when>
                		<c:otherwise>
                			<li class="page-item disabled"><a class="page-link" href="">처음</a></li>
                		</c:otherwise>
                	</c:choose>
                	
                    <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
                    	<c:choose>
	                		<c:when test="${ pi.currentPage ne p }">
                    			<li class="page-item"><a class="page-link" href="list.um?currentPage=${ p }">${ p }</a></li>
	                		</c:when>
	                		<c:otherwise>
	                			<li class="page-item disabled"><a class="page-link" href="">${ p }</a></li>
	                		</c:otherwise>
	                	</c:choose>
                    </c:forEach>
                    
                    
                    <c:choose>
                		<c:when test="${ pi.currentPage ne pi.maxPage }">
                			<li class="page-item"><a class="page-link" href="list.um?currentPage=${ pi.currentPage+1 }">다음으로</a></li>
                		</c:when>
                		<c:otherwise>
                			<li class="page-item disabled"><a class="page-link" href="list.um?currentPage=${ pi.currentPage+1 }">마지막</a></li>
                		</c:otherwise>
                	</c:choose>
                </ul>
            </div>
           
            <br clear="both"><br>
            
			
            <br><br>
        </div>
        <br><br>
    </div>
    
    <script>
    	$(function(){
    		$("#boardList tbody tr").click(function(){ //게시물 클릭했을때 해당 게시물 bno 보냄
    			location.href="detail.bo?uno=" + $(this).children().eq(0).text();
    		});
    	});
    </script>
		  <jsp:include page="../common/footer.jsp"/>
	
</body>
</html>