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
<title>호텔 가격 비교</title>
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
  


	String hotelname=request.getParameter("hotelname")==null? "":request.getParameter("hotelname");

	
	
//	String indatetest=request.getParameter("indate");
	String indate=request.getParameter("indate");
	String outdate=request.getParameter("outdate");
	String peopel=request.getParameter("pe");
	
	String[] indateArray;
	indateArray= indate.split("-");
	String[] outdateArray;
	outdateArray= outdate.split("-");
	
	String[] roomArray;
	roomArray = peopel.split(",");
//	String honame=URLEncoder.encode(hotelname, "UTF-8");
	String incodeHotel = URLDecoder.decode(hotelname);
	String incodeHotel1 = URLEncoder.encode(incodeHotel, "utf-8");

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
	
	
	
	String expedia="https://www.expedia.co.kr/Hotel-Search?destination="+incodeHotel1+"&startDate="+indateArray[0]+"."+indateArray[1]+"."+indateArray[2]+"&endDate="+outdateArray[0]+"."+outdateArray[1]+"."+outdateArray[2]+"&rooms="+roomArray[0]+"&_xpid=11905%7C1&adults="+roomArray[1];
	
	String booking="https://www.booking.com/searchresults.ko.html?aid=309654&label=hotels-korean-ko-MdTFpP9*IYHmJIy3GS54LgS63639613372%3Apl%3Ata%3Ap1%3Ap21%2C534%2C000%3Aac%3Aap1t1%3Aneg%3Afi%3Atikwd-3598073260%3Alp1009843%3Ali%3Adec%3Adm&sid=3e2d4780e6928856381646c23e8b096e&sb=1&src=index&src_elem=sb&error_url=https%3A%2F%2Fwww.booking.com%2Findex.ko.html%3Faid%3D309654%3Blabel%3Dhotels-korean-ko-MdTFpP9%252AIYHmJIy3GS54LgS63639613372%253Apl%253Ata%253Ap1%253Ap21%252C534%252C000%253Aac%253Aap1t1%253Aneg%253Afi%253Atikwd-3598073260%253Alp1009843%253Ali%253Adec%253Adm%3Bsid%3D3e2d4780e6928856381646c23e8b096e%3Bsb_price_type%3Dtotal%26%3B&ss="+hotelname+"&checkin_year="+indateArray[0]+"&checkin_month="+indateArray[1]+"&checkin_monthday="+indateArray[2]+"&checkout_year="+outdateArray[0]+"&checkout_month="+outdateArray[1]+"&&checkout_monthday="+outdateArray[2]+"&group_adults="+roomArray[1]+"&group_children=0&no_rooms="+roomArray[0]+"&from_sf=1&ss_raw=%ED%8C%8C%EB%A6%AC&dest_id=&dest_type=&search_pageview_id=691960f7082b02c2&search_selected=false";
	
	String accor= "https://secure.accorhotels.com/store/index.html#/ko/hotels?q="+hotelname+"&dateIn="+indate+"&nights="+day+"&adults="+roomArray[1]+"&domainId=https:~2F~2Fwww.accorhotels.com&origin=accorhotels";
	

%>
<table width="96%">
<tr>
	<th width="35%">Expedia</th>
	<th>Booking</th>
	<th>&nbsp&nbspAccor</th>
</tr>
</table>
<iframe src=<%=expedia %> name="expedia" width=33% height="780"  class="if"></iframe>
<iframe src=<%=booking %> name="accor" width=33% height="780"  class="if"></iframe>
<iframe src=<%=accor %> name="booking" width=33% height="780"  class="if"></iframe><p>


</body>
</html>