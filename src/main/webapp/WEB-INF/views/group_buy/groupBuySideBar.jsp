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
	<title>공동구매 리스트</title>
</head>

<body id="page-top">	
        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="list.gb">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-laugh-wink"></i>
                </div>
                <div class="sidebar-brand-text mx-3">공동구매</div>
            </a>
            
            <!-- Divider -->
            <hr class="sidebar-divider my-0">
            <!-- Nav Item - Dashboard -->
            <li class="nav-item">
                <a class="nav-link" href="list.gb">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>판매중인 물품 보기</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="purchaseHistory.gb">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>구매내역 조회</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="salesHistory.gb">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>판매 관리하기</span></a>
            </li>
        </ul>
        <!-- End of Sidebar -->

</body>
</html>