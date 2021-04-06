<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<style>
 	#findForm>table{width:100%;}
    #findForm>table *{ margin:5px;}
    .content{
        background-color:rgb(247, 245, 245);
        width:80%;
        margin:auto;
    }
    .innerOuter{
        
        width:40%;
        margin:auto;
        padding:5% 10%;
        background:white;
    }
    #page-top{
padding-top:13px;
}
</style>
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

<body id="page-top">
	<jsp:include page="../common/header.jsp" />
	<div class="container-fluid">
	<br>
	<br>
	<br>
	<br>
<div class="container-fluid">
		


	<h2 align="center">아이디 찾기 <i class="far fa-address-book"></i></h2>
	
	<form id="findForm" action="find_id.do" method="post">
		<div class="form-group">
			<div class="innerOuter" style="height:200px">
			<label for="email"> <i class="fas fa-at"></i>&nbsp; 이메일주소 :</label> 
			<input type="email" class="form-control" id="email" name="email" placeholder="이메일을 입력하세요">
			</div>
			<div class="innerOuter" style="height:200px">
			<label for="phone">번호 : </label>
			<input type="text" class="form-control" id="phone" name="phone" placeholder="번호를 입력하세요">
			</div>
			<br>
			<br>
		<div class="btns" align="center">
			<button type="submit" id=findBtn class="btn btn-primary">아이디 찾기</button>
			<button type="button" onclick="history.go(-1);" class="btn btn-danger">취소</button>
		</div>
	</form>
	</div>
	</div>
	
	<jsp:include page="../common/footer.jsp" />	
</body>
</html>