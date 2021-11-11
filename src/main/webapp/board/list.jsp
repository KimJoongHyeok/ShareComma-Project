<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  
</head>
<c:import url="test2.jsp"></c:import><br>
<section class="content">
   <section class="block">
      <div class="container">
         <div class="items grid compact grid-xl-4-items grid-lg-3-items grid-md-2-items">
            <c:forEach items="${requestScope.list}" var="hvo">
               <div class="item">
                  <div class="wrapper">
                     <div class="image">
                        <h3>
                           <a href="#" class="tag category">Home & Decor</a> 
                           <a href="HouseDetailController.do?houseId=${hvo.houseId}" class="title">${hvo.houseName }</a>
                           <span class="tag">Share</span>
                        </h3>
                        <a href="HouseDetailController.do?houseId=${hvo.houseId}" > 
                           <img src="${pageContext.request.contextPath}/upload/${hvo.imageVO.fileName}" alt="" width=100%; height=100%>
                            
                        </a>
                     </div>
                     <!--end image-->
                     <h4 class="location">
                        <a href="#">${hvo.houseAddress }</a>
                     </h4>
                     <div class="price">$80</div>
                     <div class="meta">
                        <figure>
                           <i class="fa fa-calendar-o"></i>${hvo.houseTimePosted}
                        </figure>
                        <figure>
                           <a href="#"> <i class="fa fa-user"></i>${hvo.memberVO.name }
                           </a>
                        </figure>
                     </div>
                     <!--end meta-->
                     <div class="description">
                        <p>${hvo.houseContent }</p>
                     </div>
                     <!--end description-->
                     <a href="HouseDetailController.do?houseId=${hvo.houseId}" class="detail text-caps underline">Detail</a>
                  </div>
               </div>
            </c:forEach>
         </div>
      </div>
   </section>
</section>

