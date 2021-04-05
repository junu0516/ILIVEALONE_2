<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<style>


#big_div{

position: relative;
	top:50px;
	color:black;
}

</style>
</head>
<body>

	  <jsp:include page="../common/header.jsp"/>
		<script src="//cdn.ckeditor.com/4.16.0/standard/ckeditor.js"></script>
	

	    <div class="card shadow mb-4" id="big_div" >
                  <div class="card-header py-3" align="center">
   
    		<h2>판매글 작성하기</h2>

                   </div>                      
                    
                  <div class="card-body">
               
                  
                    <form id="enrollForm" method="post" action="insert.um" enctype="multipart/form-data">
                <table align="center">
                    <tr>
                        <th><label for="title">제목</label></th>
                        <td><input type="text" id="title" class="form-control" name="um_Title" required></td>
                    </tr>
                    
                    <td> <br> </td>
                    
                    <tr>
                        <th><label for="writer">작성자</label></th>
                        <td><input type="text" id="writer" class="form-control"   name="um_Writer" value="${loginUser.userName}" readonly></td>
                    </tr>
                    
                    <td> <br> </td>
                    
                    <tr> 
                        <th><label for="price">가격</label></th>
                        <td><input type="text" id="price" class="form-control-file border" name="um_Price" placeholder="원"></td>
                    </tr>
                    
                     <td> <br> </td>
                    
                    <tr> 
                        <th><label for="category">상품종류</label></th>
                        <td><div class="container">
									
									<select class="form-control" id="category" name="um_Category">
									  <option>=== 상품종류를 선택하세요 ===</option>
									  <option value="의류">의류</option>
									  <option value="전자제품">전자제품</option>
									  <option value="생활용품">생활용품</option>
									  <option  value ="도서">도서</option>
									  <option  value ="식품">식품</option>
									  <option  value ="가구">가구</option>
									
									</select>
								</div></td>
                    </tr>
                    
                     <td> <br> </td>
                     
                    <tr> 
                        <th><label for="system">거래방식</label></th>
                             <td><div class="container">
									
									<select class="form-control" id="system" name="um_System">
									  <option>=== 거래방식을 선택하세요 ===</option>
									  <option value="직거래">직거래</option>
									  <option value="택배거래">택배거래</option>
									
									</select>
								</div></td>
                    </tr>
                    
                     <td> <br> </td>
                    
                    
                    <tr>
                        <th><label for="upfile">이미지</label></th>
                        <td><input type="file" id="upfile" class="form-control-file border" name="uploadFile"></td>
                    </tr>
                    
                     <td> <br> </td>
                     
                     
                    <tr>
                        <th colspan="2"><label for="um_Content">내용</label></th>
                    </tr>
                    
                     <td> <br> </td>
                     
                     
                    <tr>
                        <th colspan="2"><textarea class="form-control" required name="um_Content" id="um_Content" rows="10" style="resize:none;"></textarea></th>
                    </tr>
                    
                     <td> <br> </td>
                     
                </table>
                
            
            
                <br>

                <div align="center">
                    <button type="submit" class="btn btn-primary">등록하기</button>
                    <button type="reset" class="btn btn-danger">초기화</button>
                </div>
                
                
            </form>




               </div>
                  <br>
                  <br>
                  <br>
                  <br>
                  <br>
                  <br>
                  <br>
                  <br>
                  <br>
                  <br>
                  <br>
                  <br>
                  <br>
                  <br>
                  <br>
                  
                  
          
        
                       
			 <!-- card-body end -->
           </div>
   			<!-- card end -->
   			
	<script>
    	CKEDITOR.replace('um_Content',{
        	height: 500,
           	filebrowserUploadUrl: '${pageContext.request.contextPath}/ckeditor/upload.ck?function=4'
        });	
    </script>
   			
 		  <jsp:include page="../common/footer.jsp"/>
 	
</body>
</html>