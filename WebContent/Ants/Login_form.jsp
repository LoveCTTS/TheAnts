<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
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
<meta charset="UTF-8">
<link rel="icon" type="image/png" href="/favicon.png">
<title>Insert title here</title>
</head>
<body>
<div id="divPosition">
    
  
<form action = "Login_process.jsp" method ="get">
	<table>
<caption> 로그인 </caption>
		<tr>
			<th>아이디</th>
			<td><input type ="text" name = "user_id" autofocus required="required"/></td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input type ="password" name = "user_pw" required="required"/></td>
		</tr>
		<tr>
			<th></th>
			<td><input type ="submit" value = "login"/></td>
		</tr>


	</table>

</form>
</div>
</body>
</html>
