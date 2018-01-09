<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
   <% request.setCharacterEncoding("UTF-8");  %>
   <%@ page import="java.sql.*, javax.sql.*, javax.naming.*" %>

   <%
      String id = request.getParameter("id");
  	 System.out.println(id);
      id = new String(id.getBytes("8859_1"), "UTF-8");   
      Connection con = null;
       PreparedStatement pstmt = null;
       ResultSet rs = null;
       String driverName = "com.mysql.jdbc.Driver";
      String dbURL = "jdbc:mysql://localhost:3306/proj";
      try {
           Class.forName(driverName);
           con = DriverManager.getConnection(dbURL, "root", "1234");
           String sql = "select * from member where id=?";
           pstmt = con.prepareStatement(sql);
           pstmt.setString(1,id);
           rs = pstmt.executeQuery();
           System.out.println(pstmt + "<-- pstmt 2");
           
           %><% 
     }catch(Exception e){
          out.println("MySql 데이터베이스 univdb의 student 조회에 문제가 있습니다. <hr>");
           out.println(e.toString());
           e.printStackTrace();
     }

   %>
   <%
      try{
         if(rs.next() || (id==null)){
   %>
         현재 <%=id %> 중복입니다. <br>
   <%
         }else{
            %>
         현재 <%=id %> 사용가능합니다. <br>
         <input type="button" value="현재 아이디 선택" onclick="self.close()">
   <%
         }
      }catch(SQLException e){
         e.printStackTrace();
      }
         finally {
           if(pstmt != null) pstmt.close();
           if(con != null) con.close();
       }
   %>
</body>
</html>