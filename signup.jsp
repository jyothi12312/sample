<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup-style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css">
<title>Signup</title>
</head>

<body>
<div id='container'>
  <div class='signup'>
  <h3><center>ONLINE VCD SYSTEM</center></h3>
  <form action="signupAction.jsp"method="post">
  <input type="text" name="name" placeholder="Enter Name"required>
  <input type="email"name="email"placeholder="Enter Email"required>  
  <input type="tel" name="mobileNumber" placeholder="Enter MobileNumber" required> 
   <select name="securityQuestion"required>
   <option value="What was your first car?">What was your first car?</option>
   <option value="What is the name of your first pet?">What is the name of your first pet</option>
   </select>
   <input type="text"name="answer"placeholder="Enter Answer"required>
   <input type="password"name="password"placeholder="Enter Password"required>
     
     <input type="submit" value="Signup">
     </form>
      <h2><a href="login.jsp">Login</a></h2>
  </div>
<%
String msg=request.getParameter("msg");
if("valid".equals(msg)){
	 msg="Successfully Registered";
%>
   <script type="text/javascript">
    var msg = "<%=msg%>";
    alert(msg);
</script>
<%} %>
<%
if("invalid".equals(msg)){
msg="Some thing Went Wrong! Try Again !";
%>
<script type="text/javascript">
    var msg = "<%=msg%>";
    alert(msg);
</script>
<%} %>
</div>
</body>
</html>