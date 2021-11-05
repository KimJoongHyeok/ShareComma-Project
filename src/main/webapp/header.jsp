<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:choose>
	<c:when test="${sessionScope.mvo==null}">
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
	 	
 	</c:otherwise>
</c:choose>