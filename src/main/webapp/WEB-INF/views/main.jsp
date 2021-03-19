<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>

	<title>Home</title>
	
	<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> 
</head>

<body>
  <!-- 헤더 영역 -->
  <!-- 좌측 로고 & 네비게이터 -->
  <jsp:include page="common/header.jsp"/>
  <!-- 메인 로고 -->
  <header class="py-5 bg-image-full" style="background-image: url('https://unsplash.it/1900/1080?image=1076');">
    <img class="img-fluid d-block mx-auto" src="http://placehold.it/200x200&text=Logo" alt="">
  </header>
  
  <!-- 콘텐츠 영역 -->
  <section class="py-5">
    <div class="container">
     
     <h1 class="display-4">Coronavirus Tracker Application(Korea)</h1>
    <p class="lead">한국의 코로나19 현황테이블</p>

    <div class="jumbotron">
        <h1 class="display-4">"${koreaStats[0].total}"</h1>
        <p class="lead">Total cases reported</p>
        <hr class="my-4">
        <p>
            <span>New cases reported since previous day</span>
            <span>"${koreaStats[0].diffFromPrevDay}"</span>
        </p>
    </div>

		<table class="table">
			<tr>
				<th>확진환자수(전일 대비 증감량)</th>
				<th>사망자</th>
				<th>일일 검사건수</th>
				<th title="인구 10만 명당">발생률(*)</th>
			</tr>


			<tr>
				<td>"${koreaStats[0].total}"</td>
				<td>"${koreaStats[0].death}"</td>
				<td>"${koreaStats[0].inspection}"</td>
				<td>"${koreaStats[0].incidence}"</td>
			</tr>

		</table>
     
     
    </div>
  </section>

  <!-- Image element - set the background image for the header in the line below -->
  <div class="py-5 bg-image-full" style="background-image: url('https://unsplash.it/1900/1080?image=1081');">
    <!-- Put anything you want here! There is just a spacer below for demo purposes! -->
    <div style="height: 200px;"></div>
  </div>

  <!-- Content section -->
  <section class="py-5">
    <div class="container">
      <h1>Section Heading</h1>
      <p class="lead">Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
      <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aliquid, suscipit, rerum quos facilis repellat architecto commodi officia atque nemo facere eum non illo voluptatem quae delectus odit vel itaque amet.</p>
    </div>
  </section>

	<jsp:include page="common/footer.jsp"/>
	
</body>
</html>