<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="RegisterHouseController.do" method="post"  enctype="multipart/form-data">
		<input type="text" name="name" required="required"  placeholder="숙소이름"/> 
		<input type="text" name="address" required="required" placeholder="숙소주소"/> 
		<input type="file" name="filename" />
		<hr>
		<textarea rows="10" class="form-control" name="content" placeholder="집소개" required="required"></textarea>

		<button type="submit">등록</button>
		<button type="reset" class="btn btn-outline-primary">취소</button>
		<textarea rows="10" class="form-control" name="content" placeholder="집소개" required="required"></textarea>
	</form>

	<img src="${pageContext.request.contextPath}/upload/${requestScope.ivo.fileName}" height="280" width="180" />
	<br />
	--------------------------------------------------------------------------------
	<br />
			
	리퀘스트 언제 오나요?<br />
	${requestScope.ivo.fileName } <br />
	${requestScope.ivo.orgName } <br />
	${requestScope.ivo.filePath } <br /> 

 	성공<br />
	${pageContext.request.contextPath}/upload/${requestScope.ivo.fileName}
	-----------------------------------------------------------------------------------
	
	<form action="ReservateHouseFormController.do?hid=2" method="post">
			<button type="submit">예약</button>
		</form>
</body>
</html>
