<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
 	#enrollForm>table{width:100%;}
    #enrollForm>table *{ margin:5px;}
    .content{
        background-color:rgb(247, 245, 245);
        width:80%;
        margin:auto;
    }
    .innerOuter{
        border:1px solid lightgray;
        width:80%;
        margin:auto;
        padding:5% 10%;
        background:white;
    }
    #page-top{
padding-top:13px;
}
</style>
	
</head>

<body id="page-top">

<jsp:include page="../common/header.jsp"/>

		
		<br><br>
		
		<!-- 바디 부분 -->
	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<ul
			class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
			id="accordionSidebar">

			<!-- Sidebar - Brand -->
			<a
				class="sidebar-brand d-flex align-items-center justify-content-center"
				href="list.re">
				<div class="sidebar-brand-icon rotate-n-15">
					<i class="fas fa-laugh-wink"></i>
				</div>
				<div class="sidebar-brand-text mx-3">부동산</div>
			</a>

			<!-- Divider -->
			<hr class="sidebar-divider my-0">

			
<c:if test="${ !empty loginUser }">
			<!-- Nav Item - Dashboard -->
			<li class="nav-item"><a class="nav-link" onclick="postFormSubmit()" style="cursor: pointer">
					<i class="fas fa-fw fa-tachometer-alt"></i> <span>찜한 목록</span>
			</a></li>
			
			<!-- Divider -->
			<hr class="sidebar-divider">

			<li class="nav-item"><a class="nav-link" href='enrollform.re'>
					<i class="fas fa-fw fa-tachometer-alt"></i> <span>매물 등록</span>
			</a></li>
			
			</li>
			
			
</c:if>
		</ul>
		<!-- End of Sidebar -->
		
		
		
		
		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">



				<!-- Begin Page Content -->
				<div class="container-fluid">
		

<div class="container" style="height:1200px">
        <br><br>
        <div class="innerOuter">
            <h2>매물 등록하기</h2>
            <br>
			
			<!-- 이미지 첨부파일 등록을 위해  Multipart/form-data encType 지정 -->
            <form id="enrollForm" method="post" action="insert.re" enctype="multipart/form-data">
                  <input type="hidden" value="${loginUser.userId }">
                  <table id="contentArea" align="center" class="table">
                   <tr>
                    <th width="100">등록자</th>
                   <td><input type="text" id="userId" name="userId" value="${loginUser.userId }" readonly></td>
                </tr>
                <tr>
                    <th width="100">세 종류</th>
                    <td colspan="3">
                    <select name="money_kind" id="setype">
                    	<option value="none">---</option>
						<option value="월세">월세</option>
						<option value="전세">전세</option>
					</select></td>
                </tr>
           
                <tr>
                    <th width="100">면적</th>
                   <td><input type="text" id="area" name="area" placeholder="ex)24.5" required>m²</td>
                </tr>
                <tr>
                    <th width="100">층</th>
                   <td><input type="text" id="floors" name="floors" placeholder="ex)2" required>층</td>
                </tr>
                <tr>
                    <th width="100">위치</th>
                   <td><input type="text" id="location" name="location" placeholder="ex)서울시 강남구 테헤란로 51" required></td>
                </tr>
                <tr>
                    <th width="100">엘리베이터 여부</th>
                    <td colspan="3">
                    <select name="elevator">
						<option value="Y">Y</option>
						<option value="N">N</option>
					</select></td>
                </tr>
                <tr>
                    <th width="100">관리비</th>
                   <td><input type="text" id="admin" name="admin_money" placeholder="8" required></td>
                </tr>
                <tr>
                    <th width="100">구조</th>
                    <td colspan="3">
                    <select name="structure">
						<option value="원룸">원룸</option>
						<option value="투룸" >투룸</option>
						<option value="오피스텔">오피스텔</option>
						<option value="아파트">아파트</option>
					</select></td>
                </tr>
                <tr>
                    <th width="100">전체 증 수</th>
                   <td><input type="text" id="entire_floors" name="entire_floors" placeholder="5" required></td>
                </tr>
                <tr>
                    <th width="100">가격</th>
                   <td id="money">
                   		
                   	</td>
                </tr>
                 <tr>
                    <th width="100">휴대폰 번호</th>
                   <td>
                   		<input type="text" id="phone" name="phone" placeholder="Please Enter Phone (-포함)"><br>
                   	</td>
                </tr>                
                 <tr>
                        <th><label for="upfile">매물 사진</label></th>
                        <td><input type="file" id="upfile" name="uploadFile"></td>
                    </tr>
            </table>
                <br>

                <div align="center">
                    <button type="submit" class="form-control bg-light border">등록하기</button>
                    <button type="reset" class="form-control bg-light border">취소하기</button>
                    <button type="submit" class="form-control bg-light border" style="width:270px">등록하기</button>
                    <button type="reset" class="form-control bg-light border" style="width:270px">취소하기</button>
                </div>
            </form>
        </div>
        <br><br>
    </div>

<script>
$(function() { //전세, 월세 선택 시 각 세 종류에 맞는 가격대 select box 로드

            $('#setype').change(function() {
            		
            	$('#money').empty();

                if (this.value == "월세") {
                    $('#money').append($('<input/>', {type: 'text', name: 'money1', placeholder : '월세 ex)50' }));
                    $('#money').append($('<input/>', {type: 'text', name: 'money2', placeholder :'보증금 ex)1000' }));
                } 
                else if (this.value == "전세") {
                    $('#money').append($('<input/>', {type: 'text', name: 'money1', placeholder:'전세금 ex)1억 5000' }));
                    $('#money').append($('<input/>', {type: 'hidden', name: 'money2', value:'null' }));

                }

            });

        });
</script>

</div>
				<!-- /.container-fluid -->

			</div>
			<!-- End of Main Content -->

		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	
		<form id="postForm" action="wishform.re" method="post"> <!-- 삭제, 수정 시 필요한 매물 번호와 이미지 제목을 위한 form -->
				<input type="hidden" name="userId" value="${loginUser.getUserId() }">
			</form>
				
			<script>
				function postFormSubmit(){
					var postForm = $("#postForm");
				
					postForm.submit();
				}
			</script>
	

 <jsp:include page="../common/footer.jsp"/>
</body>
</html>