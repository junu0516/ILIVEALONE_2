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

<title>ILIVEALONE마이페이지</title>

<!-- Custom fonts for this template -->
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
	<!-- 바디 부분 -->
	<!-- Page Wrapper -->
	<div id="wrapper">


		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">



				<!-- Begin Page Content -->
				<div class="container-fluid">
					<br> <br> <br> <br>
					<div class="innerOuter">
						<h2 align="center">
							마이페이지 <i class="far fa-address-book"></i>
						</h2>
						<br>

						<form action="update.me" method="post" onsubmit="">
							<div class="form-group">
								<label><i class="fas fa-user-tag"></i> 아이디 :</label> <input
									type="text" class="form-control" id="userId" name="userId"
									value="${ loginUser.userId }" readonly><br> <label
									for="userName"><i class="fas fa-id-card"></i> 이름 :</label> <input
									type="text" class="form-control" id="userName" name="userName"
									value="${ loginUser.userName }" readonly><br> <label
									for="userName"><i class="fas fa-user-lock"></i> 비밀번호 :</label>&nbsp;
								<button type="button" data-toggle="modal"
									data-target="#passwordCheckModal" class="btn btn-primary">비밀번호
									확인</button>
								<br>
								<br> <input type="password" class="form-control"
									id="userPwd" name="userPwd" value="${ loginUser.userPwd }"
									readonly><br> <label for="email"><i
									class="fas fa-at"></i> &nbsp;이메일주소 :</label> <input type="email"
									class="form-control" id="email" name="email"
									value="${ loginUser.email }"><br> <label for="age">
									<i class="fas fa-child"></i>&nbsp; 나이 :
								</label> <input type="number" class="form-control" id="age" name="age"
									value="${ loginUser.age }"><br> <label for="phone">
									<i class="fas fa-mobile-alt"></i>&nbsp; 휴대폰 번호 :
								</label> <input type="tel" class="form-control" id="phone" name="phone"
									value="${ loginUser.phone }"><br> <label
									for="address"><i class="fas fa-address-book"></i>
									&nbsp; 주소 :</label><br>


								<c:forTokens var="addr" items="${ loginUser.address }"
									delims="/" varStatus="status">
									<c:if
										test="${ status.index eq 0 && addr >= '0' && addr <= '99999' }">
										<c:set var="post" value="${ addr }" />
									</c:if>
									<c:if
										test="${ status.index eq 0 && !(addr >= '0' && addr <= '99999') }">
										<c:set var="address1" value="${ addr }" />
									</c:if>
									<c:if test="${ status.index eq 1 }">
										<c:set var="address1" value="${ addr }" />
									</c:if>
									<c:if test="${ status.index eq 2 }">
										<c:set var="address2" value="${ addr }" />
									</c:if>
								</c:forTokens>
								<div class="form-inline">
									<label> &nbsp; 우편번호 : &nbsp;</label> <input type="text"
										id="post" name="post"
										class="form-control mr-2 postcodify_postcode5" size="6">
									<button type="button" class="btn btn-primary"
										id="postcodify_search_button">검색</button>
								</div>
								<br> <label> &nbsp; 도로명주소 : </label> <input type="text"
									name="address1" class="form-control postcodify_address"
									value="${ address1 }" size="30"> <br> <label>
									&nbsp; 상세주소 : </label> <input type="text" name="address2"
									class="form-control postcodify_extra_info"
									value="${ address2 }" size="30">



								<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>

								<script>
									$(function() {
										$("#postcodify_search_button")
												.postcodifyPopUp();
									});
								</script>
								<br>
								<br> <label for=""> <i class="fas fa-restroom"></i>&nbsp;
									성별 :
								</label> &nbsp;&nbsp; <input type="radio" name="gender" id="Male"
									value="M"> <label for="Male">남자</label> &nbsp;&nbsp; <input
									type="radio" name="gender" id="Female" value="F"> <label
									for="Female">여자</label><br>

								<script>
									$(function() {
										if ("${loginUser.gender}" == "M") {
											$("#Male").attr("checked", true);
										} else if ("${loginUser.gender}" == "F") {
											$("#Female").attr("checked", true);
										}
									});
								</script>

							</div>
							<br>

							<div class="btns" align="center">
								<button type="submit" class="btn btn-primary">수정하기</button>
								<button type="button" onclick="$('#postForm').submit();"
									class="btn btn-danger">탈퇴하기</button>
							</div>
						</form>

					</div>
					<br>
					<br>
				</div>




				<form action="delete.me" method="post" id="postForm">
					<input type="hidden" name="userId" value="${ loginUser.userId }">
				</form>

				<div class="modal fade" id="passwordCheckModal">
					<div class="modal-dialog modal-sm">
						<div class="modal-content">
							<div class="modal-header">
								<h3 class="modal-title">
									비밀번호 확인 <i class="fas fa-user-cog"></i>
								</h3>
								<button type="button" class="close" data-dismiss="modal"
									class="btn btn-primary">&times;</button>
							</div>



							<div class="modal-body">
								<div class="form-inline">
									<label for="inputPwd" class="mr-sm-2">현재 비밀번호 : </label><br>
									<button id="pwdCheckBtn" class="btn btn-primary">확인</button>
								</div>
								<input type="password" class="form-control mb-2 mr-sm-2"
									id="inputPwd" name="inputPwd" required />

								<form action="updatePwd.me" method="post"
									onsubmit="return checkEqual()">
									<label for="newPwd" class="mr-sm-2">변경할 비밀번호 : </label> <input
										type="password" maxlength='10'
										class="form-control mb-2 mr-sm-2" id="newPwd" name="newPwd"
										disabled required /> <label for="checkPwd" class="mr-sm-2">변경할
										비밀번호 확인 : </label> <input type="password" maxlength='10'
										class="form-control mb-2 mr-sm-2" id="checkPwd"
										name="checkPwd" disabled required />
							</div>

							<div class="modal-footer">
								<button type="submit" id="submit" class="btn btn-primary"
									disabled>확인</button>
								<button type="button" class="btn btn-danger"
									data-dismiss="modal">취소</button>
							</div>
							</form>

							<script>
								$("#pwdCheckBtn").click(function() {

									var inputPwd = $("#inputPwd").val();
									$.ajax({
										url : "checkPwd.me",
										type : "post",
										data : {
											inputPwd : inputPwd
										},
										success : function(status) {
											console.log(status);
											if (status == "success") {
												console.log("비밀번호 일치");
												$("#checkResult").val(status);
												validateSubmit();
											} else {
												console.log("비밀번호 불일치")
											}
										},
										error : function() {
											console.log("실패");
										}
									})

								})

								function validateSubmit() {
									console.log('${ loginUser.userPwd }');
									console.log("새로운 비밀번호 활성화");
									$("#newPwd").removeAttr("disabled");
									$("#checkPwd").removeAttr("disabled");
									$("#submit").removeAttr("disabled");
								}

								function checkEqual() {
									if ($("#newPwd").val() == $("#checkPwd")
											.val()) {
										$("#userPwd").val($("newPwd").val());
										console
												.log($("#userPwd").val() == '${ loginUser.userPwd }');
										return true;
									} else {
										alert("값이 일치하지 않습니다.");
										return false;
									}
								}
							</script>
						</div>
					</div>
				</div>

				<!-- Bootstrap core JavaScript-->

				<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

				<!-- Core plugin JavaScript-->
				<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

				<!-- Custom scripts for all pages-->
				<script src="js/sb-admin-2.min.js"></script>

				<!-- Page level plugins -->
				<script src="vendor/datatables/jquery.dataTables.min.js"></script>
				<script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>

				<!-- Page level custom scripts -->
				<script src="js/demo/datatables-demo.js"></script>
	<jsp:include page="../common/footer.jsp"/>
</body>

</html>