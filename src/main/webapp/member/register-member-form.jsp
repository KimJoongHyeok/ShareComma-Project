<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<form action="RegisterMemberController.do" method="post">
	아이디 :	 <input type="text" name="id" id = "id" placeholder="아이디"required="required"   onclick="idCheckAjax()">
					 <input type="button" value ="검색" id = "idcheckBtn"  onclick="idCheckAjax()"> 
					 <!-- <button onclick="idCheckAjax()" type = "button">검색</button> -->
				     <span id="idcheckView"></span><br><br>
	비밀번호 : <input type="password" name="password" placeholder="비밀번호" required="required"><br><br>
	이름 : 		<input type=text name="name" placeholder="이름" required="required"><br><br>
	전화번호 : <input type="text" name="phone" placeholder="전화번호" required="required"><br><br>
	닉네임 : 	<input type="text" name="nick" placeholder="닉네임" required="required"><br><br>
	계정상태 : <input type="radio" name="status" value="MEMBER" checked>회원 
					<input type="radio" name="status" value="HOST"> 호스트 <br><br>
    <button>가입하기</button>
</form>
<script type="text/javascript">
	//IdcheckController.do
		function idCheckAjax(){
		let id = document.getElementById("id").value;
		if(id ==""){
			alert("아이디를 입력하세요");
			return;
		}
		let xhr = new XMLHttpRequest();//Ajax 객체 생성
		xhr.onload = function(){
			document.getElementById("idcheckView").innerHTML =xhr.responseText;
		}
		xhr.open("post","IdCheckController.do");		
		xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	    xhr.send("id="+id);
	}
</script>
