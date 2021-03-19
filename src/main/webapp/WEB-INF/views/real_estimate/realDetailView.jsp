<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html5>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#contentArea{width:100%}
	#contentArea *{margin:5px}
	.content{
        background-color:rgb(247, 245, 245);
        width:80%;
        margin:auto;
    }
    .innerOuter{
        border:1px solid lightgray;
        width:80%;
        margin:auto;
        padding:5% 10%;
        background:white;

    }
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>

	
		<jsp:include page="../common/header.jsp"/>
		
		<br><br>
	
	<div class="container" style="height:1200px">
	
        <br><br>
        <div class="innerOuter">
            <h2 style="align:center">매물 상세보기</h2>
            
            <br><br>
            
            <c:if test="${ !empty r.originName }">
				<img src="${ pageContext.servletContext.contextPath }/resources/upload_file_real/${r.changeName}" alt="">
			</c:if>
			<c:if test="${ empty r.originName }">
				<img src="resources/img/thumbnail.jpeg" alt="">
			</c:if>
			
			<br><br>
			
            <table id="contentArea" align="center" class="table">
                <tr>
                    <th width="100">세 종류</th>
                    <td colspan="3">${ r.money_kind }</td>
                </tr>
           
                <tr>
                    <th width="100">면적</th>
                    <td colspan="3">${ r.area }m²</td>
                </tr>
                <tr>
                    <th width="100">층</th>
                    <td colspan="3">${ r.floors }</td>
                </tr>
                <tr>
                    <th width="100">위치</th>
                    <td colspan="3">${ r.location }</td>
                </tr>
                <tr>
                    <th width="100">엘리베이터 여부</th>
                    <td colspan="3">${ r.elevator }</td>
                </tr>
                <tr>
                    <th width="100">관리비</th>
                    <td colspan="3">${ r.admin_money }</td>
                </tr>
                <tr>
                    <th width="100">구조</th>
                    <td colspan="3">${ r.structure }</td>
                </tr>
                <tr>
                    <th width="100">전체 층 수</th>
                    <td colspan="3">${ r.entire_floors }</td>
                </tr>
                <tr>
                    <th width="100">가격</th>
                    <td colspan="3">${ r.money1 }</td>
                </tr>
             
            </table>
            
            <br>

            <c:if test="${ r.stuffNo eq r.stuffNo }">
             <div align="center">
	                <button onclick="postFormSubmit(1);">수정하기</button>
	                <button onclick="postFormSubmit(2);">삭제하기</button>
	         </div>
	         
			 <form id="postForm" action="" method="post"> <!-- 삭제, 수정 시 필요한 매물 번호와 이미지 제목을 위한 form -->
				<input type="hidden" name="rno" value="${ r.stuffNo }">
				<input type="hidden" name="fileName" value="${ r.changeName }">
			</form>
				
			<script>
				function postFormSubmit(num){
					var postForm = $("#postForm");
					
					console.log(1);
						
					if(num == 1){
						postForm.attr("action", "updateForm.re"); //수정 form으로 이동
					}else{
						postForm.attr("action", "delete.re"); //삭제 form으로 이동
					}
					
					postForm.submit();
				}
			</script>
			</c:if>
         
        </div>
    </div>

    	

	  <jsp:include page="../common/footer.jsp"/>


</body>
</html>