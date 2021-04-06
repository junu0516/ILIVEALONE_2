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
	<title>게시판 사이드바 </title>
	<style>
	.well{
      text-align: center; 
    }
	</style>
</head>
<body>
<div class="col-sm-2 sidenav">
      	<body onload = "showImage()">
    
      	<div class = "well" >
      	<br>
      		<p class = "text-center">오늘의 푸드</p>
			<img class = "introImg" id = "introImg" border="0" width=200px; height=200px; >
       	<br><br>
        <hr>
        <br><br>
        	<p class = "text-center">오늘의 디저트</p>
			<img class = "introImg1" id = "introImg1" border="0" width=200px; height=200px;>
      	</div>
      	</body>
    <script>
			var imgArray = new Array();
			imgArray[0] = "resources/img/오사카.jfif";
			imgArray[1] = "resources/img/토스트.jfif";
			imgArray[2] = "resources/img/프랑스.jfif";
			imgArray[3] = "resources/img/국수.jfif";
			
			var imgArray1 = new Array();
			imgArray1[0] = "resources/img/딸기 케이크.jfif";
			imgArray1[1] = "resources/img/마카로.jfif";
			imgArray1[2] = "resources/img/마카롱.jfif";
			imgArray1[3] = "resources/img/케이크.jfif";


			
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
</body>
</html>