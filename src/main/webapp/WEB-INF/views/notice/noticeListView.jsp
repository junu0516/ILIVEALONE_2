<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
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
	#noticeList{text-align: center;}
    #noticeList>tbody>tr:hover{cursor:pointer;}

    #pagingArea{width:fit-content;margin:auto;}
    /* #pagingArea a{color:black} */
   
    #searchForm{
        width:80%;
        margin:auto;
    }
    #searchForm>*{
        float:left;
        margin:5px;
    }
    .select{width:20%;}
    .text{width:53%;}
    .searchBtn{Width:20%;}
  </style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
<div class="container-fluid text-center">    
  <div class="row content">
    <div class="col-sm-2 sidenav">
     <ul class = "list-group">
      		<a href="main.bo" class="list-group-item list-group-item-success">Home</a></p>
      		<a href="Toplist.bo" class="list-group-item list-group-item-success">패션 메인 페이지</a></p>
      		<a href="list.bo" class="list-group-item list-group-item-success">패션 게시물</a></p>
      		<a href="blist.bo" class="list-group-item list-group-item-success">패션 최신뉴스</a></p>
      		<a href="list.no" class="list-group-item list-group-item-success">공지사항</a></p>
      </ul>
    </div>
    
    <div class="col-sm-8 text-left" style="padding:5% 10%;"> 
       
             <h2>공지사항</h2>
            <br>
            <!-- 로그인후 상태일 경우만 보여지는 글쓰기 버튼-->
            <c:if test="${ !empty loginUser }">
            	<a class="btn btn-secondary" style="float:right" href="enrollForm.no">글쓰기</a>
            </c:if>
            <br>
            <table id="noticeList" class="table table-hover" align="center">
                <thead>
                  <tr>
                    <th>글번호</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>조회수</th>
                    <th>작성일</th>
                    <th>첨부파일</th>
                  </tr>
                </thead>
                <tbody>
                	<c:forEach items="${ list }" var="n">
	                    <tr>
	                        <td>${ n.noticeNo }</td>
	                        <td>${ n.noticeTitle }</td>
	                        <td>${ n.noticeWriter }</td>
	                        <td>${ n.count }</td>
	                        <td>${ n.createDate }</td>
	                        <c:if test="${ !empty n.originName }">
	                        	<td>★</td>
	                        </c:if>
	                        <c:if test="${ empty n.originName }">
	                        	<td>&nbsp;</td>
	                        </c:if>
	                    </tr>
                    </c:forEach>
                </tbody>
            </table>
            <br>

            <div id="pagingArea">
                <ul class="pagination">
                	<c:choose>
                		<c:when test="${ pi.currentPage ne 1 }">
                			<li class="page-item"><a class="page-link" href="list.no?currentPage=${ pi.currentPage-1 }">Previous</a></li>
                		</c:when>
                		<c:otherwise>
                			<li class="page-item disabled"><a class="page-link" href="">Previous</a></li>
                		</c:otherwise>
                	</c:choose>
                	
                    <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
                    	<c:choose>
	                		<c:when test="${ pi.currentPage ne p }">
                    			<li class="page-item"><a class="page-link" href="list.no?currentPage=${ p }">${ p }</a></li>
	                		</c:when>
	                		<c:otherwise>
	                			<li class="page-item disabled"><a class="page-link" href="">${ p }</a></li>
	                		</c:otherwise>
	                	</c:choose>
                    </c:forEach>
                    
                    
                    <c:choose>
                		<c:when test="${ pi.currentPage ne pi.maxPage }">
                			<li class="page-item"><a class="page-link" href="list.no?currentPage=${ pi.currentPage+1 }">Next</a></li>
                		</c:when>
                		<c:otherwise>
                			<li class="page-item disabled"><a class="page-link" href="list.no?currentPage=${ pi.currentPage+1 }">Next</a></li>
                		</c:otherwise>
                	</c:choose>
                </ul>
            </div>
           
            
            <br><br>
        </div>
    
                   <div class="col-sm-2 sidenav">
      	<body onload = "showImage()">
      	<div class = "well" >
      		<h2>오늘의 패션(남자)</h2>
			<img class = "introImg" id = "introImg" border="0" >
       	<br><br><br>
        <hr>
        <br><br>
        	<h2>오늘의 패션(여자)</h2>
			<img class = "introImg1" id = "introImg1" border="0" >
      	</div>
      	</body>
    <script>
			var imgArray = new Array();
			imgArray[0] = "resources/img/A1.jfif";
			imgArray[1] = "resources/img/A2.jfif";
			imgArray[2] = "resources/img/A3.jfif";
			imgArray[3] = "resources/img/A4.jfif";
			
			var imgArray1 = new Array();
			imgArray1[0] = "resources/img/B1.jfif";
			imgArray1[1] = "resources/img/B2.jfif";
			imgArray1[2] = "resources/img/B3.jfif";
			imgArray1[3] = "resources/img/B4.jfif";

			
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
    		$("#noticeList tbody tr").click(function(){
    			location.href="detail.no?nno=" + $(this).children().eq(0).text();
    		});
    	});
    </script>	
  
   <jsp:include page="../common/footer.jsp"/>

</body>
</html>
