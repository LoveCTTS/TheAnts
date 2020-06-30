
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
     height: 300px;
     width:300px;
     margin:-150px 0px 0px -200px;
     top: 55%;
     left: 270%;
     padding: 5px;
   }
    #divPosition4{  
     background-color : rgba(255,255,255,0.4);
     position:absolute;
     height:670px;
     width:900px;
     margin:-150px 0px 0px -200px;
     top: 55%;
     left: -60%;
     padding: 5px;
   }
  
   

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">

  $('html').css({'cursor':'url(Ant_work.png), auto'});



</script>
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
<title>Game</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
</head>
<body>
<!------------------------------------------------------------------------------>
<!------------------------------------------------------------------------------>
<!---------------------------------------타이머 ---------------------------------->
<!------------------------------------------------------------------------------>
<!------------------------------------------------------------------------------>
<div id="divPosition1">
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
<!---------------------------------------임시 출력 화면 ------------------------>
<!------------------------------------------------------------------------------>
<!------------------------------------------------------------------------------>

<div id = "divPosition3">
<h2 class = "text-secondary">ID : <%=name_c%></h2><br>
<h2 class = "text-danger">Count :<%=count_c %></h2><br>
<h2 class = "text-info">시작시간 : <%=starttime %></h2><br>
<input type = "hidden" name="count" value="<%=count_c %> "><br>

<center>
<!-- Button trigger modal -->
<button type="button" class="btn btn-secondary" data-toggle="modal" data-target="#Ants">
  게임 설명서
</button>

<!-- Modal -->
<div class="modal fade" id="Ants" tabindex="-1" role="role" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-xl modal-dialog-scrollable">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">게임설명</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
     <img src = "Map.png"><br>
     1. 시작버튼을 누르면 랜덤 위치에 개미(유저) 배정 <br> 2. 사과와 가까운 위치에는 배정되지 않음 <br>
     3. 개미는 한 칸씩 이동 합니다. <br> 4. 테이블의 경계를 넘어가려고하면, 특정 방향키가 사라집니다. <br>
     5. 목표와의 거리에 따라 힌트를 제공합니다. <br> 6. 지나갈수 없는 길과 끈끈이(count +5)가 있어 목표달성을 방해합니다. <br>
     8. 총 시간을 측정하여 랭킹을 제공합니다.
     
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
</center>

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

 <input  TYPE="IMAGE" src="up.png" name="Submit" value="Submit" >

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
 <input  TYPE="IMAGE" src="left.png" name="Submit" value="Submit" >
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
 <input  TYPE="IMAGE" src="down.png" name="Submit" value="Submit" >

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
 <input  TYPE="IMAGE" src="right.png" name="Submit" value="Submit" >
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

</div>


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
	
<script src="https://unpkg.com/ionicons@5.1.0/dist/ionicons.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
</body>





</html>