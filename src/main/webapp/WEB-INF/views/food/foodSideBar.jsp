<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="">
	<title>게시판 사이드바 </title>
</head>

<body id="page-top">	
        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="list.no">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-laugh-wink"></i>
                </div>
                <div class="sidebar-brand-text mx-3">푸드</div>
            </a>
            
            <!-- Divider -->
            <hr class="sidebar-divider my-0">
            <!-- Nav Item - Dashboard -->
            <li class="nav-item">
                <a class="nav-link" href="Toplistf.fo">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>푸드 메인</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="list.fo">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>푸드 게시물</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="blist.fo">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>푸드 최신뉴스</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="list.no">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>공지사항</span></a>
            </li>
        </ul>
        <!-- End of Sidebar -->

</body>
</html>