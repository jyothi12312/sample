<%@ page import="proj.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%@include file="adminHeader.jsp" %>
<%@include file="../footer.jsp" %>
<html>
<head>
<link rel="stylesheet" href="../css/addNewProduct-style.css">
<title>Add Vcd Store Details</title>
</head>
<body>
<%
String msg=request.getParameter("msg");

if("done".equals(msg))
{
%>
<h3 class="alert">Store Details Added Successfully!</h3>
<%} %>
<%
if("wrong".equals(msg))
{
%>
<h3 class="alert">Some thing went wrong! Try Again!</h3>
<%} %>
<%
int id=1;
try{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	/*ResultSet rs=st.executeQuery("select max(id)from vcdstore");
	while(rs.next()){
		id=rs.getInt(1);
		id=id+1;
	}*/
}
catch(Exception e){
	out.println(e);
}
%>
<form action="addVcdStoreDetailsAction.jsp" method="post">

<div class="center">
 <h3>Enter Store Name</h3>
 <input class="input-style" name="storename"placeholder="Enter Store Name"required>
<hr>
</div>

<div class="center">
<h3>Enter Store Address</h3>
  <input class="input-style" type="text"name="storeaddress"placeholder="Enter Store Address"required>
<hr>
</div>

<div class="center">
<h3>Enter Store Location</h3>
  <input class="input-style" type="text"name="storelocation"placeholder="Enter Store Location"required>
<hr>
</div>

</div>
 <button class="button">Save <i class='far fa-arrow-alt-circle-right'></i></button>
</form>
</body>
<br><br><br>
</body>
</html>