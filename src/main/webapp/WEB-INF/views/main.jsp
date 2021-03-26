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

<style>
	.info_data {
    float: left;
    width: 213px;
}
.info_temperature {
    color: #242424;
    letter-spacing: -0.5px;
}
.todaytemp {
    font-size: 6rem;
    font-weight: 600;
}
ul {
    list-style-type: none;
}
.tempmark {
    font-size: 2.4rem;
    font-weight: 500;
    letter-spacing: -0.5px;
    vertical-align: 2.6rem;
}
.blind {
    overflow: hidden!important;
    position: absolute!important;
    clip: rect(0 0 0 0)!important;
    width: 1px!important;
    height: 1px!important;
    margin: -1px!important;
}

.info_list {
    position: relative;
    overflow: hidden;
    margin-top: 10px;
}
.info_list li {
    clear: both;
    padding: 0;
    border: none;
    clear: both;
    margin: 0 5px 7px;
    font-size: 1.3rem;
    color: #242424;
}
p {
    display: block;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
}
.merge {
    font-weight: bold;
}
.lv2 {
    color: #03c75a;
}
.num {
    margin-right: 4px;
}
.ico_state {
    background-image: url(../img/weather_svg/icon_wt_01.svg);
}

.main_info {
    float: left;
    width: 339px;
}
.sub_info {
	float: left;
    width: 339px;
}
.detail_box {
    float: left;
    width: 231px;
    height: 95px;
    padding: 5px 20px;
    border-left: 1px solid #f2f4f6;
    font-size: 1.3rem;
}
dt {
    float: left;
    margin-bottom: 7px;
    margin-right: 7px;
    color: #8f8f8f;
}
dd {
    margin-left: 70px;
    margin-bottom: 7px;
    font-size: 1.3rem;
    white-space: nowrap;
}

</style>

</head>

<body>
  <!-- 헤더 영역 -->
  <!-- 좌측 로고 & 네비게이터 -->
  <jsp:include page="common/header.jsp"/>
  <!-- 메인 로고 -->
  <header class="py-5 bg-image-full" style="background-image: url('https://unsplash.it/1900/1080?image=1076');">
    <img class="img-fluid d-block mx-auto" src="http://placehold.it/200x200&text=Logo" alt="">
  </header>
  
  
  <!-- Content section -->
  <section class="py-5">
		<div class="container" style="height:300px">
			<div class="main_info">
				<p class="info_temperature">
					<span class="ico_state ws1"></span> <span class="todaytemp">${weather.todaytemp}</span>
					<span class="tempmark"> <span class="blind"></span> ℃
					</span>
				</p>
				<ul class="info_list">
					<li>
						<p class="cast_txt">${weather.cast_txt}</p>
					</li>
					<li><span class="merge"> <span class="min"> <span
								class="num">${weather.min}</span> ˚
						</span> <span class="slash">/</span> <span class="min"> <span
								class="num">${weather.max}</span> ˚
						</span>
					</span> <span class="bar"></span> <span class="sensible"> 체감온도 <em>
								<span class="num">${weather.bodytemp}</span> ˚
						</em>
					</span></li>
				</ul>
			</div>
			<div class="sub_info">
				<div class="detail_box">
				<br><br><br>
					<dl class="indicator">
						<dt>자외선 </dt>
						<dd class="lv2">
							<span class="num"> ${weather.uv} </span> ${weather.uv_txt}
						</dd>
						<dt>미세먼지 </dt>
						<dd class="lv2">
							<span class="num"> ${weather.finedust} </span> ${weather.finedust_txt}
						</dd>
						<dt>초미세먼지 </dt>
						<dd class="lv2">
							<span class="num"> ${weather.ultrafinedust} </span> ${weather.ultrafinedust_txt}
						</dd>
						<dt>오존 </dt>
						<dd class="lv2">
							<span class="num"> ${weather.ozone} </span> ${weather.ozone_txt}
						</dd>
					</dl>
				</div>
			</div>
		</div>
	</section>

  <!-- Image element - set the background image for the header in the line below -->
  <div class="py-5 bg-image-full" style="background-image: url('https://unsplash.it/1900/1080?image=1081');">
    <!-- Put anything you want here! There is just a spacer below for demo purposes! -->
    <div style="height: 200px;"></div>
  </div>


<!-- 콘텐츠 영역 -->
  <section class="py-5">
    <div class="container">
     
     <h1 class="display-4">Coronavirus Tracker Application(Korea)</h1>
    <p class="lead">한국의 코로나19 현황테이블</p>

    <div class="jumbotron">
        <h1 class="display-4">"${koreaStats[0].diffFromPrevDay}"</h1>
        <p class="lead">Total cases reported</p>
        <hr class="my-4">
        <p>
            <span>New domestic cases reported since previous day</span>
            <span>"${koreaStats[0].total}"</span>
        </p>
    </div>

		<table class="table">
			<tr>
				<th>확진환자수(전일 대비 증감량)</th>
				<th>해외유입</th>
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
  
  
	<jsp:include page="common/footer.jsp"/>
	
</body>
</html>