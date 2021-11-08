<%@ page language="java" contentType="text/html; charset=UTF-8"
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
 
 
 