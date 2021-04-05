<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.search {
	float: left;
	padding: 10px;
}

.menu {
	float: left;
	padding: 10px;
}
</style>

<script>
	function formChange(obj) {
		obj.submit();
	}
</script>
</head>
<body id="page-top">


	<form action="houselist" method="get">
		<div class="search">
			<input type="text" name="search" placeholder="지역명 ">
			<button>검색</button>
		</div>

		<div class="search">
			<select name="type" onchange="formChange(this.form)">
				<option value="none" <c:if test="${type eq 'none'}">selected</c:if>>방
					타입</option>
				<option value="원룸" <c:if test="${type eq '원룸'}">selected</c:if>>원룸</option>
				<option value="투룸" <c:if test="${type eq '투룸'}">selected</c:if>>투룸</option>
				<option value="오피스텔" <c:if test="${type eq '오피스텔'}">selected</c:if>>오피스텔</option>
				<option value="아파트" <c:if test="${type eq '아파트'}">selected</c:if>>아파트</option>
			</select>
		</div>

		<div class="search">
			<select name="setype" onchange="formChange(this.form)">
				<option value="none"
					<c:if test="${setype eq 'none'}">selected</c:if>>세 종류</option>
				<option value="월세" <c:if test="${setype eq '월세'}">selected</c:if>>월세</option>
				<option value="전세" <c:if test="${setype eq '전세'}">selected</c:if>>전세</option>
			</select>
		</div>
		<div class="menu">
			<select name="money" onchange="formChange(this.form)">
				<option value="none" <c:if test="${money eq 'none'}">selected</c:if>>가격대</option>
				<c:if test="${setype eq '월세'}">
					<option value="30" <c:if test="${money eq '30'}">selected</c:if>>0~30만원</option>
					<option value="60" <c:if test="${money eq '60'}">selected</c:if>>30~60만원</option>
					<option value="90" <c:if test="${money eq '90'}">selected</c:if>>60~90만원</option>
					<option value="120" <c:if test="${money eq '120'}">selected</c:if>>90~120만원</option>
					<option value="max" <c:if test="${money eq 'max'}">selected</c:if>>120만원
						이상</option>
				</c:if>
				<c:if test="${setype eq '전세'}">
					<option value="1" <c:if test="${money eq '1'}">selected</c:if>>0~1억</option>
					<option value="2" <c:if test="${money eq '2'}">selected</c:if>>1억~2억</option>
					<option value="3" <c:if test="${money eq '3'}">selected</c:if>>2억~3억</option>
					<option value="max" <c:if test="${money eq 'max'}">selected</c:if>>3억
						이상</option>
				</c:if>
			</select>
		</div>
		<div class="search">
			<select name="admin" onchange="formChange(this.form)">
				<option value="none" <c:if test="${admin eq 'none'}">selected</c:if>>관리비</option>
				<option value="5" <c:if test="${admin eq '5'}">selected</c:if>>~5만</option>
				<option value="10" <c:if test="${admin eq '10'}">selected</c:if>>~10만</option>
				<option value="20" <c:if test="${admin eq '20'}">selected</c:if>>~20만</option>
			</select>
		</div>

		<div class="search">
			<input type="button" value="필터 초기화" onclick="location.href='list.re'">
		</div>

	</form>

</body>
</html>