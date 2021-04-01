<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
<title>회원가입</title>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	 <div class="content">
        <br>
        <br>
        <br>
        <br>
        <div class="innerOuter">
            <h2>회원가입</h2>
            <br>

            <form id="enrollForm" action="insert.me" method="post">
                <div class="form-group">
                    <label for="userId">아이디 :</label>
                    <input type="text" class="form-control" id="userId" name="userId" placeholder="ID" required>
                    <div id="checkResult" style="display:none; font-size:1.2em"></div>
                    <br>
                    
                    <label for="userPwd">비밀번호 :</label>
                    <input type="password" class="form-control" id="userPwd" maxlength="12" name="userPwd" placeholder="Password(최대12자리)" required><br>
                    <label for="checkPwd">비밀번호 확인 :</label>
                    <input type="password" class="form-control" id="checkPwd" maxlength="12" name="checkPwd" placeholder="Password 확인(최대12자리)" required><br>
                    <div id="checkResult2" style="display:none; font-size:1.2em"></div>
                    <br>
                    
                    <label for="userName">이름 :</label>
                    <input type="text" class="form-control" id="userName" name="userName" placeholder="이름" required><br>
                    
                    <label for="email"> &nbsp; 이메일주소 :</label>
                    <input type="email" class="form-control" id="email" name="email" placeholder="Email"><br>
                    
                    <label for="age"> &nbsp; 나이 :</label>
                    <input type="number" class="form-control" id="age" name="age" placeholder="나이"><br>
                    
                    <label for="phone"> &nbsp; 휴대폰 번호 :</label>
                    <input type="tel" class="form-control" id="phone" name="phone" placeholder="전화번호(-없이)"><br>
                    
                    <label for="address"> &nbsp; 주소 :</label>
             		<div class="form-inline">
					<label> &nbsp; 우편번호 : &nbsp;</label>
						<input type="text"  id="post" name="post" class="form-control mr-2 postcodify_postcode5" size="6">
						<button type="button" class="btn btn-primary" id="postcodify_search_button">검색</button>
					</div>
					<br>
					<label> &nbsp; 도로명주소 : </label>
					<input type="text" name="address1" class="form-control postcodify_address" size="30">
					<br>
				    <label> &nbsp; 상세주소 : </label>
					<input type="text" name="address2" class="form-control postcodify_extra_info" size="30">
					<br>
				
				
				<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
				<script>
					 $(function(){
						$("#postcodify_search_button").postcodifyPopUp();
					}); 
				</script>
                    <label for=""> &nbsp; 성별 : </label> &nbsp;&nbsp;
                    <input type="radio" name="gender" id="Male" value="M">
                    <label for="Male">남자</label> &nbsp;&nbsp;
                    <input type="radio" name="gender" id="Female" value="F">
                    <label for="Female">여자</label><br>
                    
                </div>
                <br>
                <div class="btns" align="center">
                    <button type="submit" id="enrollBtn" class="btn btn-primary" >회원가입</button>
                    <button type="reset" class="btn btn-danger"> 초기화</button>
                </div>
            </form>
        </div>
        <br><br>
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
				if (pwdChk1 == pwdChk2 && (pwdChk1 != '' && pwdChk2 != '') ) {
					$("#checkResult2").css("color", "green").text("비밀번호가 일치합니다.");
					$("#checkResult2").show();
					
				} else if((pwdChk1 == '' && pwdChk2 == '') || pwdChk1 == '' || pwdChk2 == ''){
					$("#checkResult2").hide();	
				}else{
					$("#checkResult2").css("color", "red").text("비밀번호가 일치하지 않습니다.");
					$("#checkResult2").show();					
				}

			});
			
			pwdChk.keyup(function() {
			var pwdChk1 = $("#enrollForm input[name=userPwd]").val();   				
			var pwdChk2 = $("#enrollForm input[name=checkPwd]").val();
				if (pwdChk1 == pwdChk2 && (pwdChk1 != '' && pwdChk2 != '') ) {
					$("#checkResult2").css("color", "green").text("비밀번호가 일치합니다.. ");
					$("#checkResult2").show();
				} else if((pwdChk1 == '' && pwdChk2 == '') || pwdChk1 == '' || pwdChk2 == ''){
					$("#checkResult2").hide();	
				}else{
					$("#checkResult2").css("color", "red").text("비밀번호가 일치하지 않습니다. ");
					$("#checkResult2").show();					
				}

			});
		});
		
    </script>
	
<jsp:include page="../common/footer.jsp"/>
</body>
</html>