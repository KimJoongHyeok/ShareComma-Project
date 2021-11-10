<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
	
	function deleteMember(){
		if(confirm("탈퇴하시겠습니까?")){
			document.getElementById("deleteForm").submit();
		}
	}
	function updateMember(){
		if(confirm("회원정보를 수정하시겠습니까?")){
			document.getElementById("updateForm").submit();
		}
	}
	function becomeHost(){
		if(confirm("호스트로 전환하시겠습니까?")){
			document.getElementById("becomeHostForm").submit();
		}
	}
	   function becomeMember(){
		      if(confirm("멤버로 전환하시겠습니까?")){
		         document.getElementById("becomeMemberForm").submit();
		      }
		   }
	   
	
</script>

		<section class="content">
		   <section class="block">
		      <div class="container">
		         <div class="row justify-content-center">
		            <div class="col-xl-4 col-lg-5 col-md-6 col-sm-8">
		            
		               <form class="form clearfix" action = "UpdaterMemberController.do"  method="post" id = "updateForm">
		                  <div class="form-group">
		                     <label for="id" class="col-form-label required" >Your Id</label>
		                     <input name="id" type="text" class="form-control" id="id"  value="${sessionScope.mvo.id}" readonly="readonly">
		                
		                  </div>
		                  <div class="form-group">
		                     <label for="password" class="col-form-label required"  >Password</label>
		                     <input name="password" type="password" class="form-control" id="password" value = "${sessionScope.mvo.password }" required="required" >
		                  </div>
		                  <!--end form-group-->
		                  <div class="form-group">
		                     <label for="name" class="col-form-label required" >Your Name</label>
		                     <input name="name" type="text" class="form-control" id="name" value = "${sessionScope.mvo.name }" required="required" >
		                  </div>
		                  <!--end form-group-->
		                  <div class="form-group">
		                     <label for="phone" class="col-form-label required">Your phone</label> 
		                     <input name="phone" type="text" class="form-control" id="phone" value = "${sessionScope.mvo.phone }" required="required" >
		                  </div>
		                  <!--end form-group-->
		                  <div class="form-group">
		                     <label for="nick" class="col-form-label required" >Your nick</label> 
		                     <input name="nick" type="text" class="form-control" id="nick" value = "${sessionScope.mvo.nickName }" required="required">
		                  </div>
		                   <!--end form-group-->
			            <div class="form-group">
			               <label for="status" class="col-form-label required" >Your Status</label> 
			               <input name="status" type="text" class="form-control" id="status" value = "${sessionScope.mvo.status }" required="required" readonly="readonly">
			            </div>
		            </form>
		            <!--end form-group-->
		            
		               
		            <form action="DeleteMemberController.do" method="post" id="deleteForm">
		               <input type="hidden" name="id" value="${mvo.id} ">
		            </form>
		            <form action="BecomeHostController.do" method="post" id="becomeHostForm">
		               <input type="hidden" name="id" value="${sessionScope.mvo.id }">
		            </form>
		            <form action="BecomeMemberController.do" method="post" id="becomeMemberForm">
		               <input type="hidden" name="id" value="${sessionScope.mvo.id }">
		            </form>
		            
		            
	                  <br>
	                   <div align="center" >
	                  <button type="button" class="btn btn-lg  btn-primary " style= "width: 49%" onclick = "updateMember()" >수정하기</button>
	                  <button type="button" class="btn btn-lg  btn-primary " onclick = "deleteMember()"  style= "width: 49%">탈퇴하기</button>
	                  <br>
	                  <br>
	                 
			          <c:choose>
			               <c:when test="${sessionScope.mvo.status !='HOST' }">
			                  <button type="button"  class="btn btn-primary"  style= "width: 100%" onclick="becomeHost()">호스트계정으로 전환하기</button>
			               </c:when>
			               <c:otherwise>
			                  <button type="button"  class="btn btn-primary"  style= "width: 100%" onclick="becomeMember()" >일반멤버계정으로 전환하기</button>
			               </c:otherwise>
			          </c:choose>
	            	</div>
		            	
		               <hr>
		            </div>
		            <!--end col-md-6-->
		         </div>
		         <!--end row-->
		      </div>
		      <!--end container-->
		   </section>
		   <!--end block-->
		</section>
	<!--end content-->



