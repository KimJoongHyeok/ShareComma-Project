<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
	<form action="RegisterHouseController.do" method="post"  enctype="multipart/form-data">
		<input type="text" name="name" required="required"  placeholder="숙소이름"/> <br />
		<input type="text" name="address" required="required" placeholder="숙소주소"/> <br />
		<input type="file" name="filename"  required="required"/><br />
		<textarea rows="10" class="form-control" name="content" placeholder="집소개" required="required"></textarea>
		<hr>
	
		<button type="submit">등록</button>
		<button type="reset" class="btn btn-outline-primary">취소</button>
		
	</form>
 
 
  --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>                       
<div class="page-title">
	 <div class="container">
     	<h1>숙소 등록</h1>
     </div>
   <!--end container-->
</div>  
<div class="container">
	<form action="RegisterHouseController.do" method="post" enctype="multipart/form-data">
		<div class="form-group">
			<br /> 
			<label for="숙소 이름" class="col-form-label required">House Name</label>
		    <input type="text" name="name" required="required" placeholder="숙소이름" /><br /> 
		    <label for="숙소 주소" class="col-form-label required">Address</label> 
		    <input type="text" name="address" required="required" placeholder="숙소주소"/>

			<div class="file-upload-previews"></div>
			<div class="file-upload">
				<label for="숙소 사진" class="col-form-label required">Gallery</label><br>			
				<input type="file" name="filename" required="required" class="btn btn-outline-secondary">	
			</div>				
			<label for="숙소 소개" class="col-form-label required">Content</label>
			<textarea rows="10" class="form-control" name="content" placeholder="집소개" required="required"></textarea>
			<hr>
			<button type="reset" class="btn btn-primary small " style= "width: 8%">
				취소<i class="fa fa-chevron-right"></i> 
			</button>
			<button type="submit" class="btn btn-primary small" style= "width: 8%">
				등록<i class="fa fa-chevron-right"></i>&nbsp;
			</button>
			<br>					
		</div>
	</form>
</div>

 