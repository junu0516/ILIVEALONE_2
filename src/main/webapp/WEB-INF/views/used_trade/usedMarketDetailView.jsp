<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
img {
  width: 550px;
  height: 550px;
  object-fit: none;
}
</style>
</head>
<body>
	  <jsp:include page="../common/header.jsp"/>
	

<div class="content">
        <br><br>
        <div class="innerOuter">
            <h2>게시글 상세보기</h2>
            <br>
            <hr>
            
            <br><br>
            <table id="contentArea" align="center" class="table">
                <tr>
                    <th width="100">제목</th>
                    <td colspan="3">${ u.um_Title }</td>
                </tr>
                <tr>
                    <th>작성자</th>
                    <td>${ u.um_Writer }</td>
                    
                </tr>
                <tr>
                	<th>가격</th>
                    <td>${ u.um_Price } <b>원</b></td>
                </tr>
                <tr>
                    <th>첨부파일</th>
                    <td colspan="3">
                    	<c:if test="${ !empty u.originName }">
                        	<a href="${ pageContext.servletContext.contextPath }./resources/upload_files/${u.changeName}" download="${ u.originName }">${ u.originName }</a>
                        </c:if>
                        <c:if test="${ empty u.originName }">
                        	첨부파일이 없습니다.
                        </c:if>
                    </td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td colspan="3"></td>
                </tr>
                <tr>
                <img src="./resources/upload_file/${u.changeName }" class="card-img-top"  >
                </tr>
                <tr>
                    <td colspan="4"><p style="height:150px">${ u.um_Content }</p></td>
                </tr>
            </table>
            <br>
	
		
            <br><br>

     
        </div>
        <br><br>
    </div>
   
   


	  <jsp:include page="../common/footer.jsp"/>

</body>
</html>