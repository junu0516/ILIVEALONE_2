<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</style>
<script src="http://code.jquery.com/jquery-3.3.1.js"></script>
</head>
<body>

    <div class="content">
        <br><br>
        <div class="innerOuter">
            <h2>매물 등록하기</h2>
            <br>
			
			<!-- 첨부파일도 등록할꺼니깐 Multipart/form-data encType 지정!! -->
            <form id="enrollForm" method="post" action="insert.re" enctype="multipart/form-data">
                  <table id="contentArea" align="center" class="table">
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
                    <button type="submit">등록하기</button>
                    <button type="reset">취소하기</button>
                </div>
            </form>
        </div>
        <br><br>
    </div>

<script>
$(function() {

            $('#setype').change(function() {
            		
            	$('#money').empty();

                if (this.value == "월세") {
                    $('#money').append($('<input/>', {type: 'text', name: 'money1', placeholder : '월세 ex)50' }));
                    $('#money').append($('<input/>', {type: 'text', name: 'money2', placeholder :'보증금 ex)1000' }));
                } else if (this.value == "전세") {
                    $('#money').append($('<input/>', {type: 'text', name: 'money1', placeholder:'전세금 ex)1억 5000' }));
                    $('#money').append($('<input/>', {type: 'hidden', name: 'money2', value:'null' }));

                }

            });

        });
</script>
</body>
</html>