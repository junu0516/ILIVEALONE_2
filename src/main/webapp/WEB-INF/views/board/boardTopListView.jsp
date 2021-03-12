<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
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
        padding: 15px;
      }
      .row.content {height:auto;} 
    }
  </style>
</head>
<body>


  
<div class="container-fluid text-center">    
  <div class="row content">
    <div class="col-sm-2 sidenav">
      <p><a href="#">Home</a></p>
      <p><a href="list.bo">패션 게시물</a></p>
      <p><a href="enrollForm.bo">패션 최신뉴스</a></p>
      <p><a href="#">공지사항</a></p>
    </div>
    <div class="col-sm-8 text-left"> 
      <h1>패션 이야기</h1>
      <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
      <a class="btn btn-secondary" style="float:right" href="list.bo">목록</a>
      <hr>
      <h1>너는 어떻게 입니?</h1>
      <p>Lorem ipsum...</p>
      <a class="btn btn-secondary" style="float:right" href="blist.bo">목록</a>
      <hr>
      <h1>공지사항</h1>
      <p>우리들이 지켜야 할 수칙</p>
      <a class="btn btn-secondary" style="float:right" href="#">목록</a>
    </div>
    <div class="col-sm-2 sidenav">
      <div class="well">
        <p>오늘의 패션 (남자)</p>
      </div>
      <div class="well">
        <p>오늘의 패션 (여자)</p>
      </div>
    </div>
  </div>
</div>



</body>
</html>
