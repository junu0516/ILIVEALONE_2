<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<title>Home</title>
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
    <img class="img-fluid d-block mx-auto" src="./resources/images/logo/logo.png" alt="" width="200px" height="200px">
  </header>
  
  <!-- http://placehold.it/200x200&text=Logo -->
  
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
  <!-- Image element - set the background image for the header in the line below -->
  <div class="py-5 bg-image-full" style="background-image: url('https://unsplash.it/1900/1080?image=1081');">
    <!-- Put anything you want here! There is just a spacer below for demo purposes! -->
    <div style="height: 200px;"></div>
  </div>
  
  
  
  
   <section class="py-5">
    <div class="container">
    	 <div class= "center">
    	 <h2 style="margin-top:10px;" >인기게시물<i class="fas fa-icons"></i></h2>
         </div>
         <ul>
         <button type="button" class="btn btn-primary">패션</button>
         <table id="OneboardList" class="table table-hover" align="center">
			<tbody>
			</tbody>
		 </table>
		 <button type="button" class="btn btn-success">푸드</button>
         <table id="foodPList" class="table table-hover" align="center">
			<tbody>
			</tbody>
		 </table>
         <button type="button" class="btn btn-info">하우징</button>
         <table id="housingPList" class="table table-hover" align="center">
			<tbody>
			</tbody>
		 </table>
         </ul>
         <!-- 
         <p class="lead" style="margin-left:50%;">인기 게시물 <i class="fas fa-icons"></i></p>
    	 
    	 <table id="OneboardList" class="table table-hover" align="center">
			<tbody>
			</tbody>
		</table>
		 <table id="TwotopList" class="table table-hover" align="center">
			<tbody>
			</tbody>
		</table>
		 <table id="ThreetopList" class="table table-hover" align="center">
			<tbody>
			</tbody>
		</table>
		</div>
		 -->
		 </div>
	</section>
   

   
   
  <script>
		
		$(function(){
			OnetopList();
			$("#OneboardList").on("click",".OneboardList",function(){
				var bno = $(this).data("bno");
				location.href="detail.bo?bno=" + $(this).children().eq(0).text();
		    });
			TwotopList();
			$("#foodPList").on("click",".foodPList",function(){
				var fdpno = $(this).data("fdpno");
				location.href="detailP.fo?fdpno=" + $(this).children().eq(0).text();
			});
			ThreetopList;	
			$("#housingPList").on("click",".housingPList",function(){
				var hpno = $(this).data("hpno");
				location.href="detailP.ho?hpno=" + $(this).children().eq(0).text();
		    });
					
		});
		function OnetopList(){
			$.ajax({
				url: 'OtopList.bo',
				success: function(list){
					$tableBody = $('#OneboardList tbody');
					$tableBody.html('');
    				$.each(list, function(i, obj){
						var $tr = $('<tr class = "OneboardList">');
						var $bId = $('<td>').text(obj.boardNo);
						var $bTitle = $('<td>').text(obj.boardTitle);
						var $bWriter = $('<td>').text(obj.boardWriter);
						var $bCreateDate = $('<td>').text(obj.createDate);
						var $bCount = $('<td>').text(obj.count);
						if(obj.originName != null){
							$bFile = $('<td>').text("O");
						}
						$tr.append($bId);
						$tr.append($bTitle);
						$tr.append($bCreateDate);
						$tr.append($bWriter);
						$tableBody.append($tr);
					});
				}
			});
		}
		function TwotopList(){
			$.ajax({
				url: 'topListP.fo',
				success: function(list){
					$tableBody = $('#foodPList tbody');
					$tableBody.html('');
    				$.each(list, function(i, obj){
						var $tr = $('<tr class = "foodPList">');
						var $fId = $('<td>').text(obj.foodPNo);
						var $fTitle = $('<td>').text(obj.foodPTitle);
						var $fWriter = $('<td>').text(obj.foodPWriter);
						var $fCreateDate = $('<td>').text(obj.foodPCreateDate);
						var $fCount = $('<td>').text(obj.foodPCount);
						if(obj.foodPOriginName != null){
							$fFile = $('<td>').text("O");
						}
						$tr.append($fId);
						$tr.append($fTitle);
						$tr.append($fCreateDate);
						$tr.append($fWriter);
					
						$tableBody.append($tr);
					});
				}
			});
		}
		function ThreetopList(){
			$.ajax({
				url: 'topListP.ho',
				success: function(list){
					$tableBody = $('#housingPList tbody');
					$tableBody.html('');
    				$.each(list, function(i, obj){
						var $tr = $('<tr class = "housingPList">');
						var $hId = $('<td>').text(obj.housingPNo);
						var $hTitle = $('<td>').text(obj.housingPTitle);
						var $hWriter = $('<td>').text(obj.housingPWriter);
						var $hCreateDate = $('<td>').text(obj.housingPCreateDate);
						var $hCount = $('<td>').text(obj.housingPCount);
						if(obj.housingPOriginName != null){
							$hFile = $('<td>').text("O");
						}
						$tr.append($hId);
						$tr.append($hTitle);
						$tr.append($hCreateDate);
						$tr.append($hWriter);
					
						$tableBody.append($tr);
					});
				}
			});
		}
		$(function(){

			OnetopList();
			TwotopList();
			ThreetopList();
			setInterval(function(){ //일시적으로 주기적으로 돌려주는것 
				OnetopList();
				TwotopList();
				ThreetopList();
			}, 5000);

		})
	</script>

	<jsp:include page="common/footer.jsp"/>
	
</body>
</html>