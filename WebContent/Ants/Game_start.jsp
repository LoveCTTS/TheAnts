<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<form name='key_form'>
<input type='text' name='key_str' /><br>
<input type='text' name='key_code' /><br>
<input type='reset'/></form>

<script>window.onkeydown = function() {
key_form.key_code.value += event.keyCode+';';
key_form.key_str.value += String.fromCharCode(event.keyCode)+';';}</script>


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
</style>
<script type = "text/javascript">



</script>

</head>
<body>

<img src = "right.jpg" onClick='39' >
<img src = "left.jpg" onClick = '37' >
<img src = "up.jpg">
<img src = "down.jpg">



</body>


	
	




</html>