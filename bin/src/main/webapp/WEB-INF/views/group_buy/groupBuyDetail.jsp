<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>상세보기</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
    <style>

        thead>tr>th{
            text-align: center;
        }
        
        #purchaseForm{
        	display:none;
        }
        
    </style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
    <br>
    
    <div class="container">
        <h1 class="display-5">상세보기</h1><br>
        <input type="hidden" name="gbMno" value="${gbBoard.gbMno}"/>
        <table class="table" id="detail-table">
            <thead>
              <tr>
                <th colspan="2" id="head">${gbBoard.gbTitle}</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <th>등록일 : ${gbBoard.gbDate}</th>
                <th>조회수 : ${gbBoard.gbCount}</th>
              </tr>
              <tr>
              	<c:if test="${gbProduct.PStatus eq 'N'}">
              	<th>현재 구매가 불가한 상품입니다.</th>
              	</c:if>
              	<c:if test="${gbProduct.PStatus eq 'Y'}">
                <th>달성률 : 현재까지 ${gbProduct.PPurchase} / ${gbProduct.PLimit}명이 구매를 신청했습니다.</th>
                </c:if>
                <th>가격 : ${gbProduct.PPrice} 원</th>
              </tr>
              <tr>
                <td colspan="2">
                 	${gbBoard.gbContent}
                </td>
              </tr>
            </tbody>
          </table>
          <c:if test="${gbBoard.gbMno eq sessionScope.loginUser.userId}">
          	<c:if test="${gbProduct.PStatus eq 'Y'}">
	        <a href="updateForm.gb?gbNo=${gbBoard.gbNo}" class="btn btn-primary">수정하기</a>	
          	</c:if>
          <button type="button" class="btn btn-danger" onclick="deleteBoard();">삭제하기</button>
          </c:if>
          <c:if test="${gbBoard.gbMno ne sessionScope.loginUser.userId }">
          <button type="button" onclick="checkPurchase();" class="btn btn-primary" id="purchase">구매하기</button>
          <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#cart" >장바구니</button>
          </c:if>
          <a href="list.gb" class="btn btn-secondary">목록으로</a>
          
          <script>
          	function checkPurchase(){
          		if(${empty sessionScope.loginUser}){
              		alert("로그인하세요");          			
          		}else{
          			alert("구매 진행");
          			location.href="purchaseForm.gb?phCno=${gbBoard.gbNo}&phProduct=${gbProduct.PNo}"
          			
          		}
          	}
          
          	function deleteBoard(){
          		if(confirm("정말 삭제하시겠습니까?")){
          			location.href="delete.gb?gbNo=${gbBoard.gbNo}";
          		}else{
          			console.log("취소");
          		}
          	}
          	
          	$(function(){
          		console.log('현재인원 : '+"${gbProduct.PPurchase}")
          		console.log('제한인원 : '+"${gbProduct.PLimit}");
          
          		if(${gbProduct.PPurchase} >= ${gbProduct.PLimit}){
          			$("#purchase").attr("disabled",true);
          		} 		
          	})
          </script>
    </div>

    <!--장바구니 모달-->
    <div class="modal" id="cart">
      <div class="modal-dialog">
        <div class="modal-content">
          
          <div class="modal-header">
            <h4 class="modal-title">장바구니</h4>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
          </div>

          <div class="modal-body">
            <table class="table">
              <thead class="thead-light">
                <tr>
                  <th>NO</th>
                  <th>제품명</th>
                  <th>수량</th>
                  <th>가격</th>
                  <th>선택</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>01</td>
                  <td>두루마리 휴지</td>
                  <td>5</td>
                  <td>5000</td>
                  <td>
                    <input type="checkbox" class="form-check-input" value=""/>
                  </td>
                </tr>

                <tr>
                  <td>02</td>
                  <td>머그컵</td>
                  <td>1</td>
                  <td>2000</td>
                  <td>
                    <input type="checkbox" class="form-check-input" value=""/>
                  </td>
                </tr>

                <tr>
                  <td>03</td>
                  <td>라면</td>
                  <td>3</td>
                  <td>1000</td>
                  <td>
                    <input type="checkbox" class="form-check-input" value=""/>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>

          <div class="modal-footer">
            <a href="#" class="btn btn-primary">구매하기</a>
            <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
          </div>

        </div>
      </div>
    </div>

  </body>
</html>