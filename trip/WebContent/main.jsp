<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>여행 tip</title>
<script language="javascript" src="jquery-1.9.1.min.js" type="text/javascript"></script>
<script language="javascript" src="jquery-ui.min.js" type="text/javascript"></script>
<script language="javascript" src="jq.rolling.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="jq.rolling.css"/>

<%@ page import="java.util.ArrayList, tripDataB.dangerContryEntity" %>
<%String id = "";
id = (String)session.getAttribute("id");

String con = "";
con = (String)session.getAttribute("con");%>
</head>
<body>

	<style media="screen">
@import url(http://fonts.googleapis.com/earlyaccess/nanumpenscript.css);

@import url(http://fonts.googleapis.com/earlyaccess/hanna.css);

h2 {
	text-align: center;
	font-size: 80px;
	margin-bottom: 25px;
	font-family: 'Nanum Pen Script', serif;
	margin-top: 15px;
}

body  {
	background-color: #fff0f5;
	margin:0 auto;
	
}

#h2 {
	text-decoration: none;
	color: black;
}

#login {
	float: right;
	font-size: 0.7em;
	text-align: center;
	
}

header {
	margin-left: 15%;
	margin-right: 15%;
	width: 70%;
}

#menubar ul li {
	display: inline;
	list-style-type: none;
	padding: 0px 30px;
}

#menubar {
	padding-top: 40px;
	padding-bottom: 10px;
	width: 1100px;
	margin:0 auto;
}

#menubar ul {
	margin: 0px;
	padding: 0px;
	text-align: center;
	background-color: #ffe4c4;
	padding-top: 3px;
    height: 25px;
}

#menubar ul li a {
	text-decoration: none;
	font-size: 1.4em;
	font-family: 'Hanna', serif;
}

#menubar ul li a:hover {
	color: violet;
}

#hotel {
	background-color: #dde5ff;
	height: 30px;
	border-radius: 15px 15px 0px 0px;

	
}
#air {
	background-color: #dde5ff;
	height: 30px;
	border-radius: 15px 15px 0px 0px;
}

#login_1 {
	text-decoration: none;
    color:black;
    font-size: 16px;
    text-align:center;

}

#login_2{
	text-decoration: none;
    color:black;
    font-size: 16px;
    text-align:center;
}
#pic {
	margin: auto;
}

#pe {
	width:170px;
}
#blank {
	width:200px;
	border-top: 1px dotted black;
}
.tr_u { 
	border-top: 1px dotted black;
}
.reserv {
	border-bottom: 1px dotted black;
}
h4{
	margin-top: 0px;
    margin-bottom: 10px;
    color: red;
}
#logindiv{
	width: 1100px;
    margin: 0 auto;
}


	</style>
	<header>
      <h2><a href="main.jsp" id="h2">여행 tip! tip!</a></h2>
     
    </header>
 <div id="logindiv">
<table id="login" >
        <tr>
        <%

try{
   
if(id==null){                       // id가 Null 이거나 없을 경우
   %>
   		 <td width="50px"><a href="loginForm.jsp" id="login_1">로그인</a></td>
          <td width="20px">|</td>
          <td width="70px"><a href="joinForm.jsp" id="login_2">회원 가입</a></td>
   <%
   System.out.println("x");
} 
else {
   %>
  <td><%=id %>님 환영합니다!</td><td><button type="button" onclick="location.href='logout.jsp' ">로그 아웃</button></td>
   <%
   System.out.println("o");
}
}catch(Exception ex) {
}
%>

        </tr>
      </table></div>
    <nav id="menubar">
     
       <ul>
         <li><a href="info.html">여행정보/가이드북</a></li>
         <li><a href="http://www.tourtips.com/ap/tmall/main/" target="_blank">티켓/투어</a></li>
         <li><a href="ticket.html">항공</a></li>
         <li><a href="hotel.jsp">호텔</a></li>
       </ul>
    </nav>
    
     <jsp:useBean id="dcon" class="tripDataB.dangercontrydatabase" scope="page"></jsp:useBean>
    <%
    	ArrayList<dangerContryEntity>list = dcon.getcontryList();
    	int counter = list.size();
    	String contries="";
    	if(counter>0){
    		for(dangerContryEntity conName: list){
    			contries += " / "+conName.getContryName();
    		}
    	}
    %>
    
    
    <h4 style="width:1100px; margin: 0 auto;">
       <marquee scrolldelay="70" >위험한 국가 : <%=contries%></marquee></h4>
    <div>
    <div id="danger">
   	 <div id="pic">
    	<div id="rolling">
    	  <ul>
  			 <li class="sp01"></li>
   			 <li class="sp02"></li>
  			 <li class="sp03"></li>
  			 <li class="sp04"></li>
 		 </ul>
    	</div>
   <ul class="pages"></ul>
    </div>
      </div> 
      
      <script>
 $("#rolling").rolling(820,450,{autoscroll:1, delay:1500});
</script> 

 <script type="text/javascript">
      function conho(){
        /////////////
			
          var sels = document.getElementById("hotelname");
          var vals=sels.value;
        ////////////////start값/////


          var dates=document.getElementById("checkin");
          var valdates=dates.value;

          var datee=document.getElementById("checkout");
          var valdatee=datee.value;

          var pe = document.getElementById("pe");
          var valpe=pe.options[pe.selectedIndex].text;

        // alert(valdates);
        var cons="입력한 정보를 확인해 주세요 :) 맞다면 확인을 눌러주세요.\n\n"+"호텔 명:"+vals+"\n체크 인 : "+valdates+"\n체크 아웃 : "+valdatee+"\n인원 : "+valpe;

         ////////////end값////////
         var conf= confirm(cons);
         if( conf == true ){
        	 alert("확인선택!");
         }else{
              alert("취소선택!");
         }
      }
    </script>
 
        <div>
         <form method="get" action="hotelSearch.jsp">
        <table class="reserv" align="center" >
          <tr>
            <td id="hotel" value="1" >최저가 호텔 검색</td>
          </tr>
          <tr>
            <th class="tr_u">여행지</th>
            <th class="tr_u">체크인</th>
            <th class="tr_u">체크아웃</th>
            <th class="tr_u">객실</th>
            <th id="blank"></th>
          </tr>
          <tr><%

try{
   
if(id==null){                     
   %>
   		<td><input type="text" name="hotelname" value="" id="hotelname" placeholder="ex) 파리"></td>
   <%

} 
else {
   %>
  <td><input type="text" name="hotelname" value=<%=con %> id="hotelname"></td>
   <%

}
}catch(Exception ex) {
}
%>
          
            <td><input type="date" name="indate" id="checkin" value=""></td>
            <td><input type="date" name="outdate" id="checkout" value=""></td>
            <td><select id="pe" name="pe">
                   <option value="1,1">객실: 1 성인: 1</option>
                  <option value="1,2">객실: 1 성인: 2</option>
                  <option value="1,3">객실: 1 성인: 3</option>
                  <option value="1,4">객실: 1 성인: 4</option>
                  <option value="2,2">객실: 2 성인: 2</option>
                </select>
              </td>
          </tr>
          <tr>
             <td colspan="4" id="button" ><input type="submit" value="검색"></td>
          </tr>
          
		 </table>
		 </form>
		 </div>
	 <script type="text/javascript">
	    function conair(){
	
	        var sels = document.getElementById("sels");
	        var vals=sels.options[sels.selectedIndex].text
	      ////////////////start값/////
	
	        var sele = document.getElementById("sele");
	        var vale=sele.options[sele.selectedIndex].text;
	
	        var dates=document.getElementById("dates");
	        var valdates=dates.value;
	
	        var datee=document.getElementById("datee");
	        var valdatee=datee.value;
	
	      // alert(valdates);
	      var cons="입력한 정보를 확인해 주세요 :) 맞다면 확인을 눌러주세요.\n\n여행 \n"+"출발지 : "+vals+"\n도착지 : "+vale+"\n출발하는 날 : "+valdates+"\n도착하는 날 : "+valdatee;
	
	       ////////////end값////////
	       var conf= confirm(cons);
	       if( conf == true ){
	            alert("확인선택!");

	       }else{
	            alert("취소선택!");
	       }
	    }
	  </script>
	  <div>
	 <form method="get" action="airSearch.jsp">
        <table class="reserv" align="center" >
          <tr>
            <td id="air" value="2">최저가 항공 검색</td>
          </tr>
          <tr>
            <th class="tr_u">출발지</th>
            <th class="tr_u">도착지</th>
            <th class="tr_u">가는날</th>
            <th class="tr_u">오는날</th>
            <th class="tr_u">좌석 수</th>
            
          </tr>
          <tr>
            <td><select class="state" name="sels" id="sels">
               <option value="">출발지</option>
               <option value="ICN">인천/서울, 대한민국</option>
               <option value="GMP">김포/서울, 대한민국</option>
               <option value="LHR">히드로/런던, 영국</option>
               <option value="CDG">샤를드골/파리, 프랑스</option>
               <option value="FCO">피우미치노/로마, 이탈리아</option>
               <option value="HNL">호놀룰루/하와이, 하와이</option>
            </select></td>
            <td><select class="state" name="stop" id="sele">
               <option value="">도착지</option>
               <option value="ICN">인천/서울, 대한민국</option>
               <option value="GMP">김포/서울, 대한민국</option>
               <option value="LHR">히드로/런던, 영국</option>
               <option value="CDG">샤를드골/파리, 프랑스</option>
               <option value="FCO">피우미치노/로마, 이탈리아</option>
               <option value="HNL">호놀룰루/하와이, 하와이</option>
            </select></td>
            <td><input type="date" name="startday" value="" class="inputdate" id="dates"></td>
            <td><input type="date" name="endday" value="" class="inputdate" id="datee">
              </td>
            <td><input type="number" name="pe" value="pe" placeholder="1"></td>
          </tr>
          <tr>
            <td colspan="5" id="button" ><input type="submit" value="검색"></td>	
          </tr>
        </table>
        </form>
    </div>
</body>
<hr>
  <footer><label for="" id="foottext">@Hallym 2017 최지은</label></footer>
</html>
