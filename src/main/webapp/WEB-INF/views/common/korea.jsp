<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
</head>
<body>
<div class = "container">

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

</body>
</html>