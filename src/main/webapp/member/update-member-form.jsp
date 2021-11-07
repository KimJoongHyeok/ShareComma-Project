<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<button type = "button" onclick = "updateMember()">수정하기</button>
<button type = "button" onclick = "deleteMember()">회원탈퇴</button>






