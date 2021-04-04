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
<<<<<<< Updated upstream
 	 
 	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
	 
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
  	
  	<!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
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


=======
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
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
>>>>>>> Stashed changes
  
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
	        	<ul class="navbar-nav ml-auto">
	          		<li class="nav-item active">
	            		<a class="nav-link" href="${pageContext.servletContext.contextPath}">Home
	              			<span class="sr-only">(current)</span>
	            		</a>
	          		</li>
	          
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
	      						<li class="dropdown"> <a class="dropdown-toggle btn text-secondary" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-expanded="false" >게시판<span class="caret"></span></a>
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
	                <div class="dropdown ">
		 				 <a class="btn color-white dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-expanded="false">
		 				 <i class="fas fa-user-circle"></i> <b>&nbsp; ${ loginUser.userName } 님</b>
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
                <h4 class="modal-title">Login</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button> 
            </div>

            <form action="login.me" method="post">
                <!-- Modal Body -->
                <div class="modal-body">
                    <label for="userId" class="mr-sm-2">ID :</label>
                    <input type="text" class="form-control mb-2 mr-sm-2" placeholder="Enter ID" id="userId" name="userId"> <br>
                    <label for="userPwd" class="mr-sm-2">Password:</label>
                    <input type="password" class="form-control mb-2 mr-sm-2" placeholder="Enter password" id="userPwd" name="userPwd">
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

</body>
</html>