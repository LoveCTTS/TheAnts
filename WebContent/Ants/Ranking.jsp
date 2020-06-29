<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="org.apache.commons.codec.digest.DigestUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%
   int Place = 1; //랭킹 등수 표기를 위한 변수
   
  
   String user_id = request.getParameter("name");
   Connection conn = null;
   Statement stmt = null;
   ResultSet rs = null;
   StringBuffer sql = new StringBuffer();
   sql.append("select user_id, record, count");
   sql.append(" from ranking ");
   sql.append("order by record");
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
	background-image : url("oasis.jpg");
   padding: 0px;
   margin: 0px;
}

#divPosition {
   
   background-color : rgba(255,255,255,0.5); 
   position: absolute;
   height: 570px;
   width: 700px;
   margin: -150px 0px 0px -200px;
   top: 40%;
   left: 40%;
   padding: 5px;
}

</style>
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
</head>

<body>




   
<div id="divPosition">
   
   <center>
     <h1 class="display-4"><ion-icon name="ribbon-sharp"></ion-icon>Ranking</h1>
     </center>
     
   
    <center>

<table class="table table-bordered"  border="2" background:black>

 <tr align = "center" bgcolor="gold" class="lead" class = "text-white-Large">
   
      <th>등수</th>
      <th>이름</th>
      <th>기     록</th>
      <th>이동 횟수</th>
   </tr>
</table>
<div style="overflow:auto; width:670px; height:300px;">
   <table class="table table-bordered" bgcolor="white" border="2" background:black>
  
<%      while(rs.next()) { %>

<tr align = "center" pclass = "lead" >

   <td><%=Place++ %></td> 
   <td><%=rs.getString("user_id") %></td>
   <td><%=rs.getInt("record")/60 %>분 <%=rs.getInt("record")-(rs.getInt("record")/60)*60 %>초</td>
   <td><%=rs.getInt("count") %>
</tr>
<%} %>


</table>
</div>


</center>
   <p>
        <%-- float-left--%>
    <form action="preset0.jsp" method = "post">
			<input type="hidden" name ="name" value ="<%=user_id%>">
			
  			<button type="submit" class="btn btn-success btn-block">게임시작</button>
  	</form>
   <form action = "Login_form.jsp">
      <%-- float-right--%>
      <button type="submit" class = "btn btn-warning btn-block">홈으로 돌아가기</button>
   </form>
   
         
         
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
</div>

<script src="https://unpkg.com/ionicons@5.1.0/dist/ionicons.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
</body>
</html>
