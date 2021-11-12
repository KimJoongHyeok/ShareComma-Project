<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <br>

<h1><label for="숙소 이름" class="col-form-label required">숙소상세정보</label></h1>
<hr>
<div class="container">
   <form action="ReservateHouseFormController.do" method="post" id = "reservationForm">
      <div class="form-group">
         <br /> 
         
         <%-- 숙소사진띄워주는부분 --%>
         <div align="center" >
         <div align="center"  style="height:70rem;  padding-top: 5rem">
         <label for="숙소 사진" class="col-form-label required">Gallery</label><br> 

            <img src="${pageContext.request.contextPath}/upload/${hvo.imageVO.fileName}" alt="" style="width: 800; height: 600;">
                        
             <%--  ${pageContext.request.contextPath}/upload/${hvo.imageVO.fileName} --%>

            </div>

         
         <input type="hidden" name="houseId" value="${hvo.houseId}">
         <label for="숙소 이름" class="col-form-label required">House Name</label>
          <input type="text" name="name" required="required" value = "${hvo.houseName}" readonly="readonly" /><br />
           
          <label for="숙소 주소" class="col-form-label required">Address</label> 
          <input type="text" name="address" required="required" value = "${hvo.houseAddress }" readonly="readonly"/>
          <label for="숙소 소개" class="col-form-label required">Content</label>
         <textarea rows="10" class="form-control" name="content" required="required" readonly="readonly">${hvo.houseContent}</textarea>
          <br>
          <label for="호스트 닉네임" class="col-form-label required">Host NickName</label>
          <input class = "col-sm-4" type="text" name="address" required="required" value = "${hvo.memberVO.nickName }" readonly="readonly" style="width: 25%"/>
         &nbsp; &nbsp;
         <label for="호스트 전화번호" class="col-form-label required">Host PhoneNumber</label> 
         <input class = "col-sm-4" type="text" name="text" required="required" value = "${hvo.memberVO.phone}" readonly="readonly"  style="width: 25%"/>
                  
         

         <hr>
         <!-- <button type = " "></button> -->
      </div>
   </form>
   
<c:choose>
      <c:when test="${hvo.memberVO.id==sessionScope.mvo.id}">
			<div>
			<form action="UpdateHouseFormController.do" method="post">
				<button type="submit" class="btn btn-primary small " style= "width: 8%">수정하기</button><br><br>
				 <input type="hidden" name="hid" value="${hvo.houseId}">
			</form>

			<form action="DeleteHouseController.do" method="post">
				<button type="submit" class="btn btn-primary small " style= "width: 8%" onclick="delete()">삭제하기</button> 
				<input type="hidden" name="hid" value="${hvo.houseId}">
			</form>
			</div>
		</c:when>
      <c:otherwise>
      <form action="ReservateHouseFormController.do" method="post" >
         <button type="button"  class="btn btn-primary small " style= "width: 8%" onclick="reservation()">예약하기</button> 
         <input type="hidden" name="houseId" value="${hvo.houseId}">   
      </form>   
         <%-- <a href="ReservateHouseFormController.do?hid=${hvo.houseId}">예약하기</a> --%>
      </c:otherwise>
   </c:choose>
</div>



<script>
   function reservation(){
      if(confirm("예약하시겠습니까?")){
         document.getElementById("reservationForm").submit();
      }
   }
</script>
<!--   
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fd4efbbcddc095d4dfa00d6f028dd788&libraries=services">
//마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places(); 

// 키워드로 장소를 검색합니다
ps.keywordSearch(${hvo.houseAddress}, placesSearchCB); 

// 키워드 검색 완료 시 호출되는 콜백함수 입니다
function placesSearchCB (data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        var bounds = new kakao.maps.LatLngBounds();

        for (var i=0; i<data.length; i++) {
            displayMarker(data[i]);    
            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
        }       

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
        map.setBounds(bounds);
    } 
}

// 지도에 마커를 표시하는 함수입니다
function displayMarker(place) {
    
    // 마커를 생성하고 지도에 표시합니다
    var marker = new kakao.maps.Marker({
        map: map,
        position: new kakao.maps.LatLng(place.y, place.x) 
    });

    // 마커에 클릭이벤트를 등록합니다
    kakao.maps.event.addListener(marker, 'click', function() {
        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
        infowindow.open(map, marker);
    });
}
</script>

  -->