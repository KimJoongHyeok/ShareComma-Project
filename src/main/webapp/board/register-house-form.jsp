<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="author" content="ThemeStarz">
	
	 <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700|Varela+Round" rel="stylesheet">
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.css" type="text/css">
    <link rel="stylesheet" href="assets/fonts/font-awesome.css" type="text/css">
    <link rel="stylesheet" href="assets/css/selectize.css" type="text/css">
    <link rel="stylesheet" href="assets/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="stylesheet" href="assets/css/user.css">
    
    <title>Craigs - Easy Buy & Sell Listing HTML Template</title>
    
</head> 
<body>   
                     
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
						<input type="file" name="filename" class="custom-file-input" required="required"/> 	
					</div>				
					<label for="숙소 소개" class="col-form-label required">Content</label>
					<textarea rows="10" class="form-control" name="content" placeholder="집소개" required="required"></textarea>
					<hr>
					<button type="reset" class="btn btn-primary small icon float-right">
						취소<i class="fa fa-chevron-right"></i>
					</button>
					<button type="submit" class="btn btn-primary small icon float-right">
						등록<i class="fa fa-chevron-right"></i>
					</button>
					<br>					
				</div>
			</form>
		</div>
</body>	
</html> 
 