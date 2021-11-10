<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
									<a href="HouseDetailController.do" class="title">${hvo.houseName }</a>
									<span class="tag">Share</span>
								</h3>
								<a href="HouseDetailController.do" > 
									<img src="${pageContext.request.contextPath}/upload/${hvo.imageVO.fileName}" alt="">
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
							<a href="HouseDetailController.do" class="detail text-caps underline">Detail</a>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>
</section>
