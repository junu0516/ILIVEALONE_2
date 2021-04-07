<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
	
    <title>하우스 게시판 리스트</title>

    
	<style>
    /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
    .row.content {height: 100%;}
    
    /* Set gray background color and 100% height */
    .sidenav {
      height: 100%;
    }

    /* On small screens, set height to 'auto' for sidenav and grid */
    @media screen and (max-width: 767px) {
      .sidenav {
        height: auto;
      }
      .row.content {height:auto;} 
    }
    
   
    
    #page-top{ padding-top: 61px; }
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
    
   
    </style>
</head>

	  <jsp:include page="../common/header.jsp"/>
<body id="page-top" >
	
	<!-- Page Wrapper -->
    <div id="wrapper">
		<jsp:include page="housingSideBar.jsp"/>

	

		<!-- 바디부분  -->
        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

              <div class="col-sm-15 text-center">

                <!-- Begin Page Content -->
                <div class="container-fluid center">
				

	<br>      
      <h2>패션 게시판 <i class="far fa-clipboard" style="font-size: 20px;"></i></h2>
             
            <br>
             <!-- 로그인후 상태일 경우만 보여지는 글쓰기 버튼-->
            <c:if test="${ !empty loginUser }">
            	<a class="btn btn-secondary" style="float:right" href="enrollFormf.ho">글쓰기</a>
            </c:if>
            <br>
            
            <!-- 검색 기능  -->
            <div class="container">
				<form class="form-inline" action="searchf.ho">
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
			<jsp:useBean id="now" class="java.util.Date" />
				<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />  
           
            <table id="housingList" class="table table-hover" align="center">
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
                	<c:forEach items="${ list }" var="h">
	                    <tr>
	                        <td>${ h.housingNo }</td>
	                        <td>${ h.housingTitle }
								   <c:if test = "${today ==  h.createDate }">
	                      	<img src = "https://tistory2.daumcdn.net/tistory/2916313/skin/images/new_icon_9.gif">
	                         	</c:if>
	                         </td>	
	                        <td>${ h.housingWriter }</td>
	                        <td>${ h.count }</td>
	                        <td>${ h.createDate }</td>
	                        <c:if test="${ !empty h.originName }">
	                        	<td>★</td>
	                        </c:if>
	                        <c:if test="${ empty h.originName }">
	                        	<td>&nbsp;</td>
	                        </c:if>
	                    </tr>
                    </c:forEach>
                </tbody>
            </table>
            <br>

            <div id="pagingArea">
                <ul class="pagination">
                		 	<c:url var="searchUrl" value="searchf.ho">
	 							<c:param name="condition" value="${condition}"/>
	 							<c:param name="keyword" value="${keyword}"/>
	 						</c:url>
                	<c:choose>
                		<c:when test="${ pi.currentPage ne 1 }">
                			<li class="page-item"><a class="page-link" href="list.ho?currentPage=${ pi.currentPage-1 }">이전</a></li>
                		</c:when>
                		<c:otherwise>
                			<li class="page-item disabled"><a class="page-link" href="">이전</a></li>
                		</c:otherwise>
                	</c:choose>
                	
                    <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
                    	<c:choose>
	                		<c:when test="${ pi.currentPage ne p }">
                    			<li class="page-item"><a class="page-link" href="list.ho?currentPage=${ p }">${ p }</a></li>
	                		</c:when>
	                		<c:otherwise>
	                			<li class="page-item disabled"><a class="page-link" href="">${ p }</a></li>
	                		</c:otherwise>
	                	</c:choose>
                    </c:forEach>
                    
                    
                    <c:choose>
                		<c:when test="${ pi.currentPage ne pi.maxPage }">
                			<li class="page-item"><a class="page-link" href="list.ho?currentPage=${ pi.currentPage+1 }">다음</a></li>
                		</c:when>
                		<c:otherwise>
                			<li class="page-item disabled"><a class="page-link" href="list.ho?currentPage=${ pi.currentPage+1 }">다음</a></li>
                		</c:otherwise>
                	</c:choose>
                </ul>
            </div>
           
            
            <br><br>
   
    		</div>
                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

        </div>
        <!-- End of Content Wrapper -->
	
      <script>
    	$(function(){
    		$("#housingList tbody tr").click(function(){
    			location.href="detailf.ho?hno=" + $(this).children().eq(0).text();
    		});
    	});
    </script>	
    <!-- End of Page Wrapper -->
		<jsp:include page="housingSideBar2.jsp"/>

  
</div>
	
   
	
	
    

</body>

	  <jsp:include page="../common/footer.jsp"/>
</html>