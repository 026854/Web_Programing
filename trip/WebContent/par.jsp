<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
  <%@ page import="java.util.ArrayList, tripDataB.tripinfoEntity" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="js/jquery/jquery-3.2.1.js"></script>
<script src="js/weather/weather.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	weather('par');
});
</script>
    <title>파리</title>
    <style media="screen">
    pre{font-size: 1em;}

    h1{text-align: right;
       font-size: 4em;
       color:  white;
        margin-top: 0px;}
       h2{text-align: right;
          color:  white;
        font-size: 2em;}
       body{background-color: #fff0f5;}
       header{background-image: url('image/par_back.jpg');
        background-size: 100% 390px;}

      #con{border: 1px solid gray;}
      .table{border: 1px solid gray;}
      #weatext{text-align: right;
          color:  white;
        font-size: 2em;}
        .weather{text-align: right;
          color:  white;
        font-size: 2em;}
        .temper{
        text-align: right;
          color:  white;
        font-size: 2em;
        }
        .temperk{
        text-align: right;
          color:  white;
        font-size: 2em;
        }
      #context{font-size: 0.95em;}
      strong{font-size: 1.5em;}
        th,td{ border-bottom: 2px dotted #dda0dd;
   			 padding: 10px;
 			 }
    </style>
  </head>
  <body>
    <header>
      <h1>파리</h1>
      
      <h2>비행 시간(직항) : 12시간 10분</h2>
     <div id="weatext">날씨:&nbsp &nbsp<span class="weather"></span>&nbsp&nbsp&nbsp<span class="temper"></span><span class="temperk">℃</span></div><p>
      <h2>시차: 8시간</h2>
    </header>
    <section>
     <table id="con" width="50%">
      <jsp:useBean id="tip" class="tripDataB.tripinfodatabase" scope="page"></jsp:useBean>
      <%
    	ArrayList<tripinfoEntity>list = tip.getcontryinfoparList();
    	int counter = list.size();
    	String contries="";
    	if(counter>0){
    		for(tripinfoEntity con: list){
    			%>
    			
    			
    
 <tr class="table" width="1000px">
        <td><%=con.getImgadd() %></td>
        <td><pre><strong>
      <%=con.getTitle() %></strong>
	<span id="context">
    &nbsp <%=con.getContext() %></span>
      </pre></td>
      </tr>
          			<% 
    		}
    	}
    %>

    </table>
   </section>
  </body>
</html>
