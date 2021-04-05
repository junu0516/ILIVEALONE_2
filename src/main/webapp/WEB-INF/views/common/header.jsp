<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>

<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>메인화면</title>
 	 
 	<!-- 부트스트랩 CDN 적용 -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">	
	<!-- 아이콘 사용 관련 -->
  	<link href="resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <!-- 폰트 적용 관련 -->
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
	<!-- 템플릿 커스텀 css 적용 -->
    <!-- Custom styles for this template -->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">

<style>
#member_name{
	position:fixed;
	right:70px;

}
.nav-link{
	margin-left: 30px;
	font-size: 20px;
	color:red;
	

}
#header_2{
	margin-left: 30px;
	font-size: 20px;
	
}

</style>	
</head>
<body>
 	<!-- Navigation -->
 	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
		<div class="container">
		    <img class="img-fluid d-block mx-auto" src="./resources/images/logo/logo_transparent.png" alt="" width="45px" height="45px">
		
			<a class="navbar-brand" href="${pageContext.servletContext.contextPath}">ILIVEALONE</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        		<span class="navbar-toggler-icon"></span>
      		</button>
	      	<div class="collapse navbar-collapse" id="navbarResponsive">
	        	<ul class="navbar-nav  ml-auto ">
	          	
	          
	          		<li class="nav-item">
	            		<a class="nav-link" href="list.gb">공동구매</a>
	          		</li>
	          
	         		<li class="nav-item">
	            		<a class="nav-link" href="list.um">중고거래</a>
	          		</li>
	          
	          		<li class="nav-item">
	            		<a class="nav-link" href="list.re">부동산</a>
	          		</li>
	          
	 		        <li>
	          			<div id ="header_2">
	    					<ul class="nav navbar-nav">
	      						<li class="dropdown"> <a class="dropdown-toggle btn text-secondary" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-expanded="false" style="font-size: 20px;" >게시판<span class="caret"></span></a>
				        			<ul class="dropdown-menu">				        			
					         			<li class="nav-item"><a class = "dropdown-item" href="Toplist.bo">패션 게시판</a></li>
					          			<li class="nav-item"><a class = "dropdown-item" href="Toplistf.fo">푸드 게시판</a></li>
				          				<li class="nav-item"><a class = "dropdown-item" href="Toplistf.ho">하우징 게시판 </a></li>
				        			</ul>	
		        				</li>
		        			</ul>
		        		</div>
	           		</li>

	           		<!-- <a class="btn color-white dropdown-toggle" data-toggle="dropdown" href="#">게시판<span class="caret"> -->



	           	

	           		<c:if test="${ empty sessionScope.loginUser }">
			
	           		<li class="nav-item">
	            		<a class="nav-link" href="enrollForm.me">회원가입</a>
	          		</li>
	          		
	          		<li class="nav-item">
	            		<a class="nav-link" data-toggle="modal" data-target="#loginModal">로그인</a>
	          		</li>
					
                    </c:if>
                    
                    <c:if test="${ !empty sessionScope.loginUser }">
	                <div class="dropdown " id="member_name">
		 				 <a class="btn color-white dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-expanded="false">
		 				 <i class="fas fa-user-circle"></i> <b style="color:white">&nbsp; ${ loginUser.userName } 님</b>
		  				</a>
		
		 			 <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink" 	style="text-align: center;" >
		  				<li><a class="dropdown-item" href="myPage.me">마이페이지</a></li>
						<li><a class="dropdown-item" href="logout.me">로그아웃</a></li>
		  			</ul>
		  			</div>
	                <!-- 
	                <li class="nav-item">
	                	<i class="fas fa-user-circle"><a class="nav-link" href="myPage.me">${ loginUser.userName }님</a></i>
	                	
	            		<li class="nav-item">
	          			<a class="nav-link" href="myPage.me">마이페이지</a>
	          			</li>
	          		</li>
	          		
	          		<li class="nav-item">
	            		<a class="nav-link" href="logout.me">로그아웃</a>
	          		</li>
	          		-->
	          		
                	</c:if>  
	           		
				</ul>
				
	 		</div>
        </div>
  </nav>
  
  
   <!-- 로그인 클릭 시 뜨는 모달  -->
	<div class="modal fade" id="loginModal">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">로그인 <i class="fas fa-users"></i></h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button> 
            </div>

            <form action="login.me" method="post">
                <!-- Modal Body -->
                <div class="modal-body">
                    <label for="userId" class="mr-sm-2"><i class="fas fa-user-tag"></i> 아이디 :</label>
                    <input type="text" class="form-control mb-2 mr-sm-2" placeholder="ID를 입력하세요" id="userId" name="userId"> 
                    <label for="userPwd" class="mr-sm-2"><i class="fas fa-user-lock"></i> 비밀번호:</label>
                    <input type="password" class="form-control mb-2 mr-sm-2" placeholder="비밀번호를 입력하세요" id="userPwd" name="userPwd">
                	<br>
                	<!-- 
                	<li>
	            		<a href="list.gb">아이디 찾기</a>
	          		</li>
	          		-->
	          		<li>
	            		<a href="findPwd.me">비밀번호 찾기</a>
	          		</li>
                </div>
                
                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary">로그인</button>
                    <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
                </div>
            </form>
            </div>
        </div>
    </div>    

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
    <!-- ajax 사용을 위한 제이쿼리 적용 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</body>
</html>