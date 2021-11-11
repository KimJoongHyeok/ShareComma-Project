 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<script type="text/javascript">
	//IdcheckController.do
	function idCheckAjax() {
		let id = document.getElementById("id").value;
		if (id == "") {
			alert("아이디를 입력하세요");
			return;
		}
		let xhr = new XMLHttpRequest();//Ajax 객체 생성
		//let isCheck = ${requestScope.isCheck};
		xhr.onload = function() {
			document.getElementById("idcheckView").innerHTML = xhr.responseText;
			
	
			if(xhr.responseText=="사용가능한 아이디입니다."){
				document.getElementById("flag").value = document.getElementById("id").value ; 
			}else if(xhr.responseText=="아이디가 중복됨!"){
				document.getElementById("id").value="";
				document.getElementById("id").focus();
				document.getElementById("flag").value="";
			}
			
		}
		xhr.open("post", "IdCheckController.do");
		xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		xhr.send("id=" + id);
	}
	
	// 아이디 중복확인하지 않은 상태에서 가입하기를 누르면 아이디 중복확인하세요 alert 후 전송시키지 않는다 
	function checkForm(){
		if(document.getElementById("id").value!=document.getElementById("flag").value){
			alert("아이디 중복확인하세요");
			return false;
		}		
	}
</script>
 

<section class="content">
	<section class="block">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-xl-4 col-lg-5 col-md-6 col-sm-8">
					<form class="form clearfix" action = "RegisterMemberController.do" method = "post" onsubmit="return checkForm()">
						<div class="form-group">
						    <input type="hidden" id="flag" value="">
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
