<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" type="image/png" href="favicon.png">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">


<style type="text/css">
body {
   font-family: 'Jua', sans-serif;
}

body { padding:0px; margin:0px; }

 

   #divPosition {  
    background-color : rgba(255,255,255,0.5);
     position:absolute;
     height:220px;
     width:300px;
     margin:-150px 0px 0px -200px;
     top: 50%;
     left: 50%;
     padding: 5px;
   }

</style>
</head>
<body>
<img src="oasis.jpg">
<div id="divPosition">

<form action = "Join_process.jsp" method = "post">

<table>
<div class="p-1 mb-2 bg-warning text-dark"> <ion-icon name="bug-sharp"></ion-icon> The Ants Game </div>
<center>
     <h1 class= "lead">회원가입</h1>
</center>

<tr>
<th >ID : </th>
<td ><input class="form-control" type = "text" name="user_id" placeholder="가입하는 ID입력"/></td>
</tr>

<tr>
<th>Password : </th>
<td><input class="form-control" type = "password" name = "user_pw" placeholder="가입하는 PW입력"/></td>
</tr>

<tr>
<th></th>
<td><input type = "submit"  class="btn btn-success btn-block" value = "가입하기"/></td>
</tr>







</table>
</form>
</div>
<script src="https://unpkg.com/ionicons@5.1.0/dist/ionicons.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
</body>
</html>