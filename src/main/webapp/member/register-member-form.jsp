<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<form action="RegisterMemberController.do" method="post">

	아이디 :	 <input type="text" name="id" id = "id" placeholder="아이디"required="required">
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
 --%>
 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<section class="content">
	<section class="block">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-xl-4 col-lg-5 col-md-6 col-sm-8">
					<form class="form clearfix" action = "RegisterMemberController.do" method = "post">
						<div class="form-group">
							<label for="id" class="col-form-label required">Your Id</label>
							<input name="id" type="text" class="form-control" id="id" placeholder="아이디" required>
							<br>
				     		<label><span id="idcheckView">* 중복확인버튼을 눌러주세요 *</span></label>
				     		<input type="button" class = "btn btn-primary" value ="중복확인" id = "idcheckBtn"  onclick="idCheckAjax()"> 				     		
						</div>
						<div class="form-group">
							<label for="password" class="col-form-label required">Password</label>
							<input name="password" type="password" class="form-control" id="password" placeholder="패스워드" required>
						</div>
						<!--end form-group-->
						<div class="form-group">
							<label for="name" class="col-form-label required">Your Name</label>
							<input name="name" type="text" class="form-control" id="name" placeholder="이름" required>
						</div>
						<!--end form-group-->
						<div class="form-group">
							<label for="phone" class="col-form-label required">Your phone</label> 
							<input name="phone" type="text" class="form-control" id="phone" placeholder="전화번호" required>
						</div>
						<!--end form-group-->
						<div class="form-group">
							<label for="nick" class="col-form-label required">Your nick</label> 
							<input name="nick" type="text" class="form-control" id="nick" placeholder="닉네임" required>
						</div>
						<!--end form-group-->

						<div class="d-flex justify-content-between align-items-baseline">
							<label for="nick" class="col-form-label required">Your status</label>
							<input type="radio" name="status" value="MEMBER">회원 
							<input type="radio" name="status" value="HOST"> 호스트
						</div>
						<br>
						<button type="submit" class="btn btn-primary btn-block">가입하기</button>
						<br>
					</form>
					<hr>
				</div>
				<!--end col-md-6-->
			</div>
			<!--end row-->
		</div>
		<!--end container-->
	</section>
	<!--end block-->
</section>
<!--end content-->
<script type="text/javascript">
	//IdcheckController.do
	function idCheckAjax() {
		let id = document.getElementById("id").value;
		if (id == "") {
			alert("아이디를 입력하세요");
			return;
		}
		let xhr = new XMLHttpRequest();//Ajax 객체 생성
		xhr.onload = function() {
			document.getElementById("idcheckView").innerHTML = xhr.responseText;
		}
		xhr.open("post", "IdCheckController.do");
		xhr.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded");
		xhr.send("id=" + id);
	}
</script>
 