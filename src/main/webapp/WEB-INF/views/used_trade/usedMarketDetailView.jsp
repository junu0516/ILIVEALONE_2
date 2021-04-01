<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
img {
  width: 550px;
  height: 550px;
  object-fit: none;
}

#btn_list{
		text-align: center
	
	}
button {
	float: right;
	
}
#chatModal{
	float: center;
}
#btn_delete{
 margin-left:30px;
}

</style>
</head>
<body>
	  <jsp:include page="../common/header.jsp"/>
	

<div class="content">
        <br><br>
        <div class="content">
            <h3><b>${ u.um_Title }</b></h3>
            <p>작성일: ${u.um_Date}</p>
            <br>
            <hr>
            

           <c:if test="${ !empty sessionScope.loginUser and  sessionScope.loginUser.getUserName() == u.um_Writer}">
            
            <button id="btn_delete" class="btn btn-secondary" onclick="actionChange(2)">삭제하기</button>
            <button id="btn_update" class="btn btn-secondary"onclick="actionChange(1)">수정하기 </button>
            
      
            </c:if>
            
            <br><br>
            <table id="contentArea" align="center" class="table">
                <tr>
                    <th width="100">제목</th>
                    <td colspan="3">${ u.um_Title }</td>
                </tr>
                <tr>
                    <th>작성자</th>
                    <td>${ u.um_Writer }</td> 
                    
                </tr>
                <tr>
                	<th>가격</th>
                    <td>${ u.um_Price } <b>원</b></td>
                </tr>
                <tr>
                    <th>첨부파일</th>
                    <td colspan="3">
                    	<c:if test="${ !empty u.originName }">
                        	<a href="${ pageContext.servletContext.contextPath }./resources/upload_files/${u.changeName}" download="${ u.originName }">${ u.originName }</a>
                        </c:if>
                        <c:if test="${ empty u.originName }">
                        	첨부파일이 없습니다.
                        </c:if>
                    </td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td colspan="3"></td>
                </tr>
                <tr>
                <img src="./resources/upload_file/${u.changeName }" class="card-img-top"  >
                </tr>
                <tr>
                    <td colspan="4"><textarea id="texta" class="form-control col-sm-5" style="height:150px " readonly>${ u.um_Content }</textarea></td>
                    
                </tr>
            </table>
            <br>
	
		  <form id="actionChange" action="" method="post">
					<input type="hidden" name="uno" value="${ u.um_No }">
					<input type="hidden" name="fileName" value="${ u.changeName }"> 
				</form>
		
            <br><br>
        

       


		<div id="btn_list">
<c:choose>
	<c:when test="${ !empty sessionScope.loginUser and  sessionScope.loginUser.getUserName() != u.um_Writer}">
		
			<button id="btn_chat"type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">판매자 문의</button>
			<input type="hidden" id="inquiry" value="판매자 문의">
	</c:when>
		<c:otherwise>
			<button id="btn_chat"type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">구매자 문의</button>
			<input type="hidden" id="inquiry" value="구매자 문의">
		
		</c:otherwise>
</c:choose>
		
	     	  <h5>조회수 : <d>${u.um_View_Count }</d></h5>
	     	 <a href="list.um" >목록으로</a>
	     	 
	     	 
	     	 
	     	
	    </div> 	
 </div>
        <br><br>
    </div>
 				<script>
					function actionChange(num){
						var actionChange = $("#actionChange");
						if(num == 1){
							actionChange.attr("action", "updateForm.um");
						}else{
							actionChange.attr("action", "delete.um");
						}
						actionChange.submit();
					};
					
					$(function(){
						var $btn_chat = $("#btn_chat");
						var inquiry =$("#inquiry");

						$btn_chat.click(function(){
							console.log("버튼 클릭이벤트 작동확인!");
							  $("#modal_content").load("chat.ch");
							  $("#myModalLabel").text(inquiry.val());
							  
							
						})
					});
				</script>
				
			
<!-- Modal -->

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
<div class="modal-dialog" role="document">
<div class="modal-content">
<div class="modal-header">
<h4 class="modal-title" id="myModalLabel"></h4>
</div>
<div class="modal-body" id="modal_content">

</div>
<div class="modal-footer">
<button type="button" class="btn btn-warning" data-dismiss="modal">나가기</button>
</div>
</div>
</div>
</div>

	  <jsp:include page="../common/footer.jsp"/>

</body>
</html>