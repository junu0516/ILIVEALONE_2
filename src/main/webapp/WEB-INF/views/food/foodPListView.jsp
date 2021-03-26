<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
   <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
   
  <style>
    /* Remove the navbar's default margin-bottom and rounded borders */ 
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
    }
    
    /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
    .row.content {height: auto;}
    
    /* Set gray background color and 100% height */
    .sidenav {
      padding-top: 20px;
      background-color: #f1f1f1;
      height: auto;
    }
  
    
    /* On small screens, set height to 'auto' for sidenav and grid */
    @media screen and (max-width: 767px) {
      .sidenav {
        height: auto;
        padding: 5px;
      }
      .row.content {height:auto;} 
    }
	

    #pagingArea{width:fit-content;margin:auto;}
    /* #pagingArea a{color:black} */
   
    

    .searchBtn{Width:20%;}
    
    .container{
            display: flex;
            float:left;
        }
        
        .card{
            display: inline-block;
            justify-content: center;
            margin-left: 20px;
            margin-top: 20px;
            width: 30%;
        }
        
        
       #cardArea{
        	display: flex;
        	flex-wrap: wrap;
        }
        
        #cardArea>.card{
        	border : 1px solid gray;
        	box-shadow : 5px 5px lightgray;
        }
        
        
    .introImg{
    	height: 150px;
    	weight: 150px;
    }
    .introImg1{
       	height: 150px;
    	weight: 150px; 
    }
    
  </style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
<div class="container-fluid text-center">    
  <div class="row content">
    <div class="col-sm-2 sidenav">
      <ul class = "list-group">
      	<a href="main.bo" class="list-group-item list-group-item-success">Home</a></p>
      	<a href="Toplist.fo" class="list-group-item list-group-item-success">푸드 메인 페이지</a></p>
      	<a href="list.fo" class="list-group-item list-group-item-success">푸드 게시물</a></p>
      	<a href="blist.fo" class="list-group-item list-group-item-success">푸드 최신뉴스</a></p>
      	<a href="list.no" class="list-group-item list-group-item-success">공지사항</a></p>
      </ul>
    </div>
    
    <div class="col-sm-8 text-left" style="padding:5% 10%;"> 
       
             <h2>게시판입니다.</h2>
            <br>
            <!-- 로그인후 상태일 경우만 보여지는 글쓰기 버튼-->
            <c:if test="${ !empty loginUser }">
            	<a class="btn btn-secondary" style="float:right" href="enrollFormP.fo">글쓰기</a>
            </c:if>
            <br>
          <!-- 검색 기능  -->
            <div class="container">
				<form class="form-inline" action="searchP.fo">
					<select class="form-control mb-2 mr-sm-2" name="condition">
						<option value="title">제목</option>
						<option value="content">내용</option>
						<option value="writer">작성자</option>
					</select>
					<input type="text" class="form-control mb-2 mr-sm-2" name="keyword" id="keyword" placeholder="검색어 입력"/>
					<button type="submit" class="btn btn-primary mb-2">검색</button>
				</form>
			</div>
			<br>
			<div class="container-fluid" id="cardArea">
				<c:forEach items="${list}" var="fdp"> 
					<div class="card">
		        		<div class="card-header">
		           	 	<h5><b>${fdp.foodPTitle}</b></h5>
		        		</div>
		        	<div>
					<img class="card-img-top" src="${pageContext.request.contextPath}/resources/upload_files/${fdp.foodPChangeName}" height="200px"/>
		        </div>
		        <div class="card-body">
		          <h4 class="card-title">번호 : ${fdp.foodPNo}</h4>
		          <p class="card-text">작성자 : ${fdp.foodPWriter}</p>
		          <p class="card-text">날짜 : ${fdp.foodPCreateDate}</p>
		          <a href="detailP.fo?fdpno=${fdp.foodPNo}" class="btn btn-primary">상세 보기</a>
		        </div>
		     </div>
		</c:forEach>
     </div>
            <br>

            <div id="pagingArea">
                <ul class="pagination">
                		<c:url var="searchUrl" value="searchP.fo">
	 							<c:param name="condition" value="${condition}"/>
	 							<c:param name="keyword" value="${keyword}"/>
	 					</c:url>
                	<c:choose>
                		<c:when test="${ pi.currentPage ne 1 }">
                			<li class="page-item"><a class="page-link" href="blist.fo?currentPage=${ pi.currentPage-1 }">Previous</a></li>
                		</c:when>
                		<c:otherwise>
                			<li class="page-item disabled"><a class="page-link" href="">Previous</a></li>
                		</c:otherwise>
                	</c:choose>
                	
                    <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
                    	<c:choose>
	                		<c:when test="${ pi.currentPage ne p }">
                    			<li class="page-item"><a class="page-link" href="blist.fo?currentPage=${ p }">${ p }</a></li>
	                		</c:when>
	                		<c:otherwise>
	                			<li class="page-item disabled"><a class="page-link" href="">${ p }</a></li>
	                		</c:otherwise>
	                	</c:choose>
                    </c:forEach>
                    
                    
                    <c:choose>
                		<c:when test="${ pi.currentPage ne pi.maxPage }">
                			<li class="page-item"><a class="page-link" href="blist.fo?currentPage=${ pi.currentPage+1 }">Next</a></li>
                		</c:when>
                		<c:otherwise>
                			<li class="page-item disabled"><a class="page-link" href="blist.fo?currentPage=${ pi.currentPage+1 }">Next</a></li>
                		</c:otherwise>
                	</c:choose>
                </ul>
            </div>
           
            
            <br><br>
        </div>
    
    <div class="col-sm-2 sidenav">
      	<body onload = "showImage()">
      	<div class = "well" >
      		<h2>오늘의 푸드</h2>
			<img class = "introImg" id = "introImg" border="0" >
       	<br><br><br>
        <hr>
        <br><br>
        	<h2>오늘의 디저트</h2>
			<img class = "introImg1" id = "introImg1" border="0" >
      	</div>
      	</body>
    <script>
	var imgArray = new Array();
	imgArray[0] = "resources/img/오사카.jfif";
	imgArray[1] = "resources/img/토스트.jfif";
	imgArray[2] = "resources/img/프랑스.jfif";
	imgArray[3] = "resources/img/국수.jfif";
	
	var imgArray1 = new Array();
	imgArray1[0] = "resources/img/딸기 케이크.jfif";
	imgArray1[1] = "resources/img/마카로.jfif";
	imgArray1[2] = "resources/img/마카롱.jfif";
	imgArray1[3] = "resources/img/케이크.jfif";


			
			function showImage(){
				var imgNum = Math.round(Math.random()*3);
				var objImg = document.getElementById("introImg");
				objImg.src = imgArray[imgNum];
				
				var imgNum1 = Math.round(Math.random()*3);
				var objImg1 = document.getElementById("introImg1");
				objImg1.src = imgArray1[imgNum1];
			
			}
			
			
	</script>
  </div>
    
  </div>

 	</div>
	 <script>
    	$(function(){
    		$("#foodPFList tbody tr").click(function(){
    			location.href="detailP.fo?fdpno=" + $(this).children().eq(0).text();
    		});
    	});
    </script>	
  
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>
