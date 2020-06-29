<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    <%
    
    String y = request.getParameter("y");
    String x = request.getParameter("x"); 
    String count = request.getParameter("count"); 
    String name = request.getParameter("name");
    String rst = request.getParameter("starttime"); 
	   
    int count1 = Integer.parseInt(count); count1++;
    
    int y1 = Integer.parseInt(y);
	int x1 = Integer.parseInt(x);
	 
	x1--;
    
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
left
<form id ="button_l" action="http://localhost:8090/Ants/Ants/Game_start.jsp" method="get">
  <input type="text" name="x" value="<%=x1 %>">
  <input type="text" name="y" value="<%=y1 %>">
  <input type="text" name="count" value="<%=count1 %>">
  <input type="text" name="name" value="<%=name %>">
  <input type="hidden" name="starttime" value="<%=rst %>">
  <input type="hidden" name="rst" value="<%=1 %>">
  <br>
 <input type="submit" value = "main">
</form>

<script type="text/javascript">
this.document.getElementById("button_l").submit();
</script>
</body>
</html>