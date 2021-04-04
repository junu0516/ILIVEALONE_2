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
	
    <title>푸드 게시판 리스트</title>
	<script src="https://cdn.ckeditor.com/4.16.0/standard/ckeditor.js"></script>
	
    
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
                <div class="sidebar-brand-text mx-3">푸드</div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item">
               <hr class="sidebar-divider">
               <a href="Toplistf.fo" class="list-group-item list-group-item-success">푸드 메인 </a></p>
      			<hr class="sidebar-divider">
      			<a href="list.fo" class="list-group-item list-group-item-success">푸드 게시물</a></p>
      			<hr class="sidebar-divider">
      			<a href="blist.fo" class="list-group-item list-group-item-success">푸드 최신뉴스</a></p>
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

              <div class="col-sm-15 ">

                <!-- Begin Page Content -->
                <div class="container-fluid center">
				

	<br>      
			<h2 class = "text-center">게시글 수정하기</h2>
            <br>
			
						<!-- 첨부파일도 등록할꺼니깐 Multipart/form-data encType 지정!! -->
            <form id="updateForm" method="post" action="updateP.fo" enctype="multipart/form-data">
               <input type="hidden" name="foodPNo" value="${ fdp.foodPNo }">
               <table align="center">
                     <div class="form-group">
                        <label for="title">제목</label>
                        <input type="text" id="title" class="form-control" name="foodPTitle" value="${ fdp.foodPTitle }" required>
                    </div>
                     <div class="form-group">
                        <label for="writer">	작성자</label>
                        <input type="text" id="writer" class="form-control" value="${ fdp.foodPWriter }" readonly>
                    </div>
                    <div class="form-group">
                        <label for="upfile">사진</label>
                        <input type="file" id="upfile" class="form-control-file border" name="reUploadFile">
                            <c:if test="${ !empty fdp.foodPOriginName }">
	                                                               현재 업로드된 파일 : ${ fdp.foodPOriginName } <br>
	                            <input type="hidden" name="foodPChangeName" value="${fdp.foodPChangeName }">
	                            <input type="hidden" name="foodPOriginName" value="${fdp.foodPOriginName }">
                            </c:if>
                    </div>
              		<div class="form-group">
                		<label for="foodPContent">내용 : </label>
                		<textarea class="form-control" required name="foodPContent" id="foodPContent" >${ fdp.foodPContent }</textarea>
            		</div>      
         
                </table>
                
              
				<script>
            
				 	CKEDITOR.replace('foodPContent');

            		</script>
                <div align="center">
                 	<button type="submit" class="btn btn-primary">수정하기</button>
                    <button type="button" class="btn btn-danger" onclick="javascript:history.go(-1);">이전으로</button>
                </div>
            </form>
            <br><br>
   
                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

        </div>
        <!-- End of Content Wrapper -->
		</div>
    <!-- End of Page Wrapper -->
	<div class="col-sm-2 sidenav">
      	<body onload = "showImage()">
    
      	<div class = "well" >
      	<br>
      		<h3>오늘의 푸드</h3>
			<img class = "introImg" id = "introImg" border="0" >
       	<br><br><br>
        <hr>
        <br><br>
        	<h3>오늘의 디저트</h3>
			<img class = "introImg1" id = "introImg1" border="0" >
      	</div>
      	</body>
    <script>
			var imgArray = new Array();
			imgArray[0] = "resources/img/오사카.jfif";
			imgArray[1] = "resources/img/토스트.jfif";
			imgArray[2] = "resources/img/프랑스.jfif";
			imgArray[3] = "resources/img/국수.jfif";
			
			var imgArray1 = new Array();
			imgArray1[0] = "resources/img/딸기 케이크.jfif";
			imgArray1[1] = "resources/img/마카로.jfif";
			imgArray1[2] = "resources/img/마카롱.jfif";
			imgArray1[3] = "resources/img/케이크.jfif";

			
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