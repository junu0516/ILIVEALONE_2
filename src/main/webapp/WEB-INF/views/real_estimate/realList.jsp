<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Insert title here</title>

<!-- Custom fonts for this template -->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

</head>
<body id="page-top">



<div id="list" style="width: 40%; height: 800px; float:right;" class="b">
		<h2 style="left:50%;">매물 목록</h2>
		<div id="realList" style="width: 100%; height: 800px; left:50%;" class="b">
			<ul>
			<c:forEach items="${ list }" var="r"> <!-- controller에서 걸러진 최종 list들이 넘어와 출력 -->
				<li style="cursor: pointer">
					<span class="thumb">
						<c:if test="${ !empty r.originName }"> <!-- 저장된 changeName을 통해 이미지 사진 로드 -->
				<img src="${ pageContext.servletContext.contextPath }/resources/images/real_estate/${r.changeName}" alt="">
						</c:if>
						<c:if test="${ empty r.originName }"> <!-- 매물 사진이 등록되지 않았을 경우 디폴트 사진 출력 -->
							<img src="resources/img/thumbnail.jpeg" alt="">
						</c:if>
					</span><br>
					<strong>매물번호 : </strong>
					<strong>${ r.stuffNo }</strong><br>
					<strong>${ r.structure }</strong><br>
					<strong>${ r.money_kind } </strong>
					<strong>${ r.money1 }</strong><br>
					<strong>관리비 ${ r.admin_money }만원</strong><br>
					<strong>${ r.location }</strong><br>
				</li>
				<br>
			</c:forEach>
			</ul>
		
		</div>
	</div>
	
	<script>
    	$(function(){ //매물 목록에서 매물 클릭 시 해당 매물의 rno에 해당하는 detail페이지로 이동
    		$("#list div ul li").click(function(){ 
    			location.href="detail.re?rno=" + $(this).children().eq(3).text();
    			
    		});
    	});
    </script>
    
</body>
</html>