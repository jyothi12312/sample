<%@ page import="proj.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<link rel="stylesheet" href="css/addressPaymentForOrder-style.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Home</title>
<script> if(window.history.forward(1)!=null)
	window.history.forward(1);</script>


</head>
<body>
<br>
<table>
<thead>
<%
String email=session.getAttribute("email").toString();
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
          <th scope="col"><a href="myCart.jsp"><i class='fas fa-arrow-circle-left'> Back</i></a></th>
            <th scope="col" style="background-color: yellow;">Total: <i class="fa fa-inr"></i> <%out.println(total); %></th>
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
            <td><i class="fa fa-inr"></i> <%=rs.getString(4) %> </td>
            <td>  <%=rs.getString(8) %> </td>
            <td><i class="fa fa-inr"></i> <%=rs.getString(10) %> </td>
            </tr>
         <%} 
         ResultSet rs2=st.executeQuery("select *from users where email='"+email+"'");
         while(rs2.next())
         {
        	 %>
         
        </tbody>
      </table>      
 
  <form action="addressPaymentForOrderAction.jsp" method="post">
 <div class='container'>
   <div class='signup'>
  <input type="text"name="address" value="<%=rs2.getString(7)%>" placeholder="Enter Address"required>
 
  <input type="text" name="city"  value="<%=rs2.getString(8)%>" placeholder="Enter city"required>  
 
  <input type="text" name="state"  value="<%=rs2.getString(9)%>" placeholder="Enter state" required>  

  <input type="text" name="country"  value="<%=rs2.getString(8)%>" placeholder="Enter country"required>  
 
  <input type="number"name="mobileNumber"placeholder="Enter MobileNumber"required> 
       
 <select class="input-style"name="paymentMethod">
 <option value="Cash on delivery(COD)">Cash On delivery(COD)</option>
  <option value="Online Payment">Online Payment(COD)</option>
  </select>

   <h5>Pay online on this OnlineVCDSystem@pay.com</h5>
   <input type="text" name="transcationId" placeholder="Enter Transcation ID">
   
       <h5 style="color: red">*If there is no address its mean that you did not set you address!</h5>
   <h5 style="color: red">*This address will also updated to your profile</h5>
    
    <button class="button"type="submit">Proceed to Generate Bill</button>
     </div>
 </div>
</form>

<%
         }
}
catch(Exception e)
{
 out.println(e);
}
%>
      <br>
      <br>
      <br>

</body>
</html>