<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <title>패션 게시판 상세보기</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script src="https://cdn.ckeditor.com/ckeditor5/25.0.0/classic/ckeditor.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css"></script>
  <style>
    /* Remove the navbar's default margin-bottom and rounded borders */ 
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
    }
    
    /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
    .row.content {height: 450px}
    
    /* Set gray background color and 100% height */
    .sidenav {
      padding-top: 20px;
      background-color: #f1f1f1;
      height: 100%;
    }
    
    /* Set black background color, white text and some padding */
    footer {
      background-color: #555;
      color: white;
      padding: 15px;
    }
    
    /* On small screens, set height to 'auto' for sidenav and grid */
    @media screen and (max-width: 767px) {
      .sidenav {
        height: auto;
        padding: 5px;
      }
      .row.content {height:auto;} 
    }

  </style>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
   <div class="container-fluid text-center">  
	  <div class="col-sm-2 sidenav">
      	<p><a href="list.bo">패션 게시물</a></p>
      	<p><a href="blist.bo">패션 최신뉴스</a></p>
      	<p><a href="#">공지사항</a></p>
	  </div>
	  
	<div class="col-sm-8 text-left" style="padding:5% 10%;"> 
            <h2>게시글 상세보기</h2>
            <br>
            
            <br><br>
            <table id="contentArea" align="center" class="table">
                <tr>
                    <th width="100">제목</th>
                    <td colspan="3">${ f.fashionTitle }</td>
                </tr>
                <tr>
                    <th>작성자</th>
                    <td>${ f.fashionWriter }</td>
                    <th>작성일</th>
                    <td>${ f.fashionCreateDate }</td>
                </tr>
                <tr>
                    <th>첨부파일</th>
                    <td colspan="3">
                    	<c:if test="${ !empty f.fashionOriginName }">
                        	<a href="${ pageContext.servletContext.contextPath }/resources/upload_files/${f.fashionChangeName}" download="${ f.fashionOriginName }">${ f.fashionOriginName }</a>
                        </c:if>
                        <c:if test="${ empty f.fashionOriginName }">
                        	첨부파일이 없습니다!.
                        </c:if>
                    </td>
                </tr>
                <tr>
                	<th>조회</th>
                	<td colspan="3">
                	${f.fashionCount}
                	</td>
                </tr>
                <tr>
                    <th>내용</th>
                     <td colspan="2">
                     ${f.fashionContent}
                  	</td>
                </tr>
            </table>
            <br>
	
			<c:if test="${ loginUser.userId eq f.fashionWriter }">
	            <div align="center">
	                <button class="btn btn-primary" onclick="postFormSubmit(1);">수정하기</button>
	                <button class="btn btn-danger" onclick="postFormSubmit(2);">삭제하기</button>
	            	    
	            </div>
	           
	            <form id="postForm" action="" method="post">
					<input type="hidden" name="fno" value="${ f.fashionNo }">
					<input type="hidden" name="fileName" value="${ f.fashionChangeName }"> 
				</form>
				<script>
					function postFormSubmit(num){
						var postForm = $("#postForm");
						
						if(num == 1){
							postForm.attr("action", "updateForm.bo");
						}else{
							postForm.attr("action", "delete.bo");
						}
						postForm.submit();
					}
				</script>
            </c:if>
            	<div align = "center">
            	 <button class="btn btn-primary"><a href="blist.bo" >홈으로</a></button>
            	</div>
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
        </div>
            <div class="col-sm-2 sidenav">
      			<div class="well">
        		<p>ADS</p>
      			</div>
      			<div class="well">
       			<p>ADS</p>
      			</div>
    		</div>
	
</div>
<script>
	/*
	
       $(function(){
          selectReplyList();
          
          $("#addReply").click(function(){
              var bno = ${b.boardNo};

             if($("#replyContent").val().trim().length != 0){
                
                $.ajax({
                   url:"rinsert.bo",
                   type:"post",
                   data:{replyContent:$("#replyContent").val(),
                        refBoardNo:bno,
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
          var bno = ${b.boardNo};
          $.ajax({
             url:"rlist.bo",
             data:{bno:bno},
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
       */
    </script>
	<jsp:include page="../common/footer.jsp"/>

</body>
</html>
