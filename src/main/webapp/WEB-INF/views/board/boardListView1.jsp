<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
  <title>Bootstrap Example</title>
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
	#boardList{text-align: center;}
    #boardList>tbody>tr:hover{cursor:pointer;}

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
        
        .pagination{
            display: flex;
            justify-content: center;
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

<div class="container-fluid text-center">    
  <div class="row content">
    <div class="col-sm-2 sidenav">

      <p><a href="list.bo">패션 게시물</a></p>
      <p><a href="enrollForm.bo">패션 최신뉴스</a></p>
      <p><a href="#">공지사항</a></p>
    </div>
    
    <div class="col-sm-8 text-left" style="padding:5% 10%;"> 
       
             <h2>게시판</h2>
            <br>
            <!-- 로그인후 상태일 경우만 보여지는 글쓰기 버튼-->
            <c:if test="${ !empty loginUser }">
            	<a class="btn btn-secondary" style="float:right" href="enrollForm.bo">글쓰기</a>
            </c:if>
            <br>
            <div class="container">
		<form class="form-inline" action="search.gb">
			<select class="form-control mb-2 mr-sm-2" name="condition">
				<option value="title">제목</option>
				<option value="product">제품</option>
			</select>
			<input type="text" class="form-control mb-2 mr-sm-2" name="keyword" id="keyword" placeholder="검색어 입력"/>
			<button type="submit" class="btn btn-primary mb-2">검색</button>
		</form>
	</div>
	
	<div class="container-fluid" id="cardArea">
		<c:forEach items="${list}" var="gbBoard"> 
			<div class="card">
		        <div class="card-header">
		           	 ${gbBoard.gbTitle}
		        </div>
		        <div>
					<img class="card-img-top" src="${pageContext.request.contextPath}/resources/upload_files/${gbBoard.gbChangedName}" height="400px"/>
		        </div>
		        <div class="card-body">
		          <h4 class="card-title">${products[gbBoard.gbNo].pName}</h4>
		          <p class="card-text">${products[gbBoard.gbNo].pLimit}명 도달시 종료</p>
		          <p class="card-text">${products[gbBoard.gbNo].pPrice} 원</p>
		          <a href="detail.gb?gbNo=${gbBoard.gbNo}" class="btn btn-primary">상세 보기</a>
		        </div>
		     </div>
		</c:forEach>
     </div>
            <br>

            <div id="pagingArea">
                <ul class="pagination">
                	<c:choose>
                		<c:when test="${ pi.currentPage ne 1 }">
                			<li class="page-item"><a class="page-link" href="list.bo?currentPage=${ pi.currentPage-1 }">Previous</a></li>
                		</c:when>
                		<c:otherwise>
                			<li class="page-item disabled"><a class="page-link" href="">Previous</a></li>
                		</c:otherwise>
                	</c:choose>
                	
                    <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
                    	<c:choose>
	                		<c:when test="${ pi.currentPage ne p }">
                    			<li class="page-item"><a class="page-link" href="list.bo?currentPage=${ p }">${ p }</a></li>
	                		</c:when>
	                		<c:otherwise>
	                			<li class="page-item disabled"><a class="page-link" href="">${ p }</a></li>
	                		</c:otherwise>
	                	</c:choose>
                    </c:forEach>
                    
                    
                    <c:choose>
                		<c:when test="${ pi.currentPage ne pi.maxPage }">
                			<li class="page-item"><a class="page-link" href="list.bo?currentPage=${ pi.currentPage+1 }">Next</a></li>
                		</c:when>
                		<c:otherwise>
                			<li class="page-item disabled"><a class="page-link" href="list.bo?currentPage=${ pi.currentPage+1 }">Next</a></li>
                		</c:otherwise>
                	</c:choose>
                </ul>
            </div>
           
            <br clear="both"><br>
            
			
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



</body>
</html>
