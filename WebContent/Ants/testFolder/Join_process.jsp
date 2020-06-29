<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="org.apache.commons.codec.digest.DigestUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
boolean result = false;
String user_id = request.getParameter("user_id");
String user_pw = request.getParameter("user_pw");
user_pw = DigestUtils.sha512Hex(user_pw);

Connection conn = null;
PreparedStatement pstmt = null;
StringBuffer sql = new StringBuffer();
sql.append("insert into info(user_id,user_pw)");
sql.append(" values(?,?)");
	
	try {// 서버 프로세스에 연결
		Class.forName("oracle.jdbc.OracleDriver");
		conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "mproject1", "1234");
		pstmt = conn.prepareStatement(sql.toString());
		pstmt.setString(1, user_id);
		pstmt.setString(2, user_pw);
		if(pstmt.executeUpdate()>0){ result = true;}

		
		
	} catch (Exception e) {
		e.printStackTrace();
	} finally {

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

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" type="image/png" href="favicon.png">
<title>Insert title here</title>

<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">

<style type="text/css">
body {
	font-family: 'Jua', sans-serif;
}
</style>
</head>
<body>
<% if(result){ %>
<script>
alert('회원가입에 성공하셨습니다.');
location.href='Login_form.jsp';
</script>
<% }else { %> 
<script type="text/javascript">
alert('회원가입에 실패하였습니다.');
location.href = 'Join_form.jsp';
</script>
<%} %>	
</body>
</html>