<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>


<style>
    body { background-image : url("oasis.jpg"); padding:0px; margin:0px; }
 
   #divPosition {  
     background-color : rgba(255,255,255,0.5);
     position:absolute;
     height:200px;
     width:300px;
     margin:-150px 0px 0px -200px;
     top: 50%;
     left: 50%;
     padding: 5px;
   }
   
</style>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">

  $('html').css({'cursor':'url(Ant_cursor.png), auto'});



</script>
<meta charset="UTF-8">
<link rel="icon" type="image/png" href="/favicon.png">
<title>Login</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
</head>
<body>




<div id="divPosition">
    
<script>
   function mySubmit(index){
      if(index==1){
         document.myForm.action='Login_process.jsp';
      }
      if(index==2){
         document.myForm.action='Join_form.jsp';
      }
      document.myForm.submit();
      
   }
</script>



<form name = 'myForm' method ='post'>
   <table>
      <div class="p-1 mb-2 bg-warning text-dark"> <ion-icon name="bug-sharp"></ion-icon> The Ants Game </div>  
      <tr>
         <th>아이디</th>
         <td>
         <input type ="text" class="form-control" name = "user_id" autofocus="autofocus" placeholder="ID입력" required="required"/></td>
      </tr>
      
      <tr>
         <th>비밀번호</th>
         <td><input type ="password" class="form-control" name = "user_pw" placeholder="PW입력" required="required"/></td>
      </tr>
      
   </table>
      <center>
      <tr>
      <div class="btn-group" role="group" aria-label="Basic example">
  <button type="button" onClick='mySubmit(1)' class="btn btn-success">Login</button>
  <button type="button" onClick='mySubmit(2)' class="btn btn-warning">Join</button>
      </div>
      </tr>
      </center>
</form>
</div>

<script src="https://unpkg.com/ionicons@5.1.0/dist/ionicons.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
</body>
</html>