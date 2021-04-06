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
 		<h2 class = "text-center">게시글 상세보기</h2>
            <br>
            <div align = "right">
            	 <button class="btn btn-light"><a href="list.fo" >홈으로</a></button>
            </div>
            <br><br>
         <table id="contentArea" align="center" class="table">
                <tr>
                    <th width="100">제목</th>
                    <td colspan="3">${ fd.foodTitle }</td>
                </tr>
                <tr>
                    <th>작성자</th>
                    <td>${ fd.foodWriter }</td>
                    <th>작성일</th>
                    <td>${ fd.createDate }</td>
                </tr>
                <tr>
                    <th>첨부파일</th>
                    <td colspan="3">
                    	<c:if test="${ !empty fd.originName }">
                        	<a href="${ pageContext.servletContext.contextPath }/resources/images/commuity_food/${fd.changeName}" download="${ fd.originName }">${ fd.originName }</a>
                        </c:if>
                        <c:if test="${ empty fd.originName }">
                        	첨부파일이 없습니다.
                        </c:if>
                    </td>
                </tr>
                <tr>
                	<th>조회</th>
                	<td colspan="3">
                	${fd.count}
                	</td>
                </tr>
                <tr>
                    <th>내용</th>
                     <td colspan="2">
                     ${fd.foodContent}
                  	</td>
                </tr>
                
            </table>

            <br>

			<c:if test="${ loginUser.userId eq fd.foodWriter }">
	            <div align="center">
	                <button class="btn btn-primary" onclick="postFormSubmit(1);">수정하기</button>
	                <button class="btn btn-danger" onclick="postFormSubmit(2);">삭제하기</button>
	            	    
	            </div>
	           
	            <form id="postForm" action="" method="post">
					<input type="hidden" name="fdno" value="${ fd.foodNo }">
					<input type="hidden" name="fileName" value="${ fd.changeName }"> 
				</form>
				<script>
					function postFormSubmit(num){
						var postForm = $("#postForm");
						
						if(num == 1){
							postForm.attr("action", "updateFormf.fo");
						}else{
							postForm.attr("action", "deletef.fo");
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
	                        <th style="vertical-align: middle"><button class="btn btn-secondary" id="addReply">등록하기</button></th>
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
	<jsp:include page="foodSideBar2.jsp"/>
		
  
</div>
	
  <script>
       $(function(){
          selectReplyList();
          
          $("#addReply").click(function(){
              var fdno = ${fd.foodNo};

             if($("#replyContent").val().trim().length != 0){
                
                $.ajax({
                   url:"rfinsert.fo",
                   type:"post",
                   data:{replyContent:$("#replyContent").val(),
                        refFoodNo:fdno,
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
          var fdno = ${fd.foodNo};
          $.ajax({
             url:"rflist.fo",
             data:{fdno:fdno},
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