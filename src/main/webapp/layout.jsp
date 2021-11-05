<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
		<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="css/myhome.css">
	<title>[ Share, ] </title>
	</head>
	<body>
		<div class="container-fluid">
			<div class="row header"> <%-- row에 css 적용시킨거 --%>
				<div class="col-sm-8 offset-sm-2" align="right">
				
				<c:import url="header.jsp"></c:import>
				</div>
			</div>	
			<%-- 상단부 헤더 row div --%>
			<%-- 메인화면 --%>
			<div class="row">
				<div class="col-sm-8 offset-sm-2" align="center"> <%-- 건너뜀 --%>
				<%-- 컨트롤러에서 request에 할당한 url을 이용해 import 한다 --%>
				<c:import url="${requestScope.url}"/>	
				<%-- <c:import url="board/write.jsp"></c:import> --%>
				</div>
			</div>
			<%-- 메인화면 row div --%>
		</div>
		<%-- container div --%>
	</body>
</html>

















