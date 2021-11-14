<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class = "row bg-dark text-black">
   &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
   <a href = "HouseListController.do"><img src="assets/img/logo16.png" alt=""></a>
      <c:choose>
         <c:when test="${sessionScope.mvo == null}">
            <!--Main navigation list-->
            <div class = "col-sm-3 offset-sm-6 bg-dark text-black font-weight-bold">
            <br><br><br>
                  <a href="HouseListController.do">홈</a>&emsp;
                  <a href="RegisterMemberFormController.do">회원가입</a>&emsp;
                  <a href="LoginFormController.do"><i class="fa fa-user"></i>로그인</a>
            </div>
            <!--Main navigation list-->
         </c:when>
         <c:otherwise>
            <!--Main navigation list-->
               <div class = "col-sm-5 offset-sm-4 bg-dark text-black font-weight-bold">
               <br><br><br>
               &emsp;&emsp;&emsp;&emsp;
               <a href="HouseListController.do">홈</a>&nbsp;&nbsp;
                  <c:if test="${sessionScope.mvo.status eq 'HOST'}">
                     <a href="RegisterHouseFormController.do">숙소등록</a>&nbsp;&nbsp;
                  </c:if>   
                  <a href="ReservationListController.do">예약리스트보기</a>&nbsp;&nbsp;
                  <a href="UpdateMemberFormController.do">회원정보수정</a>&nbsp;&nbsp;
                  <a href="javascript:logout()">로그아웃</a>&nbsp;&nbsp;
                  <p class="nav-item btn btn-primary text-caps btn-rounded btn-framed"><b><i class="fa fa-user"></i> &nbsp; ${sessionScope.mvo.name }님</b></p>
               </div>
            <form action="LogoutController.do" method="post" id="logoutForm"></form>
            <!--Main navigation list-->
      </c:otherwise>
      </c:choose>
   </div>
<script>
   function logout() {
      let result = confirm("로그아웃하시겠습니까?");
      if (result) {
         document.getElementById("logoutForm").submit();
      }
   }
</script>