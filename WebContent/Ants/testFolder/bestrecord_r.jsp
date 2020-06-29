<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <% 
    Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	
	String name = request.getParameter("name");
	String count = request.getParameter("count");
	String time = request.getParameter("time");
	
	String b_record = null;
	name = "next";
	count= "50";
	time = "398";
	boolean result = false;
	
	StringBuffer sql = new StringBuffer();
	sql.append(" select best_record ");
	sql.append(" from info");
	sql.append(" where user_id = ?");


	try {

		Class.forName("oracle.jdbc.OracleDriver");
		conn = DriverManager.getConnection(
			"jdbc:oracle:thin:@localhost:1521:xe", "Ants", "1234");
		pstmt= conn.prepareStatement(sql.toString());
		pstmt.setString(1, name);
		rs = pstmt.executeQuery();	
		
	
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
1234
<p>
<% if(rs.next()){
		b_record = rs.getString("best_record");
		}

int b_record_c = Integer.parseInt(b_record);
int time_c = Integer.parseInt(time);

if(b_record_c > time_c){
	%>
<form id ="best_record_over" action="bestrecord_w.jsp" method="get">
  <input type="hidden" name="time" value="<%=time %>">
  <input type="hidden" name="name" value="<%=name %>">
  <input type="hidden" name="count" value="<%=count %>">
  <input type="submit" value="Submit">
</form>

<script type="text/javascript">
this.document.getElementById("best_record_over").submit();
</script>
<% }
else{
	%>
	
<form action="ranking.jsp" method= "post" id = "best_record_over_r">
  			<input type="hidden" name ="name" value ="<%=name%>" >
  			<input type="submit" value="Submit">
  			</form>

<script type="text/javascript">
this.document.getElementById("best_record_over_r").submit();
</script>
	
	
	<%
}
} catch(Exception e) {
	e.printStackTrace();
} finally {
	if (rs!=null)try{rs.close();}catch(Exception e){}
	if (pstmt!=null)try{pstmt.close();}catch(Exception e){}
	if (conn !=null)try{conn.close();}catch(Exception e){}
}

%>
</body>
</html>



