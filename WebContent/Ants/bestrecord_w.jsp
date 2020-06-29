<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    String name = request.getParameter("name");
    int time = Integer.parseInt(request.getParameter("time"));
    String count = request.getParameter("count");
    
    boolean result = false;
    
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	StringBuffer sql = new StringBuffer();
	sql.append(" update info set");
	sql.append("    best_record = ?");
	sql.append(" where  user_id = ?");
	
	try {
		Class.forName("oracle.jdbc.OracleDriver");
		conn = DriverManager.getConnection(
			"jdbc:oracle:thin:@localhost:1521:xe", "Ants", "1234");
		pstmt= conn.prepareStatement(sql.toString());
		pstmt.setInt(1, time);
		pstmt.setString(2, name);
		if (pstmt.executeUpdate() > 0) {
			result = true;
			}%>

   
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

<form action="Ranking.jsp" method= "post" id = "best_record_over_r">
  			<input type="hidden" name ="name" value ="<%=name%>">
  			<input type="submit" value="Submit">
  			</form>

<script type="text/javascript">
this.document.getElementById("best_record_over_r").submit(); 
</script>

<%
		
	} catch(Exception e) {
		e.printStackTrace();
	} finally {
		if (pstmt!=null)try{pstmt.close();}catch(Exception e){}
		if (conn !=null)try{ conn.close();}catch(Exception e){}
	}
%>
</body>
</html>