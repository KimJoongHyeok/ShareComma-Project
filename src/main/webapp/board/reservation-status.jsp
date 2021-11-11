<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container">
   <h2>
      <label class="col-form-label required">숙소예약현황</label>
   </h2>
   <table class="table table-hover table-dark"   >
      <thead>
         <tr align=center>
            <th >숙소이름</th>
            <th  >예약자이름</th>
            <th  >체크인날짜</th>
            <th  >체크아웃날짜</th>
            <th  >게스트수</th>
         </tr>
      </thead>
      <tbody>
         <c:forEach items="${rlist }" var="rvo">
            <tr  align=center>
               <td  >${rvo.houseVO.houseName }</td>
               <td  >${sessionScope.mvo.name }</td>
               <td  >${rvo.checkIn }</td>
               <td  >${rvo.checkOut }</td>
               <td  >${rvo.countPerson }</td>
            </tr>
         </c:forEach>
      </tbody>
   </table>
</div>