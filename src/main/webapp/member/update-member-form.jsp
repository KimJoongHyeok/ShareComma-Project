<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script>
</head>
<body>
	
<script type="text/javascript">
	
	function deleteMember(){
		if(confirm("탈퇴하시겠습니까?")){
			document.getElementById("deleteForm").submit();
		}
	}
	function updateMember(){
		if(confirm("회원정보를 수정하시겠습니까?")){
			document.getElementById("updateForm").submit();
		}
	}
	function becomeHost(){
		if(confirm("호스트로 전환하시겠습니까?")){
			document.getElementById("becomeHostForm").submit();
		}
	}
	
</script>

<form action="UpdaterMemberController.do" method="post" id = "updateForm">
	아이디 : <input type="text" name="id" value="${sessionScope.mvo.id}" readonly="readonly"><br><br>
	비밀번호 : <input type="password" name="password" value = "${sessionScope.mvo.password }" required="required"><br><br>
	이름 : <input type=text name="name" value = "${sessionScope.mvo.name }" required="required"><br><br>
	전화번호 : <input type="text" name="phone" value = "${sessionScope.mvo.phone }" required="required"><br><br>
	닉네임 : <input type="text" name="nick" value = "${sessionScope.mvo.nickName }" required="required"><br><br>
	회원상태 : <input type="text" name="status" value = "${sessionScope.mvo.status }" required="required" readonly="readonly"><br><br>
</form>

<form action = "DeleteMemberController.do" method = "post" id = "deleteForm">
	<input type = "hidden" name = "id" value = "${mvo.id} ">
</form>
<form action = "BecomeHostController.do" method = "post" id = "becomeHostForm">
	<input type = "hidden" name = "id" value = "${sessionScope.mvo.id }">
</form>

<button type = "button" onclick = "updateMember()">수정하기</button>
<button type = "button" onclick = "deleteMember()">회원탈퇴</button>&ensp;
<c:choose>
	<c:when test = "${sessionScope.mvo.status !='HOST' }">
		<button type = "button" onclick = "becomeHost()">호스트계정으로 전환하기</button>
	</c:when>
</c:choose>
 




