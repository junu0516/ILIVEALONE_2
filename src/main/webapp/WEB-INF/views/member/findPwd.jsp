<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/sb-admin-2.min.css" rel="stylesheet">

<!-- Custom styles for this page -->
<link href="vendor/datatables/dataTables.bootstrap4.min.css"
	rel="stylesheet">
</head>
</head>
<body id="page-top">
	<jsp:include page="../common/header.jsp" />
	<div class="container-fluid">
	<br>
	<br>
	<br>
	<br>

	<h2 align="center">비밀번호 찾기 <i class="far fa-address-book"></i></h2>
	<br>
	<form id="findForm" action="find.me" method="post">
		<div class="form-group">
			<label for="userId"><i class="fas fa-user-tag"></i> 아이디 :</label> 
			<input type="text" class="form-control" id="userId" name="userId" placeholder="ID를 입력하세요" required>
			<br> 
			<label for="userName"><i class="fas fa-id-card"></i> 이름 :</label> 
			<input type="text" class="form-control" id="userName" name="userName" placeholder="이름을 입력하세요" required>
			<br> 
			<label for="email"> <i class="fas fa-at"></i>&nbsp; 이메일주소 :</label> 
			<input type="email" class="form-control" id="email" name="email" placeholder="이메일을 입력하세요">
			<br>
			<br>
			<div class="btns" align="center">
				<button type="button" id="enrollBtn" class="btn btn-primary">메인화면으로</button>
				<button type="button" class="btn btn-danger">인증번호 전송</button>
			</div>
			<br>
		
	<jsp:include page="../common/footer.jsp" />		
</body>
</html>