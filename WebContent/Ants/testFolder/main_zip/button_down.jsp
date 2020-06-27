<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%	String y = request.getParameter("y");
    	String x = request.getParameter("x"); 
    	
    	int y1 = Integer.parseInt(y);
    	int x1 = Integer.parseInt(x);
		 
    	y1--;
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" type="image/png" href="/favicon.png">
<link href="https://fonts.googleapis.com/css2?family=Sunflower:wght@300&display=swap" rel="stylesheet">
<style type="text/css">
body {
font-family: 'Sunflower', sans-serif;
font-size : 24px
}
</style>
<title>Insert title here</title>
</head>
<body>
down

<form id ="button_down" action="http://localhost/poject_1/jdbc/main.jsp" method="post">
  <input type="text" name="x" value="<%=x1 %>">
  <input type="text" name="y" value="<%=y1 %>"><br>
 <input type="submit" value = "main">
</form>

<script type="text/javascript">
this.document.getElementById("button_down").submit();
</script>

</body>
</html>