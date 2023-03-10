
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup-style.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css">
<title>Login</title>
</head>
<body>
<div id='container'>
  <div class='signup'>
     <form action="loginAction.jsp"method="post">
     <h3><center>ONLINE VCD SYSTEM</center></h3>
     <h3><center>LOGIN</center></h3>
     <input type="email" name="email"placeholder="Enter Email"required>
     <input type="password" name="password" placeholder="Enter Password"required>
     <input type="submit"value="login">
     </form><br>
      <a href="forgotPassword.jsp">Forgot Password?</a>
      <h4> <a href="signup.jsp">Don't have an account? <span class="text-primary">Create One</span></a></h4>
  </div>

  <%
  String msg=request.getParameter("msg");
  if("notexist".equals(msg))
  {
	 msg="Incorrect Username or Password";
  %>
   <script type="text/javascript">
    var msg = "<%=msg%>";
    window.alert(msg);
</script>
  
<%} %>

</div>

</body>
</html>



