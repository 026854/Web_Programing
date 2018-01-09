<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <title>호텔 예약</title>
    <style media="screen">
    @import url(http://fonts.googleapis.com/earlyaccess/nanumpenscript.css);
    @import url(http://fonts.googleapis.com/earlyaccess/jejugothic.css);
      #button{float: right;}
      table{border: 3px solid white;
            width: 900px;
            height: 280px;}
      div{padding-top: 260px;}
      .back-ground{background-image: url('image/hotel_back.jpg');}
      #table-back{background-color: #010d30;}
      caption{font-size: 50px;
              font-family: 'Nanum Pen Script', serif;
              color: white;
            background-color:  #010d30;}
      .title{width: 100px;
      color: white;
    font-family: 'Jeju Gothic', serif;}
      .ipnut{width: 300px;
      height: 30px;}
      #foottext{text-align: right;}
      body{
      width: 1100px;
      margin: 0 auto;}
    </style>
  </head>
  <body>
    <script type="text/javascript">
      function confi(){
        /////////////

          var sels = document.getElementById("serho");
          var vals=sels.value;
        ////////////////start값/////


          var dates=document.getElementById("dates");
          var valdates=dates.value;

          var datee=document.getElementById("datee");
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
    <div class="back-ground" style="height: 400px;">
      <span>
      <form method="get" action="hotelSearch.jsp">
        <table align="center" id="table-back">
          <caption>호텔 예약</caption>
          <tr>
            <td class="title">
              호텔 검색 :
            </td>
            <td><input type="text" name="hotelname" class="ipnut" id="serho" placeholder="도시, 지역, 구역 혹은 호텔명"></td>
          </tr>
          <tr>
            <td class="title">체크인 :</td>
            <td><input type="date" name="indate" value="" class="ipnut" id="dates" placeholder="날짜 선택"></td>
            <td class="title">체크아웃 :</td>
            <td><input type="date" name="outdate" value="" class="ipnut" id="datee" placeholder="날짜 선택"></td>
          </tr>
          <tr><td class="title">인원 수 :</td>
            <td><select class="pe" name="pe" class="ipnut" id="pe">
                  <option value="1,1">객실: 1 성인: 1</option>
                  <option value="1,2">객실: 1 성인: 2</option>
                  <option value="1,3">객실: 1 성인: 3</option>
                  <option value="1,4">객실: 1 성인: 4</option>
                  <option value="2,2">객실: 2 성인: 2</option>
                </select>
              </td>
          </tr>
          <tr><td></td>
            <td colspan="3" id="button" ><input type="submit" value="검색"></td>
          </tr>
        </table>
        </form>
      </span>
      </form>
    </div>
   <hr>
  </body>
  <footer>
  <a href="https://kr.hotels.com/?PSRC=SEMB&pos=HCOM_KR&locale=ko_KR&rffrid=sem.hcom.KR.google.003.00.01.s.kwrd=c.68711619802.16563969322.223928242.1t1.aud-129051557309:kwd-324456688060.1030760..%ED%98%B8%ED%85%94%EC%8A%A4%EB%8B%B7%EC%BB%B4.EAIaIQobChMIufmFtaTS1gIV2QcqCh0CEAoEEAAYASAAEgLouPD_BwE.aw.ds&semid=16563969322.223928242.1t1.aud-129051557309:kwd-324456688060.1030760..%ED%98%B8%ED%85%94%EC%8A%A4%EB%8B%B7%EC%BB%B4&gclid=EAIaIQobChMIufmFtaTS1gIV2QcqCh0CEAoEEAAYASAAEgLouPD_BwE&gclsrc=aw.ds" target="_blank"><img src="image/hotelsdot.png" alt="호텔스 닷컴" width="150px" class="airimg"></a>
  &nbsp&nbsp&nbsp&nbsp
  <a href="https://www.trivago.co.kr/?sem_keyword=%ED%8A%B8%EB%A6%AC%EB%B0%94%EA%B3%A0&sem_creativeid=105645217840&sem_matchtype=e&sem_network=g&sem_device=c&sem_placement=&sem_target=&sem_adposition=1t1&sem_param1=&sem_param2=&sem_campaignid=304262920&sem_adgroupid=24666320200&sem_targetid=kwd-62597716098&sem_location=1030760&cip=82122800201&gclid=EAIaIQobChMIyZD9kqXS1gIVg5K9Ch00uQ0-EAAYASAAEgJuZfD_BwE" target="_blank"><img src="image/tri.PNG" alt="트리바고" width="150px" class="airimg"></a>
  &nbsp&nbsp&nbsp&nbsp
  <a href="https://www.expedia.co.kr/?langid=1042&semcid=kr.b.google.bt-c-ko.generic&semdtl=a1933971420.b150622291590.d1222351399544.e1c.f11t1.g1kwd-309008849920.h1e.i1.j11030760.k1.l1g.m1.n1&kword=ZzZz.5090000028189.c51c1dd1-961b-44b3-a9ac-ae563e26914c&gclid=EAIaIQobChMIgcD6vaXS1gIV3QcqCh1BVgnIEAAYASAAEgJh5PD_BwE" target="_blank"><img src="image/ex.PNG" alt="익스피디아" width="150px" class="airimg"></a>
  <label for="" id="foottext">@Hallym 2017 최지은</label>
  </footer>
  </footer>
</html>
