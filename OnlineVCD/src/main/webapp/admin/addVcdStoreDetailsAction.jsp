<%@ page import="proj.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<% 
String storename=request.getParameter("storename");
String storeaddress=request.getParameter("storeaddress");
String storelocation=request.getParameter("storelocation");

try{
	
	Connection con=ConnectionProvider.getCon();
	PreparedStatement ps=con.prepareStatement("insert into vcdstore values(?,?,?)");
	ps.setString(1,storename);
	ps.setString(2,storeaddress);
	ps.setString(3,storelocation);
	
    ps.executeUpdate();
    response.sendRedirect("addVcdStoreDetails.jsp?msg=done");
    
}
catch(Exception e){
	 response.sendRedirect("addVcdStoreDetails.jsp?msg=wrong");
}
%>