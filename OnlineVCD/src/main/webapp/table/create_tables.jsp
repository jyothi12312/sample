<%@page import="proj.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
try{
  Connection con=ConnectionProvider.getCon();
  Statement st=con.createStatement();
  String q1="create table users(name varchar(20),email varchar(20)primary key,mobileNumber bigint,securityQuestion varchar(25),answer varchar(20),password varchar(20),address varchar(30),city varchar(10),state varchar(15),country varchar(15))";
  String q2="create table product(id int,productname varchar(20),category varchar(20),price int,active varchar(20))";
  String q3="create table cart(email varchar(30),product_id int,quantity int,price int,total int,address varchar(50),city varchar(30),state varchar(30),country varchar(30),mobileNumber bigint,orderDate varchar(30),deliveryDate varchar(30),paymentMethod varchar(30),transcationId varchar(30),status varchar(10),remove varchar(10))";
  String q4="create table vcdstore(storename varchar(20),storeaddress varchar(25),storelocation varchar(20))";
  System.out.println(q1);
  System.out.println(q2);
  System.out.println(q3);
  System.out.println(q4);
  st.execute(q1);
  st.execute(q2);
  st.execute(q3);
  st.execute(q4);
  System.out.print("Table created");
  con.close();
  }
  catch(Exception e){
  System.out.print(e);
  }
  %>