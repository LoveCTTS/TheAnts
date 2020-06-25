<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="org.apache.commons.codec.digest.DigestUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	int i = 1;
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	StringBuffer sql = new StringBuffer();
	sql.append(" select user_id, c_time, count");
	sql.append(" from Ranking");
	sql.append(" order by c_time");
	try {
		Class.forName("oracle.jdbc.OracleDriver");
		conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "Ants", "1234");
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql.toString());
%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" type="image/png" href="/favicon.png">
<link
	href="https://fonts.googleapis.com/css2?family=Sunflower:wght@300&display=swap"
	rel="stylesheet">
<style type="text/css">
body {
	font-family: 'Sunflower', sans-serif;
	font-size: 24px
}
</style>
<style>
body {
	padding: 0px;
	margin: 0px;
}

#divPosition {
	
	position: absolute;
	height: 300px;
	width: 400px;
	margin: -150px 0px 0px -200px;
	top: 50%;
	left: 50%;
	padding: 5px;
}

</style>
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
</head>

<body>


<img src="oasis.jpg">

	
<div id="divPosition">
	
	<center>
  	<h1 class="display-4">Ranking</h1>
  	</center>
		
	
    
   <table border="2" background:black>
	<tr class="lead" class = "text-white-Large">
	
		<th>등수</th>
		<th>이름</th>
		<th>기록</th>
		<th>이동 횟수</th>
	</tr>

<%		while(rs.next()) { %>
<tr class = "lead">
	<td><%=i++ %></td>
	<td><%=rs.getString("user_id") %></td>
	<td><%=rs.getString("c_time") %></td>
	<td><%=rs.getInt("count") %>
</tr>
<%} %>


</table>
    
  
  <form action="Game_start.jsp">
				<button type="submit" class = "btn btn-light">게임시작</button>
			</form>
			
			
<%
		
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		if (rs != null)
			try {
		rs.close();
			} catch (Exception e) {
			}
		if (stmt != null)
			try {
		rs.close();
			} catch (Exception e) {
			}
		if (conn != null)
			try {
		rs.close();
			} catch (Exception e) {
			}

	}
	%>			
</div>

<script src="https://unpkg.com/ionicons@5.1.0/dist/ionicons.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
</body>
</html>

