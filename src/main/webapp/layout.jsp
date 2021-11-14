<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
      <meta name="author" content="ThemeStarz">
      <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700|Varela+Round" rel="stylesheet">
      <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.css" type="text/css">
      <link rel="stylesheet" href="assets/fonts/font-awesome.css" type="text/css">
      <link rel="stylesheet" href="assets/css/selectize.css" type="text/css">
      <link rel="stylesheet" href="assets/css/style.css">
      <link rel="stylesheet" href="assets/css/user.css">
      <style>
         body {
            background-image: url('image/santorini.jpg');
            background-size: cover;
            background-color : black;
         }
      </style>
   <title>[ Share, ] </title>
   </head>

   <body>
      <header>
         <div class="container-fluid pt-5">
            <c:import url="header.jsp"></c:import>
         </div>
      </header>
      <div class = "container">
            <div align="center"> 
               <c:import url="${requestScope.url}"/>   
            </div>
      </div>
   </body>
</html>
















