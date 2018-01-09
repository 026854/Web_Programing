<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
@import url(http://fonts.googleapis.com/earlyaccess/hanna.css);
@import url(http://fonts.googleapis.com/earlyaccess/nanumpenscript.css);
body{background-color: #d8bfd8;}
table{text-align:left;
      width: 370px;}
th:hover{background-color:mistyrose;}
th{font-family: 'Nanum Pen Script', serif;
   font-size: 20px;}
h2{text-align: center;
  font-family: 'Hanna', serif;
  font-size: 40px;
}
input{width: 250px;}
</style>

 <script type="text/javascript">
    
        // 필수 입력정보인 아이디, 비밀번호가 입력되었는지 확인하는 함수
        function checkValue()
        {
            if(!document.userInfo.id.value){
                alert("아이디를 입력하세요.");
                return false;
            }
            
            if(!document.userInfo.pw.value){
                alert("비밀번호를 입력하세요.");
                return false;
            }
     
            
            if(!document.userInfo.name.value){
                alert("이름를 입력하세요.");
                return false;
            }
            
            if(!document.userInfo.con.value){
                alert("주소를 입력하세요.");
                return false;
        }
        else{
        	alert("회원가입이 완료되었습니다.");
        	return true;
        	location.href="register.jsp"
        }
        }
        // 취소 버튼 클릭시 로그인 화면으로 이동

    </script>
    
    
</head>
<body>



<h2>회원가입</h2>
<hr>
<form method="post" action="register.jsp" name="userInfo" 
                onsubmit="return checkValue()">
<table border="0" align="center" style="WIDTH: 450px;">
 <tr>
   <th>ID :</th>
     <td><input type = "text" id = "id" name = "id" placeholder="아이디를 입력해 주세요."></td>
     <td><input type="button" value="중복 확인" onclick="check_idf()" style="WIDTH: 60pt;"></td>
 </tr>
   <tr>
   <th>PW :</th>
    <td> <input type = "password" name = "pw" placeholder="비밀번호를 입력해 주세요."></td>
</tr>
 <tr>
   <th>이름 :</th>
    <td> <input type = "text" name = "name" placeholder="홍길동"></td>
    
     </tr>
      
    <tr>
   <th>관심 있는 나라 :</th>
    <td> <input type = "text" name = "con"></td></tr>
    <tr>
    <td colspan="3"><center><input type="submit" value="회원가입" style="WIDTH: 60pt;">
<input type="reset" value="다시쓰기" style="WIDTH: 60pt;"></center></td>
    </tr>
</table>
  </form>
   <script>
        var id = document.getElementById("id");
       	function check_idf(){
       		window.open("check_id.jsp?id=" + id.value, "", "width=400, height=300");
       	}
     </script>
</body>
</html>