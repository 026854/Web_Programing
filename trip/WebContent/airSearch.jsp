<%@page import="java.util.HashMap"%>
<%@page import="java.util.Dictionary"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Locale"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.sun.org.apache.xalan.internal.xsltc.util.IntegerArray"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.net.URLDecoder"%>
<%@ page import="java.net.URLEncoder"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>항공 가격 비교</title>
</head>
<body>

<style>
body  {
	background-color: #fff0f5;
}
.if {
	float:left;
}
table{text-align: center;
font-size: x-large;}
</style>
<h2>다양한 사이트에서 가격을 쉽게 비교하세요 :)</h2>
<h3>*선택에 대한 책임을 이 사이트에서 지지 않습니다.*</h3>

<% request.setCharacterEncoding("utf-8"); %>

<%  
	
	SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat ( "yyyy-MM-dd", Locale.KOREA );
	Date currentTime = new Date ();
	String mTime = mSimpleDateFormat.format ( currentTime );
	Calendar cal = new GregorianCalendar();
    cal.add(Calendar.DATE, 1);
    Date tomorrow = cal.getTime();
    String mTime2 = mSimpleDateFormat.format ( tomorrow );
  


	String startstation=request.getParameter("sels")==null? "":request.getParameter("sels");
	String endstation=request.getParameter("stop")==null? "":request.getParameter("stop");

	HashMap<String, String> map = new HashMap<String, String>();
	
	map.put("ICN","인천");
	map.put("GMP","김포");
	map.put("LHR","런던");
	map.put("CDG","파리");
	map.put("FCO","로마");
	map.put("HNL","하와이");
	
//	String indatetest=request.getParameter("indate");
	String indate=request.getParameter("startday");
	String outdate=request.getParameter("endday");
	String peopel=request.getParameter("pe");
	
	String[] indateArray;
	indateArray= indate.split("-");
	String[] outdateArray;
	outdateArray= outdate.split("-");
	

//	String honame=URLEncoder.encode(hotelname, "UTF-8");
	//String incodestartStation = URLDecoder.decode(startstation);
	String incodestartStation1 = URLEncoder.encode(map.get(startstation), "utf-8");
	
	//String incodeendStation = URLDecoder.decode(endstation);
	String incodeendStation1 = URLEncoder.encode(map.get(endstation), "utf-8");

	long d1,d2;
	Calendar c1 = Calendar.getInstance();
	Calendar c2 = Calendar.getInstance();
	
	int indateY=Integer.parseInt(indateArray[0]);
	int indateM=Integer.parseInt(indateArray[1]);
	int indateD=Integer.parseInt(indateArray[2]);
	int outdateY=Integer.parseInt(outdateArray[0]);
	int outdateM=Integer.parseInt(outdateArray[1]);
	int outdateD=Integer.parseInt(outdateArray[2]);

	
	

	c1.set(indateY,indateM,indateD);
	c2.set(outdateY,outdateM,outdateD);

	d1=c1.getTime().getTime();
	d2=c2.getTime().getTime();
	
	int days =(int)((d2-d1)/(1000*60*60*24)); 
	String day=String.valueOf(days);
	
	

	String sky="https://www.expedia.co.kr/Flights-Search?mode=search&paandi=true&trip=roundtrip&options=cabinclass%3Aeconomy%2Cnopenalty%3AN%2Csortby%3Aprice&passengers=children%3A0%2Cadults%3A"
	+peopel+"%2Cseniors%3A0%2Cinfantinlap%3AY&leg1=from%3A"+incodestartStation1+"%2Cto%3A"+incodeendStation1+"%2Cdeparture%3A"+indateArray[0]+"."+indateArray[1]+"."+indateArray[2]+
	"TANYT&leg2=from%3A"+incodeendStation1+"%2Cto%3A"+incodestartStation1+"%2Cdeparture%3A"+outdateArray[0]+"."+outdateArray[1]+"."+outdateArray[2]+"TANYT";
	
	String naver="https://store.naver.com/flights/v2/results?trip=RT&scity1="+startstation+"&ecity1="+endstation+"&scity2="+endstation+"&ecity2="+startstation+"&adult="+peopel+"&child=0&infant=0&sdate1="+indateArray[0]+"."+indateArray[1]+"."+indateArray[2]+"."+"&sdate2="+outdateArray[0]+"."+outdateArray[1]+"."+outdateArray[2]+"."+"&fareType=Y";
	String tour= "http://tour.ticketmonster.co.kr/flight/overseas/result?trip=RT&sch="+incodestartStation1+"_"+startstation+"_"+indate+"%7C"+incodeendStation1+"_"+endstation+"_"+outdate+"&ps=1-0-0&seat=Y";
	

%>
<table width="96%">
<tr>
	<th width="35%">Expedia</th>
	<th width="35%">Naver</th>
	<th width="35%">TicketMonster</th>
</tr>
</table>
<iframe src=<%=sky %> name="sky" width=33% height="780"  class="if"></iframe>
<iframe src=<%=naver %> name="naver" width=33% height="780"  class="if"></iframe>
<iframe src=<%=tour %> name="ticketmonster" width=33% height="780"  class="if"></iframe><p>

</body>
</html>