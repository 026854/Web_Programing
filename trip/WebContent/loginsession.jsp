<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%String id = "";
id = (String)session.getAttribute("id");  %>
</head>
<body>
<%

try{
   
if(id==null){                       // id가 Null 이거나 없을 경우
   %>
   <script type="text/javascript">location.href="LoginForm.jsp";</script>
   <%
   System.out.println("x");
} 
else {
   %>
   <script>parent.location.href="main.jsp";</script>
   <%
   System.out.println("o");
}
}catch(Exception ex) {
}
%>
</body>
</html>