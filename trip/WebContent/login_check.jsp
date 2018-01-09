<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@ page import="java.sql.*"%>
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
   //id passwd가져오기
   String id = request.getParameter("id");
   String pw = request.getParameter("pw");
   ResultSet rs = null;
   ResultSet rs2 = null;
   
   PreparedStatement pstmt = null;
   PreparedStatement pstmt2 = null;

   String sql = "";
   String sql2 = "";
   String con="";

   try{
	   Connection conn = DriverManager.getConnection(url, idd, pass);
    sql = "select pw,con from member where id=?";
   // sql2 = "select con from member where id=?";
     pstmt = conn.prepareStatement(sql);
     pstmt.setString(1, id);
     
   //  pstmt2 = conn.prepareStatement(sql2);
   //  pstmt2.setString(1, id);
    
   //4단계 실행 => rs
     rs = pstmt.executeQuery();
  //   rs2 = pstmt2.executeQuery();
         

    //5단계 데이터가 있으면 아이디있음
       
    if(rs.next()){
     //id있음
     String dbPass=rs.getString("pw");
     String con1=rs.getString("con");
     if(pw.equals(dbPass)){ 
      session.setAttribute("id", id);
      session.setAttribute("con", con1);
      %>
   <script type="text/javascript">
   alert("로그인이 성공적으로 되었습니다!");
      parent.location.href="loginsession.jsp";
      </script>
   <%
     }else
     {
      %>
   <script type="text/javascript">
      alert("id 또는 비밀번호를 확인해주세요.");
      history.back();
      </script>
   <%
     }
    }else{
     %>
   <script type="text/javascript">
     alert("id 또는 비밀번호를 확인해주세요.");
     history.back();
     </script>
   <% 
    }
   }catch (Exception e) {
    e.printStackTrace();
   }
   %>
</body>
</html>