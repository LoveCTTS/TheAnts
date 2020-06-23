<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" type="image/png" href="favicon.png">
<title>Insert title here</title>

<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">

<style type="text/css">
body {
	font-family: 'Jua', sans-serif;
}

body { padding:0px; margin:0px; }

 

   #divPosition {  

     border: 1px solid #5D5D5D;
     position:absolute;
     height:200px;
     width:300px;
     margin:-150px 0px 0px -200px;
     top: 50%;
     left: 50%;
     padding: 5px;
   }

</style>
</head>
<body>
<div id="divPosition">

<form action = "Join_process.jsp" method = "post">

<table>

<caption>회원가입</caption>

<tr>
<th>ID : </th>
<td><input type = "text" name="user_id"/></td>
</tr>

<tr>
<th>Password : </th>
<td><input type = "password" name = "user_pw"/></td>
</tr>

<tr>
<th></th>
<td><input type = "submit" value = "가입하기"/></td>
</tr>







</table>
</form>
</div>
</body>
</html>