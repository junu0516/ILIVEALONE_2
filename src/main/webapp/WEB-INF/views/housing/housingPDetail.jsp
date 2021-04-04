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
	
    <title>하우스 게시판 리스트</title>

    
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
                <div class="sidebar-brand-text mx-3">하우스</div>
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

              <div class="col-sm-15 ">

                <!-- Begin Page Content -->
                <div class="container-fluid center">
				

	<br>      
            <h2 class = "text-center">게시글 상세보기</h2>
            <br>
            	<div class = "text-right">
            	 <button class="btn btn-primary"><a href="blist.ho" >홈으로</a></button>
            	</div>
            <br><br>

                        <table id="contentArea" align="center" class="table">
                <tr>
                    <th width="100">제목</th>
                    <td colspan="3">${ hp.housingPTitle }</td>
                </tr>
                <tr>
                    <th>작성자</th>
                    <td>${ hp.housingPWriter }</td>
                    <th>작성일</th>
                    <td>${ hp.housingPCreateDate }</td>
                </tr>
                <tr>			
                	<th>조회</th>
                	<td colspan="3">
                	${hp.housingPCount}
                	</td>
                </tr>
                <tr>  
                    <th>사진</th>
                    <td colspan="3">
                    	<c:if test="${ !empty hp.housingPOriginName }">
                        	<img src ="${ pageContext.servletContext.contextPath }/resources/images/commuity_housingP/${hp.housingPChangeName}" alt = "">
                        </c:if>
                        <c:if test="${ empty hp.housingPOriginName }">
                        	<img src="resources/img/thumbnail.jpeg" alt="">
                        </c:if>
                    </td>
                </tr>

                <tr>
                    <th>내용</th>
                     <td colspan="2">
                     ${hp.housingPContent}
                  	</td>
                </tr>
            </table>
            <br>
	
			<c:if test="${ loginUser.userId eq hp.housingPWriter }">
	            <div align="center">
	                <button class="btn btn-primary" onclick="postFormSubmit(1);">수정하기</button>
	                <button class="btn btn-danger" onclick="postFormSubmit(2);">삭제하기</button>
	            	    
	            </div>
	           
	            <form id="postForm" action="" method="post">
					<input type="hidden" name="hpno" value="${ hp.housingPNo }">
					<input type="hidden" name="fileName" value="${ hp.housingPChangeName }"> 
				</form>
				<script>
					function postFormSubmit(num){
						var postForm = $("#postForm");
						
						if(num == 1){
							postForm.attr("action", "updateFormP.ho");
						}else{
							postForm.attr("action", "deleteP.ho");
						}
						postForm.submit();
					}
				</script>
            </c:if>

            <br><br>

            <table id="replyArea" class="table" align="center">
                <thead>
                    <tr>
                    	<c:if test="${ !empty loginUser }">
	                        <th colspan="2" style="width:75%">
	                            <textarea class="form-control" id="replyContent" rows="2" style="resize:none; width:100%"></textarea>
	                        </th>
	                        <th style="vertical-align: middle
	                        "><button class="btn btn-secondary" id="addReply">등록하기</button></th>
                        </c:if>
                        <c:if test="${ empty loginUser }">
                        	<th colspan="2" style="width:75%">
	                            <textarea class="form-control" readonly rows="2" style="resize:none; width:100%">로그인한 사용자만 사용가능한 서비스입니다. 로그인 후 이용해주세요.</textarea>
	                        </th>
	                        <th style="vertical-align: middle"><button class="btn btn-secondary" disabled>등록하기</button></th>
                        </c:if>
                    </tr>
                    <tr>
                       <td colspan="3">댓글 (<span id="rcount">0</span>) </td> 
                    </tr>
                </thead>
                <tbody>
                
                </tbody>
            </table>
            
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
	
 <script>
	
	
       $(function(){
          selectReplyList();
          
          $("#addReply").click(function(){
              var hpno = ${hp.housingPNo};

             if($("#replyContent").val().trim().length != 0){
                
                $.ajax({
                   url:"rinsertP.ho",
                   type:"post",
                   data:{replyContent:$("#replyContent").val(),
                        refHousingPNo:hpno,
                        replyWriter:"${loginUser.userId}"},
                   success:function(result){
                      if(result > 0){
                         $("#replyContent").val("");
                         selectReplyList();
                         
                      }else{
                         alert("댓글등록실패");
                      }
                   },error:function(){
                      console.log("댓글 작성 ajax 통신 실패");
                   }
                });
                
             }else{
                alert("댓글등록하셈");
             }
             
          });
       });
       
       function selectReplyList(){
          var hpno = ${hp.housingPNo};
          $.ajax({
             url:"rlistP.ho",
             data:{hpno:hpno},
             type:"get",
             success:function(list){
                $("#rcount").text(list.length);
                
                var value="";
                $.each(list, function(i, obj){
                   
                   if("${loginUser.userId}" == obj.replyWriter){
                      value += "<tr style='background:#EAFAF1'>";
                   }else{
                      value += "<tr>";
                   }
                   
                   value += "<th>" + obj.replyWriter + "</th>" + 
                            "<td>" + obj.replyContent + "</td>" + 
                            "<td>" + obj.createDate + "</td>" +
                       "</tr>";
                });
                $("#replyArea tbody").html(value);
             },error:function(){
                console.log("댓글 리스트조회용 ajax 통신 실패");
             }
          });
       
          
      	}
     
    </script>
	
    

</body>

	  <jsp:include page="../common/footer.jsp"/>
</html>	