<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="org.apache.commons.codec.digest.DigestUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String user_id = request.getParameter("user_id");
String user_pw = request.getParameter("user_pw");
user_pw = DigestUtils.sha512Hex(user_pw);
String user_name = null;
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" type="image/png" href="/favicon.png">
<style>
body {
	padding: 0px;
	margin: 0px;
}

#divPosition {
	border: 1px solid #5D5D5D;
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

	<%
		Connection conn = null;
	PreparedStatement stm = null;
	ResultSet rs = null;
	StringBuffer sql = new StringBuffer();
	sql.append(" select user_id, user_pw ");
	sql.append(" from personal_info");
	sql.append(" where  user_id= ? and user_pw= ?");

	try {// 서버 프로세스에 연결
		Class.forName("oracle.jdbc.OracleDriver");
		conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "Ants", "1234");
		stm = conn.prepareStatement(sql.toString());
		stm.setString(1, user_id);
		stm.setString(2, user_pw);
		rs = stm.executeQuery();

		if (rs.next()) { // 아이디 비번 일치
	%>
	<center>
	<h1>MENU</h1>
	</center>
	<div id="divPosition">



			<caption>
				<%
					out.println("(" + user_id + ") 님이 로그인했습니다.");
				%>
			</caption>
			<br> <br> <br>

			<caption>최고기록 :</caption>
			<br> <br> <br> <br> <br> <br>
			<form action="game_start.jsp">
				<button type="submit">게임시작</button>
			</form>
			<form action="ranking.jsp" method="post">
				<br>

				<button type="submit">랭킹</button>
			</form>

	</div>
	<%
		} else {// 아이디 비번 불일치
	%>

	<script type="text/javascript">
		alert('아이디 혹은 비밀번호가 틀립니다.');
		location = history.back();
	</script>

	<%
		}
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		if (rs != null)
			try {
		rs.close();
			} catch (Exception e) {
			}
		if (stm != null)
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

		
		
</body>
</html>