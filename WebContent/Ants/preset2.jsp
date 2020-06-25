<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% 
    
    
    String evt = request.getParameter("evt");
    String y = request.getParameter("y");
    String x = request.getParameter("x");

	boolean result = false;
    Connection conn = null;
    PreparedStatement pstmt = null;
	
	StringBuffer sql = new StringBuffer();
	sql.append(" update filed_2 set");
	sql.append(" evt = 1");
	sql.append(" where evt = ? and col_f = ? and row_f = ?");

try {
	Class.forName("oracle.jdbc.OracleDriver");
	conn = DriverManager.getConnection(
		"jdbc:oracle:thin:@localhost:1521:xe", "Ants", "a1234");
	pstmt= conn.prepareStatement(sql.toString());
	pstmt.setString(1, evt);
	pstmt.setString(2, y);
	pstmt.setString(3, x);
	if (pstmt.executeUpdate() > 0) {
		result = true;
	}
		
} catch(Exception e) {
	e.printStackTrace();
} finally {
	if (pstmt!=null)try{pstmt.close();}catch(Exception e){}
	if (conn !=null)try{conn.close();}catch(Exception e){}
}

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
<script type="text/javascript">
		location.href='main.jsp?x=<%=x%>&y=<%=y%>';
		</script>
</body>

</html>
