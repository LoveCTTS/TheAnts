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
	background-color : rgba(255,255,255,0.5);
	
	position: absolute;
	height: 360px;
	width: 400px;
	margin: -150px 0px 0px -200px;
	top: 40%;
	left: 50%;
	padding: 5px;
}
</style>
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
</head>
<body>
<img src="oasis.jpg">

	<%
	Connection conn = null;
	PreparedStatement stm = null;
	ResultSet rs = null;
	StringBuffer sql = new StringBuffer();
	sql.append("select I.user_id, R.best_record"); //띄어쓰기 잘했는지 보세요.
	sql.append(" from info I join ranking R");
	sql.append(" on I.user_id = ? and I.user_pw = ?");

	try {// 서버 프로세스에 연결
		Class.forName("oracle.jdbc.OracleDriver");
		conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "mproject1", "1234");
		stm = conn.prepareStatement(sql.toString());
		stm.setString(1, user_id);
		stm.setString(2, user_pw);
		rs = stm.executeQuery();

		if (rs.next()) { // 아이디 비번 일치
	%>
	
	
	<div id="divPosition">


			<center>
			<h1>MENU</h1>
			</center>
			<caption><center>
				<%
					out.println("(" + rs.getString("user_id") + ") 님이 로그인했습니다.");
				%>
			</center>	
			</caption>
			
			
				
  				<center><h1 class="lead">최고기록 </h1></center>
  				<br>
  				<center><h1 class = "text-primary display-4"><%=rs.getInt("best_record")/60 %>분 <%=rs.getInt("best_record")-(rs.getInt("best_record")/60)*60 %>초</h1></center>
  				
		
			<br><br><br><br>
			
			
			
			<form action="Game_start.jsp" method = "post">
  			<button type="submit" class="btn btn-success float-left">게임시작</button>
  			</form>
  			
  			<form action="Ranking.jsp" method= "post">
  			<button type="submit" class="btn btn-warning float-right">랭킹</button>
  			</form>
			
		
			

	</div>
	<%
		} else {// 아이디 비번 불일치
	%>

	<script type="text/javascript">
		alert('아이디 혹은 비밀번호가 틀립니다.');
		location = history.back();
	</script>
	<%} %>

	<%
		
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

		
<script src="https://unpkg.com/ionicons@5.1.0/dist/ionicons.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>		
</body>
</html>