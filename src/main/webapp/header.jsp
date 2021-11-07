<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:choose>
	<c:when test="${sessionScope.mvo == null}">
		<a href="HouseListController.do">홈</a><br><br>
 		<form method="post" action="LoginController.do">
		 	<input type="text" name="id" placeholder="아이디" size="12">
		 	<input type="password" name="password" placeholder="비밀번호" size="12">
		 	<button type="submit">로그인</button>
    	</form>
    	<br>
    	<a href = "RegisterMemberFormController.do">회원가입</a>
 	</c:when>
 	<c:otherwise>
 		<%-- 로그인됏을 경우 --%>
 		<a href="HouseListController.do">홈</a><br><br>
	 	<a href = "UpdateMemberFormController.do">회원정보수정</a> &nbsp;
	 	${sessionScope.mvo.name } 님&nbsp;
		<c:if test="${sessionScope.mvo.status eq 'HOST'}">
	 		<a href="RegisterHouseFormController.do?mid=${sessionScope.mvo.id }" >집등록하기</a>	 	
	 	</c:if>
	 	<script>
	 		function logout(){
	 			let result=confirm("로그아웃하시겠습니까?");
	 			if(result){
	 			document.getElementById("logoutForm").submit();
	 			}
	 		}
	 	</script> 	
	 	<a href="javascript:logout()">로그아웃</a>&nbsp;&nbsp;
	 	<form action="LogoutController.do" method="post" id="logoutForm"></form>
 	</c:otherwise>
</c:choose>