<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <br>
<h1><label for="숙소 이름" class="col-form-label required">숙소상세정보</label></h1>
<hr>
<div class="container">    
      <div class="form-group">
         <br />          
         <%-- 숙소사진띄워주는부분 --%>
         <div align="center" >
         <div align="center"  style="width: 800px; height: 600px; margin-bottom: 8rem;">
        	 <label for="숙소 사진" class="col-form-label required">Gallery</label><br> 
         	 <img src="${pageContext.request.contextPath}/upload/${hvo.imageVO.fileName}" alt="" style="width: 100%; height: 100%;">
         </div>

         
         <input type="hidden" name="houseId" value="${hvo.houseId}">
         <label for="숙소 이름" class="col-form-label required">House Name</label>
          <input type="text" name="name" required="required" value = "${hvo.houseName}" readonly="readonly" /><br />
           
          <label for="숙소 주소" class="col-form-label required">Address</label> 
          <input type="text" name="address" required="required" value = "${hvo.houseAddress }" readonly="readonly"/>
          <label for="숙소 소개" class="col-form-label required">Content</label>
         <textarea rows="10" class="form-control" name="content" required="required" readonly="readonly">${hvo.houseContent}</textarea>
          <br>
          <label for="호스트 닉네임" class="col-form-label required">Host NickName</label>
          <input class = "col-sm-4" type="text" name="address" required="required" value = "${hvo.memberVO.nickName }" readonly="readonly" style="width: 25%"/>
         &nbsp; &nbsp;
         <label for="호스트 전화번호" class="col-form-label required">Host PhoneNumber</label> 
         <input class = "col-sm-4" type="text" name="text" required="required" value = "${hvo.memberVO.phone}" readonly="readonly"  style="width: 25%"/>
           <hr>
        </div>
<c:choose>
      <c:when test="${hvo.memberVO.id==sessionScope.mvo.id}">
         <div>
         <form action="UpdateHouseFormController.do" method="post">
            <button type="submit" class="btn btn-primary small " style= "width: 8%">수정하기</button><br><br>
             <input type="hidden" name="hid" value="${hvo.houseId}">
         </form>

         <form action="DeleteHouseController.do" method="post">
            <button type="submit" class="btn btn-primary small " style= "width: 8%" onclick="delete()">삭제하기</button> 
            <input type="hidden" name="hid" value="${hvo.houseId}">
         </form>
         </div>
      </c:when>
      <c:otherwise>
      <form action="ReservateHouseFormController.do" method="post" >
         <button type="submit"  class="btn btn-primary small " style= "width: 8%" onclick="reservation()">예약하기</button> 
         <input type="hidden" name="houseId" value="${hvo.houseId}">   
      </form>             
      </c:otherwise>
   </c:choose>
</div>
</div>
