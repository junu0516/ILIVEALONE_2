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
	
    <title>패션 게시판 리스트</title>

    
	<style>
    /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
    .row.content {height: 100%;}
    
    /* Set gray background color and 100% height */
    .sidenav {
      height: 100%;
    }

    /* On small screens, set height to 'auto' for sidenav and grid */
    @media screen and (max-width: 767px) {
      .sidenav {
        height: auto;
      }
      .row.content {height:auto;} 
    }
    
    #showImage {
    	height: auto;
    	
    }
    
    #page-top{ padding-top: 61px; }
    #boardList{text-align: center;}
    #boardList>tbody>tr:hover{cursor:pointer;}

    #pagingArea{width:fit-content;margin:auto;}
    /* #pagingArea a{color:black} */
   
    #searchForm{
        width:80%;
        margin:auto;
    }
    #searchForm>*{
        float:left;
        margin:5px;
    }
    .select{width:20%;}
    .text{width:53%;}
    .searchBtn{Width:20%;}
    
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
        
        
       #cardArea{
        	display: flex;
        	flex-wrap: wrap;
        }
        
        #cardArea>.card{
        	border : 1px solid gray;
        	box-shadow : 5px 5px lightgray;
        }   
    </style>
</head>

	  <jsp:include page="../common/header.jsp"/>
<body id="page-top" >
	
	<!-- Page Wrapper -->
    <div id="wrapper">
	

	
	
		<!-- 사이드 부분 -->
        <!-- Sidebar -->
           <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" a href="${pageContext.servletContext.contextPath}">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-laugh-wink"></i>
                </div>
                <div class="sidebar-brand-text mx-3">패션</div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
             <li class="nav-item">
               <hr class="sidebar-divider">
               <a href="Toplistf.ho" class="list-group-item list-group-item-success">하우스  메인 </a></p>
      			<hr class="sidebar-divider">
      			<a href="list.ho" class="list-group-item list-group-item-success">하우스 게시물</a></p>
      			<hr class="sidebar-divider">
      			<a href="blist.ho" class="list-group-item list-group-item-success">하우스 최신뉴스</a></p>
      			<hr class="sidebar-divider">
      			
      			<a href="list.no" class="list-group-item list-group-item-success">공지사항</a></p>
            </li>

            <!-- Divider -->
            

            <!-- Heading -->
            
            <!-- Nav Item - Pages Collapse Menu -->
          </ul>
       	 <!-- End of Sidebar -->


		<!-- 바디부분  -->
        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

              <div class="col-sm-15 text-center">

                <!-- Begin Page Content -->
                <div class="container-fluid center">
				

	<br>      
      <h2>하우스 사진 게시판 <i class="far fa-clipboard" style="font-size: 20px;"></i></h2>
             
            <br>
            <!-- 로그인후 상태일 경우만 보여지는 글쓰기 버튼-->
            <c:if test="${ !empty loginUser }">
            	<a class="btn btn-secondary" style="float:right" href="enrollFormP.ho">글쓰기</a>
            </c:if>
            <br>
          <!-- 검색 기능  -->
            <div class="container">
				<form class="form-inline" action="searchP.ho">
					<select class="form-control mb-2 mr-sm-2" name="condition">
						<option value="title">제목</option>
						<option value="content">내용</option>
						<option value="writer">작성자</option>
					</select>
					<input type="text" class="form-control mb-2 mr-sm-2" name="keyword" id="keyword" placeholder="검색어 입력"/>
					<button type="submit" class="btn btn-primary mb-2">검색</button>
				</form>
			</div>
			<br>
			<div class="container-fluid" id="cardArea">
				<c:forEach items="${list}" var="hp"> 
					<div class="card">
		        		<div class="card-header">
		           	 	<h5><b>${hp.housingPTitle}</b></h5>
		        		</div>
		        	<div>
					<img class="card-img-top" src="${pageContext.request.contextPath}/resources/images/commuity_housingP/${hp.housingPChangeName}" height="200px"/>
		        </div>
		        <div class="card-body">
		          
		          <p class="card-text">작성자 : ${hp.housingPWriter}</p>
		          <p class="card-text">날짜 : ${hp.housingPCreateDate}</p>
		          <p class="card-text">조회수 : ${hp.housingPCount}</p>
		          
		          <a href="detailP.ho?hpno=${hp.housingPNo}" class="btn btn-primary">상세 보기</a>
		        </div>
		     </div>
		</c:forEach>
     </div>
            <br>

            <div id="pagingArea">
                <ul class="pagination">
                		<c:url var="searchUrl" value="searchP.ho">
	 							<c:param name="condition" value="${condition}"/>
	 							<c:param name="keyword" value="${keyword}"/>
	 					</c:url>
                	<c:choose>
                		<c:when test="${ pi.currentPage ne 1 }">
                			<li class="page-item"><a class="page-link" href="blist.ho?currentPage=${ pi.currentPage-1 }">Previous</a></li>
                		</c:when>
                		<c:otherwise>
                			<li class="page-item disabled"><a class="page-link" href="">Previous</a></li>
                		</c:otherwise>
                	</c:choose>
                	
                    <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
                    	<c:choose>
	                		<c:when test="${ pi.currentPage ne p }">
                    			<li class="page-item"><a class="page-link" href="blist.ho?currentPage=${ p }">${ p }</a></li>
	                		</c:when>
	                		<c:otherwise>
	                			<li class="page-item disabled"><a class="page-link" href="">${ p }</a></li>
	                		</c:otherwise>
	                	</c:choose>
                    </c:forEach>
                    
                    
                    <c:choose>
                		<c:when test="${ pi.currentPage ne pi.maxPage }">
                			<li class="page-item"><a class="page-link" href="blist.ho?currentPage=${ pi.currentPage+1 }">Next</a></li>
                		</c:when>
                		<c:otherwise>
                			<li class="page-item disabled"><a class="page-link" href="blist.ho?currentPage=${ pi.currentPage+1 }">Next</a></li>
                		</c:otherwise>
                	</c:choose>
                </ul>
            </div>
            
            <br><br>
   
    		</div>
                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

        </div>
        <!-- End of Content Wrapper -->
	
     <script>
    	$(function(){
    		$("#housingPFList tbody tr").click(function(){
    			location.href="detailP.ho?hpno=" + $(this).children().eq(0).text();
    		});
    	});
    </script>	
    <!-- End of Page Wrapper -->
	


<div class="col-sm-2 sidenav">
      	<body onload = "showImage()">
      	<div class = "well" >
      		<h2>오늘의 가구</h2>
			<img class = "introImg" id = "introImg" border="0" >
       	<br><br><br>
        <hr>
        <br><br>
        	<h2>오늘의 침대</h2>
			<img class = "introImg1" id = "introImg1" border="0" >
      	</div>
      	</body>
    <script>
			var imgArray = new Array();
			imgArray[0] = "resources/img/라자가구.jfif";
			imgArray[1] = "resources/img/가구.jfif";
			imgArray[2] = "resources/img/영국 가구.jfif";
			imgArray[3] = "resources/img/의자.jfif";
			
			var imgArray1 = new Array();
			imgArray1[0] = "resources/img/크렌시아.jfif";
			imgArray1[1] = "resources/img/모던바로크.jfif";
			imgArray1[2] = "resources/img/소파.jfif";
			imgArray1[3] = "resources/img/스퀘어.jfif";

			
			function showImage(){
				var imgNum = Math.round(Math.random()*3);
				var objImg = document.getElementById("introImg");
				objImg.src = imgArray[imgNum];
				
				var imgNum1 = Math.round(Math.random()*3);
				var objImg1 = document.getElementById("introImg1");
				objImg1.src = imgArray1[imgNum1];
			
			}
			
			
	</script>
  </div>
  
</div>
	
   
	
	
    

</body>

	  <jsp:include page="../common/footer.jsp"/>
</html>