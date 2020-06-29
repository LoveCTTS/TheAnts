<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="org.apache.commons.codec.digest.DigestUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   <% 
   String name =  request.getParameter("name");
   String start_time = request.getParameter("starttime");
   String end_time = request.getParameter("endtime");
   int count = Integer.parseInt(request.getParameter("count"));
   
   String[] data1 =  end_time.split(":");
   String[] data2 = start_time.split(":");
   
   int end_second =0;
   int end_minute = 0;
   int start_minute = 0;
   int start_second = 0;
   int end_hour = 0;
   int start_hour = 0;
   for(int i =0 ; i<3; i++){
	   out.println(data1[i]);
	 
   }
   for(int i=0;i<3; i++){
	   out.println(data2[i]);
   }
   
   
   end_hour = Integer.parseInt(data1[0]);
   end_minute = Integer.parseInt(data1[1]);
   end_second = Integer.parseInt(data1[2]);
   
   start_hour = Integer.parseInt(data2[0]);
   start_minute = Integer.parseInt(data2[1]);
   start_second = Integer.parseInt(data2[2]);
   
   int time = (end_hour*3600 - start_hour*3600)+ (end_minute*60 - start_minute*60) + (end_second - start_second);
   
   boolean result = false;

   Connection conn = null;
   PreparedStatement pstmt = null;
   StringBuffer sql = new StringBuffer();
   sql.append("insert into Ranking(user_id,count,record)");
   sql.append(" values(?,?,?)");
   	
   	try {// 서버 프로세스에 연결
   		Class.forName("oracle.jdbc.OracleDriver");
   		conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "Ants", "1234");
   		pstmt = conn.prepareStatement(sql.toString());
   		pstmt.setString(1,name);
   		pstmt.setInt(2,count);
   		pstmt.setInt(3,time);
   		
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
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">

<style type="text/css">
body {
	font-family: 'Jua', sans-serif;
}
</style>
</head>
<body>

<form action="bestrecord_r.jsp" method= "get" id = "best_record_over_r">
  			<input type="hidden" name ="name" value ="<%=name%>" >
  			<input type="hidden" name ="count" value ="<%=count%>" >
  			<input type="hidden" name ="time" value ="<%=time%>" >
  			<input type="submit" value="Submit">
  			</form>

<script type="text/javascript">
this.document.getElementById("best_record_over_r").submit();
</script>


<script src="https://unpkg.com/ionicons@5.1.0/dist/ionicons.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
</body>
</html>