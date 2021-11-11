<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container">
		<div class="row justify-content-center">
			<div class="col-xl-4 col-lg-5 col-md-6 col-sm-8">
				<form action="ReservateHouseController.do?hid=${requestScope.hid}">
				
					<table class="table">
						<tr>
							<td>
								<label class="col-form-label required">예약자이름</label>
								<input type="text" name="name" value = "${sessionScope.mvo.name } 님" readonly="readonly">
							</td>
						</tr>
						<tr>
							<td>
								<label class="col-form-label required">체크인날짜</label>
								<input type="date" name="checkIn" required="required">
							</td>
						</tr>
						<tr>
							<td>
								<label class="col-form-label required">체크아웃날짜</label>
								<input type="date" name="checkOut" required="required">
							</td>
						</tr>
						<tr>
							<td>
								<label class="col-form-label required">인원수</label>
								<input type="number" name="count" required="required" placeholder="인원수">
							</td>
						</tr>		
					</table>	 	
						<button type="submit"  >확인</button>
						<button type="reset"  >취소</button>	 
				</form>
			</div>
		</div>	
</div>
