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
	
    <title>푸드 업데이트</title>
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
   
    
    #page-top{ padding-top: 61px; }

        }
    </style>
</head>

	  <jsp:include page="../common/header.jsp"/>
<body id="page-top" >
	
	<!-- Page Wrapper -->
    <div id="wrapper">
	
		<jsp:include page="foodSideBar.jsp"/>

	
	
		

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
            <form id="updateForm" method="post" action="updatef.fo" enctype="multipart/form-data">
               <input type="hidden" name="foodNo" value="${ fd.foodNo }">
               <table align="center">
                     <div class="form-group">
                        <label for="title">제목</label>
                        <input type="text" id="title" class="form-control" name="foodTitle" value="${ fd.foodTitle }" required>
                    </div>
                     <div class="form-group">
                        <label for="writer">작성자</label>
                        <input type="text" id="writer" class="form-control" value="${ fd.foodWriter }" readonly>
                    </div>
                    <div class="form-group">
                        <label for="upfile">첨부파일</label>
                        <input type="file" id="upfile" class="form-control-file border" name="reUploadFile">
                            <c:if test="${ !empty fd.originName }">
	                                                               현재 업로드된 파일 : ${ fd.originName } <br>
	                            <input type="hidden" name="changeName" value="${ fd.changeName }">
	                            <input type="hidden" name="originName" value="${ fd.originName }">
                            </c:if>
                    </div>
              		<div class="form-group">
                		<label for="foodcontent">내용 : </label>
                		<textarea class="form-control"  name="foodContent" id="foodContent" >${ fd.foodContent }</textarea>
            		</div>      
         
                </table>
                
              
            <script>
	           	 CKEDITOR.replace('foodContent');
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
	<jsp:include page="foodSideBar2.jsp"/>
	
  
</div>
	
   
	
	
    

</body>

	  <jsp:include page="../common/footer.jsp"/>
</html>