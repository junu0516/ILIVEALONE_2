<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"/>
<title>부동산</title>
<style>
html,body{width:100%;height:100%}
body,p,h1,h2h3,h4,h5,h6,ul,ol,li,dl,dt,dd,table,th,td,form,fieldset,legend,input,textarea,button,select{margin:0;padding:0}
img,filedset{border:0;}
ul,ol{list-style:none;}
em,address{font-style:normal;}
a{text-decoration:none;}
a:hover, a:active,a:focus{text-decoration;underline;}
.b{
padding:10px;
}
#list{
overflow-y:auto; 
}
strong{
word-break : nowrap;
}
</style>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
</head>
<body>

		<jsp:include page="../common/header.jsp"/>
		
		<br><br>
	
	<div class="container" style="height:1000px">
	
	<jsp:include page="search.jsp" />
	<br><br><br>

	<jsp:include page="realMap.jsp"/>
	<jsp:include page="realList.jsp"/>
	
	</div>
    
	  <jsp:include page="../common/footer.jsp"/>

</body>
</html>