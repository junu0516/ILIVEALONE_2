<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>

<head>
<meta charset="UTF-8">

<title>비밀번호 찾기</title>

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
	</div>
	<div>
	<p>
					<label>ID</label>
					<input class="w3-input" type="text" id="userId" name="userId" required>
				</p>
				<p>
					<label>Email</label>
					<input class="w3-input" type="text" id="email" name="email" required>
				</p>
				<p class="w3-center">
					<button type="button" id=findBtn class="btn btn-primary">find</button>
					<button type="button" onclick="history.go(-1);" class="btn btn-danger">Cancel</button>
				</p>
			</div>
		<script>
			$(function(){
				$("#findBtn").click(function(){
					console.log("진입");
					$.ajax({
						url : "find_pw.do",
						type : "POST",
						data : {
							userId : $("#userId").val(),
							email : $("#email").val()
						},
						success : function(result) {
							alert(result);
						}
					})
				});
			})
</script>
	
</body>
</html>