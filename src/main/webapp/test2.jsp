<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
   <style>
  /* Make the image fully responsive */
  .carousel-inner img {
    width: 100%;
    height: 100%;
  }
  </style>
</head>
<body>

<div class="container">
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" align="center"  width="800" height="1000">
      <div class="item active">
      	<img src="image/santorini.jpg" class="_oxzjdz9" alt="Greece" width="800" height="1000">
        <div class="carousel-caption">
        <h3>산토리니</h3>
        <p>HELLO!</p>
      </div>
      </div>

      <div class="item">
      	<img src="image/몰디브2.jpg" class="rounded" alt="Mauritius" width="800" height="1000" >
       <div class="carousel-caption">
        <h3>몰디브</h3>
        <p>Thank you, 몰디브!</p>
      </div>
      </div>
    
      <div class="item">
      	<img src="image/타히티 섬.jpg" class="rounded" alt="tahiti" width="800" height="1000">
        <div class="carousel-caption">
        <h3>타히티 섬</h3>
        <p>Thank you, TAHITI!</p>
      </div>
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>
 
</body>
</html> 