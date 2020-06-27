<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<%
	String y = request.getParameter("y");
    String x = request.getParameter("x"); 
	String wal = null, evt=null;
    
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	StringBuffer sql = new StringBuffer();
	
sql.append(" select col_f, row_f, evt, wal ");
sql.append(" from filed_2");
sql.append(" where col_f= ? and row_f = ?");

try {

	Class.forName("oracle.jdbc.OracleDriver");
	conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "Ants", "1234");
	pstmt= conn.prepareStatement(sql.toString());
	pstmt.setString(1, x);
	pstmt.setString(2, y);
	rs = pstmt.executeQuery();
	

	
	while(rs.next()){
		wal = rs.getString("wal");
		evt = rs.getString("evt");
	
	}
	
	
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
<title>Main</title>
</head>
<body>


<form id ="button_up" action="main_zip/button_up.jsp" method="post">
  <input type="text" name="x" value="<%=x %>">
  <input type="text" name="y" value="<%=y %>"><br>
 <input type="submit" value = "up">
</form>

<form id ="button_down" action="main_zip/button_down.jsp" method="post">
  <input type="hidden" name="x" value="<%=x %>">
  <input type="hidden" name="y" value="<%=y %>">
 <input type="submit" value = "down">
</form>

<form id ="button_r" action="main_zip/button_r.jsp" method="post">
  <input type="hidden" name="x" value="<%=x %>">
  <input type="hidden" name="y" value="<%=y %>">
 <input type="submit" value = "right">
</form>

<form id ="button_l" action="main_zip/button_l.jsp" method="post">
  <input type="hidden" name="x" value="<%=x %>">
  <input type="hidden" name="y" value="<%=y %>">
 <input type="submit" value = "left">
</form>


<%=wal %>
<%=evt %>

<% if (wal == "a"){%>


<%}%>



<script type="text/javascript">
this.document.getElementById("preset_over").submit();
</script>
</body>

<%
		
		} catch (Exception e) {
		e.printStackTrace();
	} finally {
		if (rs != null)
			try {
		rs.close();
			} catch (Exception e) {
			}
		if (pstmt != null)
			try {
		pstmt.close();
			} catch (Exception e) {
			}
		if (conn != null)
			try {
		conn.close();
			} catch (Exception e) {
			}
	}
	
	%>


</html>