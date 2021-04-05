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

    <title>중고거래</title>


<style>
#accordionSidebar{
 position: relative;
	top:50px;
}

#big_div{

		 position: relative;
        top: 80px;


}
#testDiv{
	color:black;
	background-color: blue;

	
}
.card{
 		
	  	float:left;
	  	margin:4px; 
	  	} 

.pagination{
            display: flex;
            justify-content: center;
            clear:left;
       }
        
     
.pagination a {

  color: black;

  float: left;

  padding: 8px 16px;

  text-decoration: none;

  border-radius:10%;

}

#categoryForm{

	background-color: skyblue;
	color:white;

}



#testDiv2 :hover:not(.active) {background-color: silver;}

#testDiv :hover:not(.active) {background-color: silver;}

.pagination a:hover:not(.active) {background-color: silver;}

</style>
</head>

<body id="page-top">
	<jsp:include page="../common/header.jsp"/>
	<!-- 바디 부분 -->
    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="list.um">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-laugh-wink"></i>
                </div>
                <div class="sidebar-brand-text mx-3">중고거래</div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

  <!-- Nav Item - Dashboard -->
            
            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
               	category
            </div>
             <hr class="sidebar-divider">
            
		 <li class="nav-item">
			                                   
			 <select id="categoryForm" class="form-control" >
			 
				<option id="all" value="전체 ">전체</option>
				<option id="wear" value="의류">의류</option>
				<option id="electronics" value="전자제품">전자제품</option>
				<option id="living" value ="생활용품">생활용품</option>
				<option id="book" value ="도서">도서</option>
				<option id="food" value ="식품">식품</option>
				<option id="furniture" value ="가구">가구</option>
				
			
			</select>   
       
        </ul>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">
  

                <!-- Begin Page Content -->
                <div class="container-fluid" id="big_div">
<div align="center">
 
 <h2>중고거래</h2>
<div id="categoryTitle"></div>
 <hr>
 <c:if test="${! empty sessionScope.loginUser }">
 <a class="btn btn-secondary" style="float:right" href="enrollForm.um">글쓰기</a> 
 </c:if>


 </div>
 <br>
 
<div id="testDiv">

	<c:forEach items="${ list }" var="u" >

 		<form id="cardForm" >
				<div id="cardAll" class="card" style="width: 18rem;">
				  <img src="./resources/images/used_market/${u.changeName }" class="card-img-top"  width="200" height="200">
				 
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


</div>
<br> 
<div id="testDiv2" > </div> <!-- 카테고리 단 -->


		
		<div id="pagingArea"  >
                <ul class="pagination justify-content-center" >
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
            <!-- End of Main Content -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="login.html">Logout</a>
                </div>
            </div>
        </div>
    </div>

    
    <script>
 $(function(){
	
	var $categoryForm = $("#categoryForm"); 
	
	
	
	$categoryForm.change(function(){
		var listArr = [];
		var categoryVal = $categoryForm.val();
		
		
		 console.log("ajax Function 테스트 값 전달:  "+$categoryForm.val());
		 
		 if($categoryForm.val() != "전체"){
			
				$.ajax({
					url:"listCategory.um",
					 async:false,
					data:{category:$categoryForm.val()},
					type:"post",
					dataType:"json",
					success: function(listVal){

						$('#testDiv').hide();

						 listArr =listVal;
						 $('#testDiv2').show();
					
					
						console.log("categoryVal:  "+ categoryVal);
						console.log("listArr 리스트JSP확인: "+listArr);
						console.log("listVal 값넘어오는지 확인: "+listVal);
						
						$('#pagingArea').hide();
						
						var output ="";
						
						$.each(listArr,function(index,item){ 
	
							output += '<form id="cardFor">';
							output += '<div id="cardAll" class="card" style ="width:18rem;">';
							output += '<img src ="./resources/images/used_market/'+ item.changeName +' " class="card-img-top" width="200" height="200">';
							output += '<div class="card-body">';
							output += '<input type="hidden" value='+ item.um_No;
							output += '<h5 class ="card-title"><b>' +item.um_Title +' </b></h5>';
							output +='<p><b>작성일:</b> '+ item.um_Date + '</p>';
							output += '<hr>';
							output += '<p class="card-text"><b>가격:</b> '+ item.um_Price +'<b>원</b></p>';
							output +='<hr>';
							output +='<p class="card-text"><b>작성자: </b>' +item.um_Writer +'</p>';
							output +='<a href="detail.um?uno='+ item.um_No +'" class="btn btn-primary">상세보기</a>';
							output +='</div>';
							output +='</div>';
							output +='</form>';
					
							
							
						});
						
						$('#testDiv2').html(output);
						$('#pagingArea').hide();
						$('#categoryTitle').html(categoryVal);
					
						
						
						
						
						
						alert("성공");
						

					}
						
					,error:function(){
						console.log("카테고리 ajax 통신 실패");
					}
				});
				
		}else{
			
			console.log("else구문 실행  테스트 왜 조건문이 안먹는건데 잘만먹다가 사이드바 추가하니까 그러네 ");
			$('#testDiv').show();
			$('#pagingArea').show();

		}
		
	});
});
   </script>
   
   
   
</body>

</html>