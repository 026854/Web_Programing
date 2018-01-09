<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <style>
     @import url(http://fonts.googleapis.com/earlyaccess/hanna.css);
      table{background-color:mistyrose;
            border: 1px solid gray;}
      h2{
         font-family: 'Hanna', serif;
       font-size: 2em;}
       #foottext{font-size: 17px;}
    </style>
    
     <script type="text/javascript">
    
        function checkValue()
        {
            inputForm = eval("document.loginInfo");
            if(!inputForm.id.value)
            {
                alert("아이디를 입력하세요");    
                inputForm.id.focus();
                return false;
            }
            if(!inputForm.password.value)
            {
                alert("비밀번호를 입력하세요");    
                inputForm.password.focus();
                return false;
            }
        }
    
        // 회원가입 버튼 클릭시 회원가입 화면으로 이동
        function goJoinForm() {
            location.href="joinForm.jsp";
        }    
    </script>
 
    
</head>
<body>
   <form name="loginInfo" method="post" action="login_check.jsp" 
                onsubmit="return checkValue()">
        
  <h2>로그인<h2>
  <p>
  <hr>
  <table border="0">
   <tr>
    <th>ID
    <input type = "text" name = "id"></th></tr>
   <tr>
    <th>PW
    <input type = "password" name = "pw"></th></tr>
    </table>
  <p>
 <input type="submit" value="Login">
<input type="reset" value="Reset">
</form>
<input type="button" value="회원가입"
onclick="goJoinForm()">


</body>
<hr>
<footer><label for="" id="foottext">@Hallym 2017 최지은</label></footer>
</html>
