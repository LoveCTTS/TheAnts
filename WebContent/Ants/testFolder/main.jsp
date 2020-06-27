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
    String name = request.getParameter("name");
    String time = null;
	
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
	
	String wal = "def", evt=null;
	
	
	while(rs.next()){
		wal = rs.getString("wal");
		evt = rs.getString("evt");
	
	}
	
	
	int evt_c = Integer.parseInt(evt);
	int wal_c = Integer.parseInt(wal);
	int x_c = Integer.parseInt(x);
	int y_c = Integer.parseInt(y);
	
	
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
ID : <%=name%>
<!-- 
<% //if ((wal_c == 10)&&(x_c == 1)){%>
<script>

alert('지나갈수 없는 길입니다.');
history.go(-1); 
</script>
 -->
<% //}else{}%>



<form id ="button_up" action="main_zip/button_up.jsp" method="post">
  <input type="text" name="x" value="<%=x %>">
  <input type="text" name="y" value="<%=y %>"><br>
  <% if (!((wal_c == 10)&&(y_c == 19))){ // 위 side에 가면 버튼 사라짐 %>
 <input type="submit" value = "up">
 <%} %>
</form>

<form id ="button_down" action="main_zip/button_down.jsp" method="post">
  <input type="hidden" name="x" value="<%=x %>">
  <input type="hidden" name="y" value="<%=y %>">
<% if (!((wal_c == 10)&&(y_c == 1))){ // 아래 side에 가면 버튼 사라짐 %>
 <input type="submit" value = "down">
<%} %>
</form>


<form id ="button_l" action="main_zip/button_l.jsp" method="post">
  <input type="hidden" name="x" value="<%=x %>">
  <input type="hidden" name="y" value="<%=y %>">
<% if (!((wal_c == 10)&&(x_c == 1))){ // 왼쪽 side에 가면 버튼 사라짐 %>
<input type="submit" value = "left">
<% }%>
</form>


<form id ="button_r" action="main_zip/button_r.jsp" method="post">
  <input type="hidden" name="x" value="<%=x %>">
  <input type="hidden" name="y" value="<%=y %>">
  <% if (!((wal_c == 10)&&(x_c == 19))){ // 오른쪽 side에 가면 버튼 사라짐 %>
 <input type="submit" value = "right">
 <%} %>
</form>




<%=wal %><br>
<%=evt %>


<% if (( evt_c == 2)){
%><script>

alert('Clear!'); 
</script>
<form id ="ranking_w" action="ranking_w.jsp" method="get">
  <input type="hidden" name="name" value="<%=name %>">
  <input type="hidden" name="time" value="<%=time %>">
  <input type="submit" value="Submit">
</form>

<script type="text/javascript">
this.document.getElementById("ranking_w").submit();
</script>
</body>

<%
}else{}%>





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