<%@page import="javafx.scene.control.Alert"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
   <%
      request.setCharacterEncoding("UTF-8");
   %>
   <%

   Class.forName("com.mysql.jdbc.Driver");

   String url = "jdbc:mysql://localhost:3306/proj";
   String idd = "root";
   String pass = "1234";
   
   try {
   Connection conn = DriverManager.getConnection(url, idd, pass);
   
      String name = request.getParameter("name");
      String id = request.getParameter("id");
      String password= request.getParameter("pw");
      String con = request.getParameter("con");
	Statement stmt = conn.createStatement();
      
      
      
      
      
      String sql = "insert into member( id , pw, name,con) values(? ,? ,?, ?)";
      PreparedStatement pstmt = conn.prepareStatement(sql);
      System.out.println(pstmt + "<-- pstmt 1");
      
      pstmt.setString(1,id);
      pstmt.setString(2,password);
      pstmt.setString(3,name);
      pstmt.setString(4,con);
       
      System.out.println(pstmt + "<-- pstmt 2");
      
      pstmt.executeUpdate();
      
      pstmt.close();
      conn.close();
   } catch(Exception e) {
	   
   }
   %>

   <jsp:forward page="main.jsp" />
</body>
</html>