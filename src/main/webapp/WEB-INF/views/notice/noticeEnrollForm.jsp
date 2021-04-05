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
	
    <title>공지사항</title>
	<script src="//cdn.ckeditor.com/4.16.0/standard/ckeditor.js"></script>
    
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
                <div class="sidebar-brand-text mx-3">공지사항</div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item">
               <hr class="sidebar-divider">
               <a href="Toplist.bo" class="list-group-item list-group-item-success">패션 메인 </a></p>
      			<hr class="sidebar-divider">
      			<a href="Toplistf.bo" class="list-group-item list-group-item-success">푸드 메인 </a></p>
      			<hr class="sidebar-divider">
      			<a href="Toplistf.ho" class="list-group-item list-group-item-success">하우징 메인</a></p>
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
      <h2 class = "text-center">게시글 작성하기</h2>
            <br>
			

			<!-- 첨부파일도 등록할꺼니깐 Multipart/form-data encType 지정!! -->
            <form id="enrollForm" method="post" action="insert.no" enctype="multipart/form-data">
                <table align="center">
                     <div class="form-group">
                        <label for="title">제목</label>
                        <input type="text" id="title" class="form-control" name="noticeTitle" required >
                    </div>
                     <div class="form-group">
                        <label for="writer">작성자</label>
                        <input type="text" id="writer" class="form-control" value="${ loginUser.userId }" name="noticeWriter" readonly>
                    </div>
                    <div class="form-group">
                        <label for="upfile">첨부파일</label>
                        <input type="file" id="upfile" class="form-control-file border" name="uploadFile">
                    </div>
              		<div class="form-group">
                		<label for="noticeContent">내용 : </label>
                		<textarea class="form-control" id="noticeContent" name = "noticeContent"></textarea>
            		</div>      
         
                </table>
                
              
				<script>
            
             
             	CKEDITOR.replace('noticeContent',{
            		height: 500,
            	    filebrowserUploadUrl: '${pageContext.request.contextPath}/ckeditor/upload.ck?function=10'
            		});
				
           		 </script>
            		</script>
                <div align="center">
                    <button type="submit" class="btn btn-primary">등록하기</button>
                    <button class="btn btn-danger"><a href=list.bo>취소하기</a></button>
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

  
</div>
	
   
	
	
    

</body>

	  <jsp:include page="../common/footer.jsp"/>
</html>