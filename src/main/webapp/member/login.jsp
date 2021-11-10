<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<section class="content">
	<section class="block">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-4">
					<form class="form clearfix" action = "LoginController.do" method = "post">
						<div class="form-group">
							<label for="id" class="col-form-label required">Your Id</label> 
							<input name="id" type="text" class="form-control" id="id" placeholder="Your Id" required>
						</div>
						<!--end form-group-->
						<div class="form-group">
							<label for="password" class="col-form-label required">Password</label>
							<input name="password" type="password" class="form-control" id="password" placeholder="Password" required>
						</div>
						<!--end form-group-->
						<div class="d-flex justify-content-between align-items-baseline">
							<label> <input type="hidden" name="remember" value="1">
								
							</label>
							<button type="submit" class="btn btn-primary">Sign In</button>
						</div>
					</form>
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