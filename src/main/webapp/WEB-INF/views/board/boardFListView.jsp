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
    .row.content {height: 450px}
    
    /* Set gray background color and 100% height */
    .sidenav {
      padding-top: 20px;
      background-color: #f1f1f1;
      height: 100%;
    }
    
    /* Set black background color, white text and some padding */
    footer {
      background-color: #555;
      color: white;
      padding: 15px;
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
   
    

    .select{width:20%;}
    .text{width:53%;}
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
        	display: inline-block;
        }
        
        #cardArea>.card{
        	border : 1px solid gray;
        	box-shadow : 5px 5px lightgray;
        }
  </style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
<div class="container-fluid text-center">    
  <div class="row content">
    <div class="col-sm-2 sidenav">

      <p><a href="list.bo">패션 게시물</a></p>
      <p><a href="blist.bo">패션 최신뉴스</a></p>
      <p><a href="#">공지사항</a></p>
    </div>
    
    <div class="col-sm-8 text-left" style="padding:5% 10%;"> 
       
             <h2>게시판입니다.</h2>
            <br>
            <!-- 로그인후 상태일 경우만 보여지는 글쓰기 버튼-->
            <c:if test="${ !empty loginUser }">
            	<a class="btn btn-secondary" style="float:right" href="enrollForm.fo">글쓰기</a>
            </c:if>
            <br>
          
	<div class="container-fluid" id="cardArea">
		<c:forEach items="${list}" var="f"> 
			<div class="card">
		        <div class="card-header">
		           	 ${f.fashionTitle}
		        </div>
		        <div>
					<img class="card-img-top" src="${pageContext.request.contextPath}/resources/upload_files/${f.fashionChangeName}" height="200px"/>
		        </div>
		        <div class="card-body">
		          <h4 class="card-title">${f.fashionNo}번호</h4>
		          <p class="card-text">${f.fashionWriter}작성자</p>
		          <p class="card-text">${f.fashionCreateDate} 날짜</p>
		          <a href="detail.fo?fno=${f.fashionNo}" class="btn btn-primary">상세 보기</a>
		        </div>
		     </div>
		</c:forEach>
     </div>
            <br>

            <div id="pagingArea">
                <ul class="pagination">
                	<c:choose>
                		<c:when test="${ pi.currentPage ne 1 }">
                			<li class="page-item"><a class="page-link" href="blist.bo?currentPage=${ pi.currentPage-1 }">Previous</a></li>
                		</c:when>
                		<c:otherwise>
                			<li class="page-item disabled"><a class="page-link" href="">Previous</a></li>
                		</c:otherwise>
                	</c:choose>
                	
                    <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
                    	<c:choose>
	                		<c:when test="${ pi.currentPage ne p }">
                    			<li class="page-item"><a class="page-link" href="blist.bo?currentPage=${ p }">${ p }</a></li>
	                		</c:when>
	                		<c:otherwise>
	                			<li class="page-item disabled"><a class="page-link" href="">${ p }</a></li>
	                		</c:otherwise>
	                	</c:choose>
                    </c:forEach>
                    
                    
                    <c:choose>
                		<c:when test="${ pi.currentPage ne pi.maxPage }">
                			<li class="page-item"><a class="page-link" href="blist.bo?currentPage=${ pi.currentPage+1 }">Next</a></li>
                		</c:when>
                		<c:otherwise>
                			<li class="page-item disabled"><a class="page-link" href="blist.bo?currentPage=${ pi.currentPage+1 }">Next</a></li>
                		</c:otherwise>
                	</c:choose>
                </ul>
            </div>
           
            
            <br><br>
        </div>
    
    <div class="col-sm-2 sidenav">
      <div class="well">
        <p>ADS</p>
      </div>
      <div class="well">
        <p>ADS</p>
      </div>
    </div>
    
  </div>

 	</div>
	 <script>
    	$(function(){
    		$("#boardList tbody tr").click(function(){
    			location.href="detail.fo?bno=" + $(this).children().eq(0).text();
    		});
    	});
    </script>	
  

</body>
</html>
