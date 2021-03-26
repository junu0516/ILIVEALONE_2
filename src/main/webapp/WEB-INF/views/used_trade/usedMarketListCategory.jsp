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
 
 <select id="categoryForm" >
 
	<option id="all" value="전체">전체</option>
	<option id="wear" value="의류">의류</option>
	<option id="electronics" value="전자제품">전자제품</option>
	<option id="living" value ="생활용품">생활용품</option>

</select>

 </div>


			<c:forEach items="${ listC }" var="u">

 		<form id="cardForm" >
				<div class="card" style="width: 18rem;">
				  <img src="./resources/upload_file/${u.changeName }" class="card-img-top"  width="200" height="200">
				  
				  <div class="card-body">
				  	
				  	<input type="hidden" value =${u.um_No }>
				   
				    <h5 class="card-title"><b>${u.um_Title }</b></h5>
				    <p><b>작성일:</b> ${u.um_Date}</p>
				    <hr>
				    <p class="card-text"><b>가격: </b>${u.um_Price}<b> 원</b></p>
				    <hr>
				    <p class="card-text"><b>작성자: </b>${u.um_Writer} </p>
				    <a href="detail.um?uno=${u.um_No }" class="btn btn-primary">상세보기</a>
				  	  
				  </div>
				</div>	
		
		</form>		

			</c:forEach>

	
		
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
	                	=-	</c:otherwise>
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
    
function categorySelect(selectVal){
	var wear = $("#wear");
	var electronics = $("#electronics");
	var living = $("#living");
	
	
	console.log ("selectVal:  "+selectVal);

	if(selectVal == "의류"){
		wear.attr("selected","selected");
	}else if(selectVal == "전자제품"){
		electronics.attr("selected","selected");
	}else if (selectVal == "생활용품"){
		living.attr("selected","selected");
	}
	

}


$(function(){

	var $categoryForm = $("#categoryForm"); 
	
	
	$categoryForm.change(function(){
		
		 console.log("ajax Function 테스트 값 전달:  "+$categoryForm.val());
		 
		if($categoryForm.val() != "전체"){
			
				$.ajax({
					url:"listCategory.um",
					
					data:{category:$categoryForm.val()},
					type:"post",
					dataType:"html",
					success: function(listC){
						//categorySelect(category);
						//result = category;
						//location.reload();
	
						$('#cardForm').children().remove();
						//$('#cardForm').html(listC);
						
						alert("성공");
						

					}
						
					,error:function(){
						console.log("카테고리 ajax 통신 실패");
					}
				});
				
		}
		
	});
});

</script>
		  <jsp:include page="../common/footer.jsp"/>
	
</body>
</html>