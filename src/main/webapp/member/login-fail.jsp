<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>login-fail</title>
	</head>
	<body>
		<script type="text/javascript">
			alert("로그인되지 않았습니다. 아이디와 패스워드를 확인하세요.");
			//location.href = "../ListController.do"; //home으로 보낸다	../를 한 이유는 member디렉토리 상위로 가야하기 떄문에
			location.href = "${pageContext.request.contextPath}/HouseListController.do"; //디렉토리가 복잡할 경우 위의 케이스보다 쉬움
			//${pageContext.request.contextPath} 를 body 부분에 출력해보면 웹어플리케이션명(컨텍스트path)를 가지고온다
		</script>
	</body>
</html>