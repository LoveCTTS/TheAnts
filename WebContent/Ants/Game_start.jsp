
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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
    String count = request.getParameter("count");
    String rst = request.getParameter("rst");
    String starttime = request.getParameter("starttime");
    
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
	int count_c = Integer.parseInt(count);
	String name_c = name;
	int rst_c = Integer.parseInt(rst);
	
	%>
	
    
<!DOCTYPE html>
<html>
<head>

<style>
    body { background-image : url("oasis.jpg");padding:0px; margin:0px; }
 
   #divPosition1 {  
     background-color : rgba(255,255,255,0);
     position:absolute;
     height:300px;
     width:300px;
     margin:-150px 0px 0px -200px;
     top: 20%;
     left: 50%;
     padding: 5px;
   }
   
   #divPosition2 {  
     background-color : rgba(255,255,255,0);
     position:absolute;
     height:200px;
     width:300px;
     margin:-150px 0px 0px -200px;
     top: 200%;
     left: 270%;
     padding: 5px;
   }
   #divPosition3 {  
     background-color : rgba(255,255,255,0.4);
     position:absolute;
     height:300px;
     width:300px;
     margin:-150px 0px 0px -200px;
     top: 50%;
     left: 270%;
     padding: 5px;
   }
    #divPosition4{  
     background-color : rgba(255,255,255,0.4);
     position:absolute;
     height:700px;
     width:850px;
     margin:-150px 0px 0px -200px;
     top: 55%;
     left: -65%;
     padding: 5px;
   }

</style>
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
<div id="divPosition1">

<!------------------------------------------------------------------------------>
<!------------------------------------------------------------------------------>
<!---------------------------------------타이머 ---------------------------------->
<!------------------------------------------------------------------------------>
<!------------------------------------------------------------------------------>

<%
	Date nowtime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("hh:mm:ss");

	String endtime = "0";
	
	if(rst_c == 0){
		starttime = sf.format(nowtime);
		
	}
%>

<!------------------------------------------------------------------------------>
<!------------------------------------------------------------------------------>
<!---------------------------------------힌트---------------------------------->
<!------------------------------------------------------------------------------>
<!------------------------------------------------------------------------------>

<div id = "divPosition4">
<center>
<% if ((Math.abs(10-x_c)+Math.abs(10-y_c))<=7){ // 힌트 1%>
사과의 향기가 느껴집니다!
<%} %>

<% if ((Math.abs(10-x_c)+Math.abs(10-y_c))<=3){ // 힌트 2%>
사과의 모습이 보입니다!
<%} %>



<!------------------------------------------------------------------------------>
<!------------------------------------------------------------------------------>
<!---------------------------------------벽과 함정---------------------------------->
<!------------------------------------------------------------------------------>
<!------------------------------------------------------------------------------>



<% if (evt_c == 3 ){ // 보이지 않는 벽%>

<script>
alert('지나갈수 없는 길입니다.');

history.go(-1); 
</script>
<%} %>
 
<% if (evt_c == 4){  // 함정
	count_c = count_c +3;

	%> 
	
	
	<img src="Ant2.png">
	<script>
		alert('끈끈이를 밟았습니다!.');
	</script>
	<% } else{ %>
	<img src = "Ant1.png" >
	<%} %>



</center>
</div>
<!------------------------------------------------------------------------------>
<!------------------------------------------------------------------------------>
<!---------------------------------------임시 출력 화면 ---------------------------------->
<!------------------------------------------------------------------------------>
<!------------------------------------------------------------------------------>

<div id = "divPosition3">
<h2>ID : <%=name_c%></h1>
<h2>Count :<%=count_c %></h1>
<h2>시작시간 : <%=starttime %></h1><br> 
<input type = "hidden" name="count" value="<%=count_c %> "><br>
</div>
<!------------------------------------------------------------------------------>
<!------------------------------------------------------------------------------>
<!---------------------------------------버튼액션 ---------------------------------->
<!------------------------------------------------------------------------------>
<!------------------------------------------------------------------------------>
<div id="divPosition2">
<table>

<tr>
<td></td>
<td>
<form id ="button_up" action="main_zip/button_up.jsp" method="get">
  <input type="hidden" id="x_c" name="x" value="<%=x %>">
  <input type="hidden" id="y_c" name="y" value="<%=y %>">
  <input type="hidden" name="count" value="<%=count_c %>">
  <input type="hidden" name="name" value="<%=name %>">
  <input type="hidden" name="starttime" value="<%=starttime %>">
  <br>
  <% if (!((wal_c == 10)&&(y_c == 19))){ // 위 side에 가면 버튼 사라짐 %>

 <input  TYPE="IMAGE" src="up.jpg" name="Submit" value="Submit" >

 <%} %>
</form>
</td>
<td></td>
</tr>

<tr>
<td>
<form id ="button_l" action="main_zip/button_l.jsp" method="get">
  <input type="hidden" name="x" value="<%=x %>">
  <input type="hidden" name="y" value="<%=y %>">
  <input type="hidden" name="count" value="<%=count_c %>">
  <input type="hidden" name="name" value="<%=name %>">
  <input type="hidden" name="starttime" value="<%=starttime %>">
<% if (!((wal_c == 10)&&(x_c == 1))){ // 왼쪽 side에 가면 버튼 사라짐 %>
 <input  TYPE="IMAGE" src="left.jpg" name="Submit" value="Submit" >
<% }%>
</form>
</td>
<td>
<form id ="button_down" action="main_zip/button_down.jsp" method="get">
  <input type="hidden" name="x" value="<%=x %>">
  <input type="hidden" name="y" value="<%=y %>">
  <input type="hidden" name="count" value="<%=count_c %>">
  <input type="hidden" name="name" value="<%=name %>">
  <input type="hidden" name="starttime" value="<%=starttime %>">
<% if (!((wal_c == 10)&&(y_c == 1))){ // 아래 side에 가면 버튼 사라짐 %>
 <input  TYPE="IMAGE" src="down.jpg" name="Submit" value="Submit" >

<%} %>
</form>
</td>


<td>
<form id ="button_r" action="main_zip/button_r.jsp" method="get">
  <input type="hidden" name="x" value="<%=x %>">
  <input type="hidden" name="y" value="<%=y %>">
  <input type="hidden" name="count" value="<%=count_c %>">
  <input type="hidden" name="name" value="<%=name %>">
  <input type="hidden" name="starttime" value="<%=starttime %>">
  <% if (!((wal_c == 10)&&(x_c == 19))){ // 오른쪽 side에 가면 버튼 사라짐 %>
 <input  TYPE="IMAGE" src="right.jpg" name="Submit" value="Submit" >
 <%} %>
</form>
</td>
</tr>
</table>
</div>
<!-- 키보드 마우스 입력 -->

<script>

window.onkeyup=function(){  

	  if((event.keyCode == 37) && (<%=x %> != 1)){ //좌
		  this.document.getElementById("button_l").submit();
	  
	  }else if((event.keyCode == 38)&&(<%=y %> != 19)){//상
		  this.document.getElementById("button_up").submit();

	  } else if((event.keyCode == 39)&&(<%=x %> != 19)){//우
		  this.document.getElementById("button_r").submit();

	  }else if((event.keyCode == 40)&&(<%=y %> != 1)){//하
		  this.document.getElementById("button_down").submit();

	  }

};</script> 

<!------------------------------------------------------------------------------>
<!------------------------------------------------------------------------------>
<!---------------------------------------클리어 ---------------------------------->
<!------------------------------------------------------------------------------>
<!------------------------------------------------------------------------------>
<% if (( evt_c == 2)){ 
	endtime = sf.format(nowtime);
	%>

<script type="text/javascript">
alert('Clear!');
location.href='Ranking_w.jsp?name=<%=name%>&starttime=<%=starttime%>&endtime=<%=endtime%>&count=<%=count%>';
</script>
</body>


<%
}
		
}catch (Exception e) {
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