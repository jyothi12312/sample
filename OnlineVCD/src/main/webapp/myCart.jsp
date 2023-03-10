<%@ page import="proj.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%@include file="header.jsp" %>
<%@include file="footer.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My Cart</title>
<style>
title
{
text-align: center;
font: 300 1.25em/1.4 "Lato", sans-serif;
}
h3
{
	color: yellow;
	text-align: center;
}
</style>
</head>
<body>
<div class="main">
  <h1>My Cart</h1> 
  <section class="shopping-cart">
    <ol class="ui-list shopping-cart--list" id="shopping-cart--list"></ol></section></div>
<%
String msg=request.getParameter("msg");
if("notPossible".equals(msg)){
%>
<h3 class="alert">There is only one Quantity! So click on remove!</h3>
<%} %>
<%
if("inc".equals(msg)){
	msg="Quantity  Increased Successfully!";
%>
<h3 class="alert">
   <script type="text/javascript">
    var msg = "<%=msg%>";
    window.alert(msg);
</script></h3>
<%} %>
<%
if("dec".equals(msg)){
	msg="Quantity  Decreased Successfully!";
%>
<h3 class="alert">
   <script type="text/javascript">
    var msg = "<%=msg%>";
    window.alert(msg);
</script></h3>
<%} %>
<%
if("removed".equals(msg)){
	msg="Product Successfully Removed!";
%>
<h3 class="alert">
   <script type="text/javascript">
    var msg = "<%=msg%>";
    window.alert(msg);
</script></h3>
<%} %>
<table>
<thead>
<%
int total=0;
int sno=0;
try
{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs1=st.executeQuery("select sum(total)from cart where email='"+email+"'and address is NULL");
	while(rs1.next()){
		total=rs1.getInt(1);
	}

%>
          <tr>
            <th scope="col" style="background-color: yellow;"><i class="fa fa-inr"></i>Total: <%out.println(total); %> </th>
            <%if(total>0){ %><th scope="col"><a href="addressPaymentForOrder.jsp">Proceed to order</a></th><%} %>
          </tr>
        </thead>
        <thead>
          <tr>
          <th scope="col">S.No</th>
            <th scope="col">Product Name</th>
            <th scope="col">Category</th>
            <th scope="col"><i class="fa fa-inr"></i> price</th>
            <th scope="col">Quantity</th>
            <th scope="col">Sub Total</th>
            <th scope="col">Remove <i class='fas fa-trash-alt'></i></th>
          </tr>
        </thead>
        <tbody>
      <%
      ResultSet rs=st.executeQuery("select *from product inner join cart on product.id=cart.product_id and cart.email='"+email+"'and cart.address is NULL");
      while(rs.next()){
    	  
      %>
          <tr>
          <%sno=sno+1; %>
           <td><%out.println(sno); %></td>
            <td><%=rs.getString(2) %></td>
            <td><%=rs.getString(3) %></td>
            <td><i class="fa fa-inr"></i><%=rs.getString(4) %> </td>
            <td><a href="incDecQuantityAction.jsp?id=<%=rs.getString(1)%>&quantity=inc"><i class='fas fa-plus-circle'></i></a> <%=rs.getString(8) %> <a href="incDecQuantityAction.jsp?id=<%=rs.getString(1)%>&quantity=dec"><i class='fas fa-minus-circle'></i></a></td>
            <td><i class="fa fa-inr"></i><%=rs.getString(10) %> </td>
            <td><a href="removeFromCart.jsp?id=<%=rs.getString(1)%> ">Remove <i class='fas fa-trash-alt'></i></a></td>
          </tr>
<%
}
}
catch(Exception e){
}
%>
        </tbody>
      </table>
      <br>
      <br>
      <br>

</body>
</html>