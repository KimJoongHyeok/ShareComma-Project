<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<meta name="author" content="ThemeStarz">
		<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700|Varela+Round" rel="stylesheet">
		<link rel="stylesheet" href="assets/bootstrap/css/bootstrap.css" type="text/css">
		<link rel="stylesheet" href="assets/fonts/font-awesome.css" type="text/css">
		<link rel="stylesheet" href="assets/css/selectize.css" type="text/css">
		<link rel="stylesheet" href="assets/css/style.css">
		<link rel="stylesheet" href="assets/css/user.css">
	<title>[ Share, ] </title>
	</head>
	<body>
		<div class="container-fluid">
<%-- 			<div class="row header"> row에 css 적용시킨거
				<div class="col-sm-8 offset-sm-2" align="right"> --%>
					<c:import url="header.jsp"></c:import>
<!-- 				</div>
			</div>	 -->
			<%-- 상단부 헤더 row div --%>
			<%-- 메인화면 --%>
			<div class="row">
				<div class="col-sm-8 offset-sm-2"> <%-- 건너뜀 --%>
					<%-- 컨트롤러에서 request에 할당한 url을 이용해 import 한다 --%>
					<c:import url="${requestScope.url}"/>	
				</div>
			</div>
			<%-- 메인화면 row div --%>
		</div>
		<%-- container div --%>
	</body>
</html>

















