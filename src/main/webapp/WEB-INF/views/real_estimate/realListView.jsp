<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"/>
<title>부동산</title>
<style>
html,body{width:100%;height:100%}
body,p,h1,h2h3,h4,h5,h6,ul,ol,li,dl,dt,dd,table,th,td,form,fieldset,legend,input,textarea,button,select{margin:0;padding:0}
img,filedset{border:0;}
ul,ol{list-style:none;}
em,address{font-style:normal;}
a{text-decoration:none;}
a:hover, a:active,a:focus{text-decoration;underline;}
.b{
padding:10px;
}
#list{
overflow-y:auto; 
}
strong{
word-break : nowrap;
}
</style>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
</head>
<body>

		<jsp:include page="../common/header.jsp"/>
		
		<br><br>
	
	<div class="container" style="height:1000px">
	
	<jsp:include page="search.jsp" />
	<br><br><br>

	<div id="map" style="width: 55%; height: 800px; float:left;" class="b"></div>
	<div id="list" style="width: 40%; height: 800px; float:right;" class="b">
		<h2 style="left:50%;">매물 목록</h2>
		<div id="realList" style="width: 100%; height: 800px; left:50%;" class="b">
			<ul>
			<c:forEach items="${ list }" var="r">
				<li>
					<span class="thumb">
						<c:if test="${ !empty r.originName }">
							<img src="${ pageContext.servletContext.contextPath }/resources/upload_file_real/${r.changeName}" alt="">
						</c:if>
						<c:if test="${ empty r.originName }">
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
	</div>
	
	<script>
    	$(function(){
    		$("#list div ul li").click(function(){
    			location.href="detail.re?rno=" + $(this).children().eq(3).text();
    		});
    	});
    </script>
    
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6b6932ae5af17d112f64fe859d1e13a1&libraries=services"></script>


<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
		center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

$(function(){
	//마커 리스트에 매물 목록 담기
	var geocoder = new kakao.maps.services.Geocoder();

	var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
	// 마커 이미지의 이미지 크기 입니다
	var imageSize = new kakao.maps.Size(24, 35); 
	// 마커 이미지를 생성합니다    
	var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 

	<c:forEach var="itemList" items="${list}">
	geocoder.addressSearch( "${itemList.location}", function(result, status) {
	    // 정상적으로 검색이 완료됐으면
	     if (status === kakao.maps.services.Status.OK) {
	        // 마커를 생성합니다
	        console.log("${itemList.stuffNo}");
	        console.log(new kakao.maps.LatLng(result[0].y, result[0].x));
	        
	        var marker = new kakao.maps.Marker({
	            map: map, // 마커를 표시할 지도
	            position: new kakao.maps.LatLng(result[0].y, result[0].x), // 마커를 표시할 위치
	            title : "${itemList.stuffNo}", // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
	            image : markerImage // 마커 이미지 
	        });
	        
	        var customOverlay = new kakao.maps.CustomOverlay({
	            position: new kakao.maps.LatLng(result[0].y, result[0].x),
	            content: '<div class ="label"><span class="left"></span><span class="center">'+"${itemList.stuffNo}"+'</span><span class="right"></span></div>'
	        });
	        
	        customOverlay.setMap(map);
	        
	    }
	});
	</c:forEach>

	console.log('<c:out value="${size}"/>');
});
	
var search = '<c:out value="${search}"/>';

var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
if(search==""){
	geocoder.addressSearch('서울시 강남구 역삼동', function(result, status) {

	    // 정상적으로 검색이 완료됐으면 
	     if (status === kakao.maps.services.Status.OK) {

	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

	        
	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	     
	    } 
	});    
}else{
	geocoder.addressSearch(search, function(result, status) {

	    // 정상적으로 검색이 완료됐으면 
	     if (status === kakao.maps.services.Status.OK) {

	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	        
	       
	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        
	        map.setCenter(coords);
	        
	    } 
	    
	    
	});    
}



</script>


	  <jsp:include page="../common/footer.jsp"/>

</body>
</html>