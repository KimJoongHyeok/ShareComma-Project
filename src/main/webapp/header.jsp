<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="page sub-page">
<header class = "hero">
	<div class="hero-wrapper">
		<div class="main-navigation">
			<div class="container">
				<nav class="navbar navbar-expand-lg navbar-light justify-content-between">
					<a class="navbar-brand" href="HouseListController.do"> 
						<img src="assets/img/logo16.png" alt="">
					</a>
					<button class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#navbar" aria-controls="navbar" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse" id="navbar">
						<c:choose>
							<c:when test="${sessionScope.mvo == null}">
								<!--Main navigation list-->
								<ul class="navbar-nav">
									<li class="nav-item active"><a class="nav-link" href="HouseListController.do">홈</a></li>
									<li class="nav-item "><a class="nav-link" href="RegisterMemberFormController.do">회원가입</a></li>
									<li class="nav-item "><a class="nav-link" href="LoginFormController.do"><i class="fa fa-user"></i>&nbsp; 로그인</a></li>
								</ul>
								<!--Main navigation list-->
							</c:when>
								<c:otherwise>
									<!--Main navigation list-->
									<ul class="navbar-nav">
										<li class="nav-item active"><a class="nav-link"
											href="HouseListController.do">홈</a></li>
										<c:if test="${sessionScope.mvo.status eq 'HOST'}">
											<li class="nav-item "><a class="nav-link" href="RegisterHouseFormController.do">숙소등록</a></li>
										</c:if>	
										<li class="nav-item "><a class="nav-link" href="ReservationListController.do">예약리스트보기</a></li>
										<li class="nav-item "><a class="nav-link" href="UpdateMemberFormController.do">회원정보수정</a></li>
										<li class="nav-item "><a class="nav-link" href="javascript:logout()">로그아웃</a></li>
										<li class="nav-item btn btn-primary text-caps btn-rounded btn-framed"><b><i class="fa fa-user"></i> &nbsp; ${sessionScope.mvo.name }
												님</b></li>
									
									</ul>
									<script>
										function logout() {
											let result = confirm("로그아웃하시겠습니까?");
											if (result) {
												document.getElementById("logoutForm").submit();
											}
										}
									</script>
									<form action="LogoutController.do" method="post" id="logoutForm"></form>
									<!--Main navigation list-->
							</c:otherwise>
						</c:choose>
					</div>
					<!--end navbar-collapse-->
				</nav>
				<!--end navbar-->
			</div>
			<!--end container-->
		</div>
	</div>
</header>
</div>