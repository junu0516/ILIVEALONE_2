<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<!--  
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
	-->
<title>ILIVEALONE회원가입</title>
<style>
 	#enrollForm>table{width:100%;}
    #enrollForm>table *{ margin:5px;}
    .content{
        background-color:rgb(247, 245, 245);
        width:80%;
        margin:auto;
    }
    .innerOuter{
        
        width:65%;
        margin:auto;
        padding:5% 10%;
        background:white;
    }
    #page-top{
padding-top:13px;
}
</style>

<!-- Custom fonts for this template -->


</head>


<body id="page-top">
	<jsp:include page="../common/header.jsp" />




	<!-- Begin Page Content -->
	<div class="container-fluid">

		<br> <br> <br> <br>
	<div class="innerOuter">
		<h2 align="center">회원가입 <i class="fas fa-user-plus"></i></h2>
		<br>
		<form id="enrollForm" action="insert.me" method="post">
			<div class="form-group">
				
				<label for="userId"><i class="fas fa-user-tag"></i> 아이디 :</label>
					<input type="text" class="form-control" id="userId" name="userId" placeholder="ID를 입력하세요" required>
				<div id="checkResult" style="display: none; font-size: 1.2em"></div>
				<br> 
				<label for="userPwd"><i class="fas fa-user-lock"></i> 비밀번호 :</label> 
					<input type="password" maxlength='10' class="form-control" id="userPwd" name="userPwd" placeholder="비밀번호를 입력하세요(최대10자리)"required>
				<br> 
				<label for="checkPwd"><i class="fas fa-user-check"></i> 비밀번호 확인 :</label> 
					<input type="password" maxlength='10' class="form-control" id="checkPwd" name="checkPwd" placeholder="비밀번호를 확인하세요(최대10자리)" required>
				<br>
				<div id="checkResult2" style="display: none; font-size: 1.2em"></div>
				<label for="userName"><i class="fas fa-id-card"></i> 이름 :</label> 
					<input type="text" class="form-control" id="userName" name="userName" placeholder="이름을 입력하세요" required>
				<br> 
				<label for="email"> <i class="fas fa-at"></i>&nbsp; 이메일주소 : </label> 
					<input type="email" class="form-control" id="email" name="email" placeholder="이메일을 입력하세요">
				<br> 
				<label for="age"><i class="fas fa-child"></i>&nbsp; 나이 : </label> 
					<input type="number" class="form-control" id="age" name="age" placeholder="나이를 입력하세요">
				<br> 
				<label for="phone"><i class="fas fa-mobile-alt"></i> &nbsp; 휴대폰 번호 :</label> 
					<input type="tel" class="form-control" id="phone" name="phone" placeholder="전화번호(-없이)를 입력하세요">
				<br> 
				<label for="address"><i class="fas fa-address-book"></i> &nbsp; 주소:</label>
				<div class="form-inline">
				<label> &nbsp; 우편번호 : &nbsp;</label> 
					<input type="text" id="post" name="post" class="form-control mr-3 postcodify_postcode5" size="6">
				<button type="button" class="btn btn-primary" id="postcodify_search_button">검색</button>
				</div>
				<br>
				<label> &nbsp; 도로명주소 : </label> <input type="text" name="address1" class="form-control postcodify_address" size="30">
				<br> 
				<label> &nbsp; 상세주소 : </label> 
					<input type="text" name="address2" class="form-control postcodify_extra_info" size="30"> 
				<br>



				<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
				<script>
					$(function() {
						$("#postcodify_search_button").postcodifyPopUp();
					});
				</script>
				<label for=""> <i class="fas fa-restroom"></i>&nbsp; 성별 :
				</label> &nbsp;&nbsp; <input type="radio" name="gender" id="Male" value="M">
				<label for="Male">남자</label> &nbsp;&nbsp; <input type="radio"
					name="gender" id="Female" value="F"> <label for="Female">여자</label><br>

			</div>
			<br>
			<div class="btns" align="center">
				<button type="submit" id="enrollBtn" class="btn btn-primary">회원가입</button>
				<button type="reset" class="btn btn-danger">초기화</button>
			</div>
		</form>
	</div>
	<br>
	<br>
	</div>
	
	
	<script>
		function idCheckValidate(num) {

			if (num == 0) {
				$("#checkResult").hide();
				$("#enrollBtn").attr("disabled", true);

			} else if (num == 1) {
				$("#checkResult").css("color", "red").text("사용이 불가능한 아이디입니다.");
				$("#checkResult").show();
				$("#enrollBtn").attr("disabled", true);

			} else if (num == 2) {
				$("#checkResult").css("color", "green").text("사용 가능한 아이디입니다. ");
				$("#checkResult").show();
				$("#enrollBtn").removeAttr("disabled");

			}

		}

		$(function() {

			var $idInput = $("#enrollForm input[name=userId]");

			$idInput.keyup(function() {

				if ($idInput.val().length >= 5) {
					console.log("function");
					$.ajax({
						url : "idCheck.me",
						data : {
							userId : $idInput.val()
						},
						type : "post",
						success : function(result) {
							if (result > 0) {
								idCheckValidate(1);
							} else {
								idCheckValidate(2);
							}
						},
						error : function() {
							console.log("ajax 연결 실패");
						}
					});

				} else {
					idCheckValidate(0);
				}

			});
		});

		$(function() {

			var pwdChk = $("#enrollForm input[name=checkPwd]");
			var pwdChk2 = $("#enrollForm input[name=userPwd]");

			pwdChk2.keyup(function() {
				var pwdChk1 = $("#enrollForm input[name=userPwd]").val();
				var pwdChk2 = $("#enrollForm input[name=checkPwd]").val();
				if (pwdChk1 == pwdChk2 && (pwdChk1 != '' && pwdChk2 != '')) {
					$("#checkResult2").css("color", "green").text(
							"비밀번호가 일치합니다.");
					$("#checkResult2").show();

				} else if ((pwdChk1 == '' && pwdChk2 == '') || pwdChk1 == ''
						|| pwdChk2 == '') {
					$("#checkResult2").hide();
				} else {
					$("#checkResult2").css("color", "red").text(
							"비밀번호가 일치하지 않습니다.");
					$("#checkResult2").show();
				}

			});

			pwdChk.keyup(function() {
				var pwdChk1 = $("#enrollForm input[name=userPwd]").val();
				var pwdChk2 = $("#enrollForm input[name=checkPwd]").val();
				if (pwdChk1 == pwdChk2 && (pwdChk1 != '' && pwdChk2 != '')) {
					$("#checkResult2").css("color", "green").text(
							"비밀번호가 일치합니다.. ");
					$("#checkResult2").show();
				} else if ((pwdChk1 == '' && pwdChk2 == '') || pwdChk1 == ''
						|| pwdChk2 == '') {
					$("#checkResult2").hide();
				} else {
					$("#checkResult2").css("color", "red").text(
							"비밀번호가 일치하지 않습니다. ");
					$("#checkResult2").show();
				}

			});
		});
	</script>
	</div>
	<!-- /.container-fluid -->
	</div>
	<!-- End of Main Content -->

	</div>
	<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Logout Modal-->


	<!-- Bootstrap core JavaScript-->

	

	<jsp:include page="../common/footer.jsp" />
</body>

</html>