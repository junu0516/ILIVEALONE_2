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
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

<!-- Custom fonts for this template -->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
    
</head>
<body>

<div id="map" style="width: 55%; height: 800px; float:left;" class="b"></div>

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

	<c:forEach var="itemList" items="${list}"> //리스트에 담겨 있는 각 매물들의 주소를 지도에 마커 표시해주는 함수
	geocoder.addressSearch( "${itemList.location}", function(result, status) {
	    // 정상적으로 검색이 완료됐으면
	     if (status === kakao.maps.services.Status.OK) {
	        // 마커를 생성합니다
	      
	        var marker = new kakao.maps.Marker({ //각 위치에 마커 등록
	            map: map, // 마커를 표시할 지도
	            position: new kakao.maps.LatLng(result[0].y, result[0].x), // 마커를 표시할 위치
	            title : "${itemList.stuffNo}", // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
	            image : markerImage // 마커 이미지 
	        });
	        
	        var customOverlay = new kakao.maps.CustomOverlay({ //각 마커에 매물 번호 새기기
	            position: new kakao.maps.LatLng(result[0].y, result[0].x),
	            content: '<div class ="label"><span class="left"></span><span class="center">'+
	            "${itemList.stuffNo}"+'</span><span class="right"></span></div>'
	        });
	        
	        customOverlay.setMap(map);
	        
	    }
	});
	</c:forEach>

});
	
var search = '<c:out value="${search}"/>';

var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
if(search==""){ //검색된 위치가 없을 시 default 주소로 이동
	geocoder.addressSearch('서울시 강남구 역삼동', function(result, status) {

	    // 정상적으로 검색이 완료됐으면 
	     if (status === kakao.maps.services.Status.OK) {

	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

	        
	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	     
	    } 
	});    
}else{ //검색된 위치가 있을 시 검색된 위치로 이동
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

</body>
</html>