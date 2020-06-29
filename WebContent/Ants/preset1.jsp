<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	String name = request.getParameter("name");
	String x=null,y=null, evt=null;
			
	
StringBuffer sql = new StringBuffer();
sql.append(" select col_f, row_f, evt ");
sql.append(" from filed_2");
sql.append(" where evt = 0 and (abs(10 - col_f) + abs(10 - row_f)) > 11");
sql.append(" order by DBMS_RANDOM.RANDOM()");

String user_col = null;
String user_row = null;


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
<title>Preset</title>
</head>
<body>

	<%
		while(rs.next()){
			
			
		evt = rs.getString("evt");
		y = rs.getString("row_f");
		x = rs.getString("col_f");
		}
		%>
		<script type="text/javascript" hidden="">
		location.href='preset2.jsp?x=<%=x%>&y=<%=y%>&evt=<%=evt%>&name=<%=name%>';
		</script>
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
		stmt.close();
			} catch (Exception e) {
			}
		if (conn != null)
			try {
		conn.close();
			} catch (Exception e) {
			}
	}
	
	%>
	
	
	
</body>
</html>