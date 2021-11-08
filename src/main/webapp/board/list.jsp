<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h1>숙소리스트</h1>
<br>
<div class="container">
	<table class="table table-hover">
		<thead>
			<tr>
				<th>숙소사진</th>
				<th>숙소이름</th>
				<th>지역</th>
				<th>호스트</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${requestScope.list}" var="hvo">
				<tr>
					<td><img src="image/cinqueterre.jpg" class="rounded" alt="Cinque Terre"width="300" height="200"></td>
					<td>
						<c:choose>
							<c:when test="${sessionScope.mvo!=null}">
								<a href="HouseDetailController.do?houseId=${hvo.houseId}">${hvo.houseName}</a>
							</c:when>
							<c:otherwise>
		  			 			${hvo.houseName}
		  					</c:otherwise>
						</c:choose>
					</td>
					<td>${hvo.houseAddress }</td>
					<td>${hvo.memberVO.name }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

