<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>

<head>
<meta charset="UTF-8">

<title>비밀번호 찾기</title>
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

</head>
<body id="page-top">
	<jsp:include page="../common/header.jsp" />
	<div class="container-fluid">
	<br>
	<br>
	<br>
	<br>
<div class="container-fluid">
	<h2 align="center">비밀번호 찾기 <i class="far fa-address-book"></i></h2>
	<br>
	</div>
	<div>
	
	<div class="innerOuter" style="height:200px">
					<label><i class="fas fa-user-tag"></i>아이디 : </label><br>
					<input class="form-control" type="text" id="userIdInput" name="userIdInput" placeholder="아이디를 입력하세요" required>
					<br>
				
					<label><i class="fas fa-at"></i>이메일 : </label><br>
					
					<input class="form-control" type="email" id="email" name="email" placeholder="이메일을 입력하세요" required>
					<br>
				
				<div class="btns" align="center">
				<br>
					<button type="button" id=findBtn class="btn btn-primary">비밀번호 찾기</button>
					<button type="button" onclick="history.go(-1);" class="btn btn-danger">이전 화면으로</button>
				</div>
			</div>
			</div>
		<script>
			$(function(){
				$("#findBtn").click(function(){
					
					$.ajax({
						url : "find_pw.do",
						type : "POST",
						data : {
							userId : $("#userIdInput").val(),
							email : $("#email").val()
						},
						success : function(result) {
							console.log(result);
							alert("입력하신 메일주소로 변경된 비밀번호를 전송했습니다. \n 다시 로그인해주세요");
						},
						error : function(result){
							console.log(result);
							alert(result);
						}
					})
				});
			})
</script>
<br><br><br><br><br><br><br><br><br><br><br>
	<jsp:include page="../common/footer.jsp" />
</body>

</html>