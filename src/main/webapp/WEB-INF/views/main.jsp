<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<title>ILIVEALONE(나혼자산다)</title>
	 <link href="css/animation.css" rel="stylesheet">
	
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

.footer_emoticon{
	margin-top : -50px;
	display : flex;
	justify-content : center;
}

.footer_emoticon img{
	width : 180px;
	height : 180px;
}
.img{
	width : 40px;
	height : 40px;
}
#s_logo{
	float:left;
	 margin-top: 300px; 
}






</style>

</head>

<body>
  <!-- 헤더 영역 -->
  <!-- 좌측 로고 & 네비게이터 -->
  <jsp:include page="common/header.jsp"/>
  <!-- 메인 로고 -->

  <div class="py-5 bg-image-full" style="background-image: url('./resources/img/배경.webp'); background-size : cover; background-repeat: no-repeat; " >
  <br><br>
   <img id="s_logo" class="img-fluid d-block mx-auto" src="./resources/images/logo/logo.png" alt="Logo" width="300px" height="300px">
  </div>
 

  <!-- http://placehold.it/200x200&text=Logo -->
  
  <!-- Content section --><!--  -->
  <section class="py-5 jumbotron">
		<div class="container jumbotron" style="height:700px">
		<br><br>
		
		
			<div class="col-sm-4 mb-0" style="float:left">
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
		<div class="col-sm-8" style="float:left">
		
		    <div class="jumbotron" style="background-color:#474747; border-radius: 40px 80px / 80px 40px;">
		    	 <h2 style="color:#C5C5C5">COVID 19</h2>
		    	 <br><br>
		    	 
		        <h1 class="display-4" style="color:#C5C5C5">"${koreaStats[0].diffFromPrevDay}"</h1>
		        <p class="lead" style="color:#C5C5C5">Total cases reported</p>
		        <hr style="color:#C5C5C5" class="my-4">
		        <table class="table">
					<tr>
						<th style="color:#C5C5C5">확진환자수(전일 대비 증감량)</th>
						<th style="color:#C5C5C5">해외유입</th>
						<th style="color:#C5C5C5">일일 검사건수</th>
						<th title="인구 10만 명당" style="color:#C5C5C5">발생률(*)</th>
					</tr>
		
		
					<tr>
						<td style="color:#C5C5C5">"${koreaStats[0].total}"</td>
						<td style="color:#C5C5C5">"${koreaStats[0].death}"</td>
						<td style="color:#C5C5C5">"${koreaStats[0].inspection}"</td>
						<td style="color:#C5C5C5">"${koreaStats[0].incidence}"</td>
					</tr>
		
				</table>
				<br><br>
		    </div>
	     
     
    </div>
		</div>
		
	</section>



   <section class="py-5">
    <div class="container">
    	 <div class= "center">
    	 <h2 style="margin-top:10px;" class ="text-center">인기게시물<i class="fas fa-icons"></i></h2>

         </div>
         <ul class = "farBody">
         <button type="button" class="r-button ui-button text-outlined text-outlined_v5" onclick="location.href='Toplist.bo'">
         	<span class="text-outlined__label"><b>패션</b><img src="resources/img/coat.png" class = img></img></span></button>     
         <table id="OneboardList" class="table table-hover" align="center">
			<tbody>
			</tbody>
		 </table>
		 <button type="button" class="r-button ui-button text-outlined text-outlined_v5" onclick="location.href='Toplistf.fo'">
		 <span class="text-outlined__label"><b>푸드</b><img src="resources/img/fruit.png" class = img></img></span></button>
         <table id="foodPList" class="table table-hover" align="center">
			<tbody>
			</tbody>
		 </table>
         <button type="button" class="r-button ui-button text-outlined text-outlined_v5" onclick="location.href='Toplistf.ho'">
         <span class="text-outlined__label"><b>하우징</b><img src="resources/img/house.png" class = img></img></span></button>
         <table id="housingPList" class="table table-hover" align="center">
			<tbody>
			</tbody>
		 </table>
         </ul>
    	</div>
		</div>
  </div>
  
	</section>

	<div class = "footer_emoticon">
	         <img src = "https://tistory2.daumcdn.net/tistory/2916313/skin/images/kakao_image_1.gif">
    </div>     
   

   
   
  <script>
		
  
		$(function(){
			console.log("${message}");
			if(${not empty message}){
				alert("${message}");
			}
			
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