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
	sql.append(" select user_id, c_time");
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
</head>
<body>
<center>
<h1>Ranking</h1>
</center>
<div id="divPosition">
    
   <table border="1">
<tr>
	<th>등수</th>
	<th>이름</th>
	<th>기록</th>
</tr>

<%		while(rs.next()) { %>
<tr>
	<td><%=i++ %></td>
	<td><%=rs.getString("user_id") %></td>
	<td><%=rs.getString("c_time") %></td>
</tr>
<%} %>


</table>
    
  
  <form action="game_start.jsp">
				<button type="submit">게임시작</button>
			</form>
</div>
</body>
</html>

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