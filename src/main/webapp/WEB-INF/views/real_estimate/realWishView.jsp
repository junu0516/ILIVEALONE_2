<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<style>
li {
	list-style: none;
}
       #page-top{
padding-top:13px;
}

</style>
</head>

	<jsp:include page="../common/header.jsp" />
	
	
<body id="page-top">

<c:if test="${ !empty message }">
		<script>
			alert("${message}");
		</script>
	</c:if>

	<br>
	<br>


	<!-- 바디 부분 -->
	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<ul
			class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
			id="accordionSidebar">

			<!-- Sidebar - Brand -->
			<a
				class="sidebar-brand d-flex align-items-center justify-content-center"
				href="list.re">
				<div class="sidebar-brand-icon rotate-n-15">
					<i class="fas fa-laugh-wink"></i>
				</div>
				<div class="sidebar-brand-text mx-3">부동산</div>
			</a>

			<!-- Divider -->
			<hr class="sidebar-divider my-0">
			
<c:if test="${ !empty loginUser }">
			<!-- Nav Item - Dashboard -->
			<li class="nav-item"><a class="nav-link" onclick="postFormSubmit()" style="cursor: pointer">
					<i class="fas fa-fw fa-tachometer-alt"></i> <span>찜한 목록</span>
			</a></li>
			
			<!-- Divider -->
			<hr class="sidebar-divider">

			<li class="nav-item"><a class="nav-link" href='enrollform.re'>
					<i class="fas fa-fw fa-tachometer-alt"></i> <span>매물 등록</span>
			</a></li>
			
			</li>
			
			
</c:if>
		</ul>
		<!-- End of Sidebar -->
		
		
		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">



				<!-- Begin Page Content -->
				<div class="container-fluid">
				
				
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
									src="${ pageContext.servletContext.contextPath }/resources/images/real_estate/${r.changeName}"
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
						<strong>${ r.location }</strong><br><br>
						<button onclick="postFormSubmit();" class="form-control bg-light border" style="width:270px">찜하기 취소</button>
						</li>
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

  </div>
				<!-- /.container-fluid -->

			</div>
			<!-- End of Main Content -->

		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

		<form id="postForm" action="wishform.re" method="post"> <!-- 삭제, 수정 시 필요한 매물 번호와 이미지 제목을 위한 form -->
				<input type="hidden" name="userId" value="${loginUser.getUserId() }">
			</form>
				
			<script>
				function postFormSubmit(){
					var postForm = $("#postForm");
				
					postForm.submit();
				}
			</script>
	
<jsp:include page="../common/footer.jsp"/>

</body>
</html>