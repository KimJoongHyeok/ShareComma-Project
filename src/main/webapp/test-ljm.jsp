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

	<br />
	<br />
	<hr />
	--------------------------------------------------------------------------------
	UpdateHouse
	
	<form action="UpdateHouseFormController.do" id="updateForm" method="post">
		<button type="submit">업데이트</button>		
	</form>
	
	<%-- 
<table class="table">
	<tr>
		<td>글번호 ${pvo.no}  </td>
		<td>제목 ${pvo.title} </td>
		<td>작성자 ${pvo.memberVO.name} </td>
		<td>조회수 ${pvo.hits} </td>
		<td>작성일시 2021.10.29</td>
	</tr>
	<tr>
		<td colspan="5">
			pre : db 에 저장된 글형식 그대로 표현 
				   pre tag 라인은 행 변경없이 한 라인으로 표현하자 	
			
			<pre><font size="4">${pvo.content}</font></pre>
		</td>
	</tr>
	글쓴이가 로그인한 회원이면 하단부에 삭제와 수정버튼을 제공한다
		    게시물의 글쓴이 회원 아이디와 로그인한 회원 ( 세션에 저장된 ) 아이디가 같으면 
		    수정과 삭제 버튼을 보여준다 
	 
	<c:if test="${requestScope.pvo.memberVO.id==sessionScope.mvo.id}">
	<tr>
	 부트스트랩에서 제공하는 중앙정렬 class : text-center  
		<td colspan="5" class="text-center">
			<script type="text/javascript">
				
				function updatePost(){
					if(confirm("수정하시겠습니까?"))
						document.getElementById("updateForm").submit();
				}
			</script>
			
			<form action="UpdatePostFormController.do" id="updateForm" method="post">
			<input type="hidden" name="no" value="${pvo.no}">
			</form>
			 
			<button type="button" class="button btn-success" onclick="updatePost()">수정</button>
		</td>
	</tr>
	</c:if>
</table>
 --%>

</body>
</html>
