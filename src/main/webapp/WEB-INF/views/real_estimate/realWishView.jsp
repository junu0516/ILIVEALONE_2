<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<style>
li {
	list-style: none;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<c:if test="${ !empty message }">
		<script>
			alert("${message}");
		</script>
	</c:if>

	<jsp:include page="../common/header.jsp" />

	<br>
	<br>

	<div class="container" style="height: 1200px">

		<br>
		<br>
		<div class="innerOuter">
			<h2 style="align: center">찜한 목록</h2>

			<br>
			<br>
			<c:if test="${ !empty list }">
				<c:forEach items="${ list }" var="r">
					<li><span class="thumb"> <c:if
								test="${ !empty r.originName }">
								<!-- 저장된 changeName을 통해 이미지 사진 로드 -->
								<img
									src="${ pageContext.servletContext.contextPath }/resources/upload_file_real/${r.changeName}"
									alt="">
							</c:if> <c:if test="${ empty r.originName }">
								<!-- 매물 사진이 등록되지 않았을 경우 디폴트 사진 출력 -->
								<img src="resources/img/thumbnail.jpeg" alt="">
							</c:if>
					</span><br> <strong>매물번호 : </strong> <strong>${ r.stuffNo }</strong><br>
						<input type="hidden" name="userId" value="${loginUser.userId}">
						<strong>${ r.structure }</strong><br> <strong>${ r.money_kind }
					</strong> <strong>${ r.money1 }</strong><br> <strong>관리비 ${ r.admin_money }만원</strong><br>
						<strong>${ r.location }</strong><br>
						<button onclick="postFormSubmit();">찜하기 취소</button></li>
					<br>
				</c:forEach>
			</c:if>

		</div>
	</div>

	<script>
    	
    	$(function(){ //매물 목록에서 매물 클릭 시 해당 매물의 rno에 해당하는 detail페이지로 이동
    		$("button").click(function(){
    			
    			location.href="wishCancle.re?rno=" + $(this).parent().children().eq(3).text() + "&userId="+$(this).parent().children().eq(5).val();
    			
    		});
    	});
    </script>



	<jsp:include page="../common/footer.jsp" />

</body>
</html>