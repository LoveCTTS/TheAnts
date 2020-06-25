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

StringBuffer sql = new StringBuffer();
sql.append("select col_f,row_f,evt");
sql.append(" from filed_2");
String user_col = null;
String user_row = null;
String evt = null;


try {
   Class.forName("oracle.jdbc.OracleDriver");
   conn = DriverManager.getConnection(
      "jdbc:oracle:thin:@localhost:1521:xe", "Ants", "1234");
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
<title>Title</title>
</head>
<body>
<% 
while(rs.next()){ %>

      <%= user_col = rs.getString("col_f")%>
      <%= user_row = rs.getString("row_f") %>
      <%= evt = rs.getString("evt") %>
      
   <% }%> 
   
   
<% } catch(Exception e) {
   e.printStackTrace();
} finally {
   if(rs!=null)   try{rs.close();   }catch(Exception e){}
   if(stmt!=null)try{stmt.close();}catch(Exception e){}
   if(conn!=null) try{conn.close(); }catch(Exception e){}
}
%>
</body>
</html>