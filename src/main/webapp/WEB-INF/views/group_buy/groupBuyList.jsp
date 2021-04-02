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

    <title>부동산</title>

    <!-- Custom fonts for this template -->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

</head>

<body id="page-top">
	<jsp:include page="../common/header.jsp"/>
	<!-- 바디 부분 -->
    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-laugh-wink"></i>
                </div>
                <div class="sidebar-brand-text mx-3">부동산</div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item">
                <a class="nav-link" href="index.html">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>Dashboard</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                Interface
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
                    aria-expanded="true" aria-controls="collapseTwo">
                    <i class="fas fa-fw fa-cog"></i>
                    <span>Components</span>
                </a>
                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Custom Components:</h6>
                        <a class="collapse-item" href="buttons.html">Buttons</a>
                        <a class="collapse-item" href="cards.html">Cards</a>
                    </div>
                </div>
            </li>
        </ul>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

               

                <!-- Begin Page Content -->
                <div class="container-fluid">

        <c:if test="${!empty sessionScope.loginUser }">
            <div class="container">
                <a href="insertView.gb" class="btn btn-primary">판매 등록</a>
            </div>
        </c:if>
        <br><br><br>
        <a href="salesHistory.gb">판매내역 조회하기</a>
        <a href="purchaseHistory.gb">구매내역 조회하기</a>
        <div class="container">
            <form class="form-inline" action="search.gb">
                <select class="form-control mb-2 mr-sm-2" name="condition">
                    <option value="title">제목</option>
                    <option value="product">제품</option>
                </select>
                <input type="text" class="form-control mb-2 mr-sm-2" name="keyword" id="keyword" placeholder="검색어 입력"/>
                <button type="submit" class="btn btn-primary mb-2">검색</button>
            </form>
        </div>
        <div class="container-fluid" id="cardArea">
            <c:forEach items="${list}" var="gbBoard">
                <div class="card">
                    <div class="card-header">
                        <h5>
                            <b>${gbBoard.gbTitle}</b>
                        </h5>
                    </div>
                    <div>
                        <img class="card-img-top" src="${pageContext.request.contextPath}/resources/images/group_buy/${gbBoard.gbChangedName}" height="400px"/>
                    </div>
                    <div class="card-body">
                        <h4 class="card-title">${products[gbBoard.gbNo].PName}</h4>
                        <p class="card-text">${products[gbBoard.gbNo].PLimit}명 도달시 종료</p>
                        <p class="card-text">${products[gbBoard.gbNo].PPrice} 원</p>
                        <a href="detail.gb?gbNo=${gbBoard.gbNo}" class="btn btn-primary">상세 보기</a>
                    </div>
                </div>
            </c:forEach>
        </div>
        <br><br>
        <ul class="pagination">
            <c:url var="searchUrl" value="search.gb">
                <c:param name="condition" value="${condition}"/>
                <c:param name="keyword" value="${keyword}"/>
            </c:url>
            <c:choose>
                <c:when test="${pageInfo.currentPage ne 1}">
                    <c:if test="${empty keyword}">
                        <li class="page-item">
                            <a class="page-link" href="list.gb?currentPage=${pageInfo.currentPage-1}">Previous</a>
                        </li>
                    </c:if>
                    <c:if test="${!empty keyword}">
                        <li class="page-item">
                            <a class="page-link" href="${searchUrl}&currentPage=${pageInfo.currentPage-1}">Previous</a>
                        </li>
                    </c:if>
                </c:when>
                <c:otherwise>
                    <li class="page-item disabled">
                        <a class="page-link" href="">Previous</a>
                    </li>
                </c:otherwise>
            </c:choose>
            <c:forEach begin="${pageInfo.startPage}" end="${pageInfo.endPage}" var="p">
                <c:choose>
                    <c:when test="${pageInfo.currentPage ne p}">
                        <c:if test="${empty keyword}">
                            <li class="page-item">
                                <a class="page-link" href="list.gb?currentPage=${p}">${p}</a>
                            </li>
                        </c:if>
                        <c:if test="${!empty keyword}">
                            <li class="page-item">
                                <a class="page-link" href="${searchUrl}&currentPage=${p}">${p}</a>
                            </li>
                        </c:if>
                    </c:when>
                    <c:otherwise>
                        <li class="page-item disabled">
                            <a class="page-link" href="">${p}</a>
                        </li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
            <c:choose>
                <c:when test="${pageInfo.currentPage ne pageInfo.maxPage}">
                    <c:if test="${empty keyword}">
                        <li class="page-item">
                            <a class="page-link" href="list.gb?currentPage=${pageInfo.currentPage+1}">Next</a>
                        </li>
                    </c:if>
                    <c:if test="${!empty keyword}">
                        <li class="page-item">
                            <a class="page-link" href="${searchUrl}&currentPage=${pageInfo.currentPage+1}">Next</a>
                        </li>
                    </c:if>
                </c:when>
                <c:otherwise>
                    <li class="page-item disabled">
                        <a class="page-link" href="list.gb?currentPage=${pageInfo.currentPage+1}">Next</a>
                    </li>
                </c:otherwise>
            </c:choose>
        </ul>

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="login.html">Logout</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="js/demo/datatables-demo.js"></script>

</body>

</html>