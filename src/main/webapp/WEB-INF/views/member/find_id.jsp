<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	$(function(){
		$("#loginBtn").click(function(){
			location.href='../views/main.jsp';
		})
	})
</script>
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
        
        width:60%;
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
		


	<h2 align="center">아이디 찾기 결과 <i class="far fa-address-book"></i></h2>
			</div>
			<div>
			<div class="form-group">
			<div class="innerOuter" style="height:200px">
				<h3 align="center">
					회원님의 아이디는  "${userId}" 입니다.
				</h3>
				<br>
				<br>
				
				<div class="btns" align="center">
					<button type="button" id="LoginModal" class= "btn btn-primary">Login</button>
					<button type="button" onclick="history.go(-1);" class="btn btn-danger">Cancel</button>
				</p>
			</div>
		</div>
	</div>
	

	<jsp:include page="../common/footer.jsp" />	
</body>
<script>

</script>
</html>