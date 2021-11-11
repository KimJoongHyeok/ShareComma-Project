<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>                       
<div class="page-title">
	 <div class="container">
     	<h1>숙소 수정</h1>
     </div>
   <!--end container-->
</div>
<div class="container">
	<form action="UpdateHouseController.do" method="post"
		enctype="multipart/form-data">
		<div class="form-group">
			<br /> <input type="hidden" name="id" value="${hvo.houseId}">
			<br /> <label for="숙소 이름" class="col-form-label required">House
				Name</label> <input type="text" name="name" required="required"
				value="${hvo.houseName }" /><br /> <label for="숙소 주소"
				class="col-form-label required">Address</label> <input type="text"
				name="address" required="required" value="${hvo.houseName }" /> <label
				for="숙소 소개" class="col-form-label required">Content</label><br>
			<textarea rows="10" class="form-control" name="content"
				required="required">${hvo.houseContent}</textarea>
			<hr>

			<label for="filename" class="col-form-label required">Gallery</label><br>
			<div class="file-upload-previews">
				<input type="file" name="filename" required="required"
					class="col-form-label">
				<div style="height: 30rem; padding-bottom: 5rem; padding-top: 5rem"
					align="center">
					<img
						src="${pageContext.request.contextPath}/upload/${hvo.imageVO.fileName}"
						height="200" width="220" align="middle" /> <br />
				</div>
			</div>


			<div>
				<button type="reset" class="btn btn-primary small "
					style="width: 15%">
					취소<i class="fa fa-chevron-right"></i>
				</button>
				<button type="submit" class="btn btn-primary small"
					style="width: 15%">
					수정<i class="fa fa-chevron-right"></i>&nbsp;
				</button>
			</div>
		</div>
	</form>
</div>


