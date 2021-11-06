<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<form action="UpdateHouseController.do" method="post"  enctype="multipart/form-data">

	 <input type="hidden" name="id" value="${hvo.houseId}"> <br />
	 <input	type="text" name="name"   required="required" value="${hvo.houseName }"> <br />
	 <input	type="text" name="address"  required="required" value="${hvo.houseAddress }">	 <br />
	 <textarea rows="10" class="form-control" name="content" required="required">${hvo.houseContent}</textarea> <br />
	 <img src="${pageContext.request.contextPath}/upload/${hvo.imageVO.fileName}" height="280" width="180" /> <br />
	 <input type="file" name="filename"  required="required"/>	 <br />
	<button type="submit">수정</button>
	<button type="reset">취소</button>

</form>