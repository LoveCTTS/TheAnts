<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<form name='key_form'>
<input type='text' name='key_str' /><br>
<input type='text' name='key_code' /><br>
<input type='reset'/></form>

<script>window.onkeydown = function() {
key_form.key_code.value += event.keyCode+';';
key_form.key_str.value += String.fromCharCode(event.keyCode)+';';}</script>

<% int a=0; %>
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
<script type="text/javascript">
window.onload=function(){
	document.getElementById('btnRight').onclick = function(){
		startCount();
	}
	document.getElementById('btnLeft').onclick = function(){
		startCount();
	}
	document.getElementById('btnUp').onclick = function(){
		startCount();
	}
	document.getElementById('btnDown').onclick = function(){
		startCount();
	}

}

function startCount() {
	if (isNaN(parseInt(document.getElementById('Count').innerHTML)) == true) {
		document.getElementById('Count').innerHTML = '1';
	} else {
		document.getElementById('Count').innerHTML = parseInt(document.getElementById('Count').innerHTML) + 1;
	}
}
</script>
</head>



<body>
<h1><div id="Count"></div></h1>
<img src="right.jpg"  id="btnRight" style="cursor:pointer;">
<img src="left.jpg"  id="btnLeft" >
<img src="up.jpg" id="btnUp">
<img src="down.jpg" id="btnDown">


<input type = "button" value = "게임시작">



</body>


	
	




</html>