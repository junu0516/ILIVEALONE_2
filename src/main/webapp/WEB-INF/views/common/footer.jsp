<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    /* div{border:1px solid red;} */
    #footer{
        width:50%;
        height:170px;
        margin:auto;
        margin-top:50px;
    }
    #footer-1{
        width:100%;
        height:20%;
        border-top:1px solid lightgray;
        border-bottom:1px solid lightgray;
    }
    #footer-2{
        width:100%;
        height:80%;
    }
    #footer-1, #footer-2{
        padding-left:50px
    }

    #footer-1 > a{
        text-decoration:none;
        font-weight: 600;
        margin:10px;
        line-height: 40px;
        color: white;
        text-align:center;
    }
    #footer-2>p{
        margin: 0;
        padding:10px;
        font-size: 13px;
    	color: white;
    }
    #p2{
        text-align:center;
    }
</style>
</head>

<body>


     <!-- Footer-->
       <footer class="py-5 bg-dark">
            <div id="footer">
        <div id="footer-1" >
            <a href="#">이용약관</a> | 
            <a href="#">개인정보취급방침</a> | 
            <a href="list.no">공지사항</a> | 
            <a href="#">고객센터</a> 
        </div>

        <div id="footer-2">    
            <p id="p2">Copyright ⓒ 2021 ILIVEALONE BY LEE, NAM, KWON, YUN, BAE</p>     
        </div>
    </div>
    </footer>
        <!-- Copyright Section
        <div class="copyright py-4 text-center text-white">
            <div class="container">           
	        <small><a href="list.no">이용약관</a></small>
            <small><a href="list.no">개인정보처리방침</a></small>
            <small><a href="list.no">공지사항</a></small>
            <small><a href="list.no">문의하기</a></small>
            <small>©ILIVEALONE</small>
        </div>
        </div>
  </footer>
  -->


</body>
</html>