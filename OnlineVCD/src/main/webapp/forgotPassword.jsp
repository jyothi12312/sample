<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup-style.css">
<title>ForgotPassword</title>
</head>
<body>
<div id='container'>
  <div class='signup'>
  <form action="forgotPasswordAction.jsp" method="post">
  <input type="text"name="name"placeholder="Enter Name"required>
  <input type="email"name="email"placeholder="Enter Email"required>  
  <input type="number"name="mobileNumber"placeholder="Enter MobileNumber"required> 
   <select name="securityQuestion"required>
   <option value="What was your first car?">What was your first car?</option>
   <option value="What is the name of your first pet?">What is the name of your first pet</option>
   </select>
   <input type="text"name="answer"placeholder="Enter Answer"required>
  <input type="password"name="newPassword" placeholder="Enter your new password to set"required>
     <input type="submit"value="Save">
       </form>
      <h2><a href="login.jsp">Login</a></h2>
  </div>
<%
String msg=request.getParameter("msg");
if("done".equals(msg)){

	 msg="Password Changed Successfully!";
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