<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<form action="ReservateHouseController.do?hid=${requestScope.hid }" method="post">
	<table class="table">
		<tr>
			<td>
				<input type="date" name="checkIn" min=" required="required">
			</td>
		</tr>
		<tr>
			<td>
				<input type="date" name="checkOut" required="required">
			</td>
		</tr>
		<tr>
			<td>
				<input type="number" name="count" required="required">
			</td>
		</tr>		
	</table>	 	
		<button type="submit"  >확인</button>
		<button type="reset"  >취소</button>	 
</form>