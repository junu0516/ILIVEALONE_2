<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>


</head>
<body>
	  <jsp:include page="../common/header.jsp"/>
	

	    <div class="card shadow mb-4"  >
                  <div class="card-header py-3" align="center">
   
    		<h2>판매글 수정하기</h2>

                   </div>                      
                    
                  <div class="card-body">
               
                
				
                    <form id="updateForm" method="post" action="update.um" enctype="multipart/form-data">
                <table align="center">
                    <input type="hidden" name="um_No" value="${ u.um_No }">
                
                    <tr>
                        <th><label for="title">제목</label></th>
                        <td><input type="text" id="title" class="form-control" name="um_Title" required value="${u.um_Title }"></td>
                    </tr>
                    <tr>
                        <th><label for="writer">작성자</label></th>
                        <td><input type="text" id="writer" class="form-control"   name="um_Writer" value="${u.um_Writer }"></td>
                    </tr>
                    <tr> 
                        <th><label for="price">가격</label></th>
                        <td><input type="text" id="price" class="form-control-file border" name="um_Price" placeholder="원" value="${u.um_Price }"></td>
                    </tr>
                            
                     <input type="hidden" id="categoryVal" value=${u.um_Category}>
                     <input type="hidden" id="systemVal" value=${u.um_System}>
              
              
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
                    
            
                    <tr> 
                        <th><label for="system">거래방식</label></th>
                             <td><div class="container">
									
									<select class="form-control" id="system" name="um_System">
									  <option>=== 거래방식을 선택하세요 ===</option>
									  <option id="direct" value="직거래">직거래</option>
									  <option id="delivery" value="택배거래">택배거래</option>
									
									</select>
								</div></td>
                    </tr>
                    
     
                   <tr>
                        <th><label for="upfile">첨부파일</label></th>
                        <td>
                            <input type="file" id="upfile" class="form-control-file border" name="reUploadFile">
                            <c:if test="${ !empty u.originName }">
	                                                               현재 업로드된 파일 : ${ u.originName } <br>
	                            <input type="hidden" name="changeName" value="${ u.changeName }">
	                            <input type="hidden" name="originName" value="${ u.originName }">
                            </c:if>
                        </td>
                    </tr>
                    <tr>
                        <th colspan="2"><label for="um_Content">내용</label></th>
                    </tr>
                    <tr>
                        <th colspan="2"><textarea class="form-control" required name="um_Content" id="um_Content" rows="10" style="resize:none;" >${ u.um_Content}</textarea></th>
                    </tr>
                </table>
                
            
            
                <br>

                <div align="center">
                    <button type="submit" class="btn btn-primary">수정하기</button>
                    <button type="reset" class="btn btn-danger">취소하기</button>
                    
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
                    categoryOption();
					function categoryOption(){
						var wear = $("#wear");
						var electronics = $("#electronics");
						var living = $("#living");
						var select =document.getElementById("categoryVal").value;
						console.log("categoryVal : "+ select);
						
						if(select == "의류"){
							wear.attr("selected" ,true);
						}else if(select == "전자제품"){
							electronics.attr("selected" ,true);
						}else if(select == "생활용품"){
							select.attr("selected",true);
						}
						
					}
					systemOption();
					
					function systemOption(){
						var direct = $("#direct");
						var delivery = $("#delivery");
						
						var select =document.getElementById("systemVal").value;
						console.log("systemVal : "+ select);
						
						if(select == "직거래"){
							direct.attr("selected" ,true);
						}else if(select == "택배거래"){
							delivery.attr("selected" ,true);
						}
						
					}
					
					
				</script>
   			
 		  <jsp:include page="../common/footer.jsp"/>
 	
</body>
</html>