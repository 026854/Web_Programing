/**
 * @Created by jieun.choi
 */


var APPID = '67a5c82984c750cb91ca227aa35a8158';
var countryCode ={
		'par' : 6455259,
		'lon' : 2643743,
		'rom' : 3169070,
		'jeju' : 1846266,
		'new' : 5128638,
		'ha' : 5855797
};
var changeCode ={
		
		'Clear' : '<img src="weaicon/clear.png">',
		'Clouds' : '<img src="weaicon/clouds.png">',
		'Fog' : '<img src="weaicon/fog.png">',
		'Haze' : '<img src="weaicon/haze.png">',
		'Mist' : '<img src="weaicon/mist.png">',
		'Rain' : '<img src="weaicon/rain.png">',
		'Sand' : '<img src="weaicon/sand.png">',
		'Smoke' : '<img src="weaicon/smoke.png">',
		'Snow' : '<img src="weaicon/snow.png">',
		'Thunderstorm' : '<img src="weaicon/thunderstorm.png">'
			
};

function weather(con) {
	var cityId=countryCode[con];
	$.ajax({
		url:'http://api.openweathermap.org/data/2.5/weather?id='+cityId+'&APPID='+APPID,
		dataType: 'json',
		type : 'get',
		success : function(data) {
			console.log(data);
			//console.log(data..main);
			console.log(data.main.temp);
			var temp;
			temp=parseInt(data.main.temp);
			var changeTemp=temp-273;
			console.log(changeTemp);
			//$('.rr').html(changeCode[data.weather[0].main]);
			$('.weather').html(changeCode[data.weather[0].main]);
			$('.temper').text(changeTemp);
		},
		error : function() {
			console.log(error);
		}
	});
	
}

function contry() {
	$.ajax({
		url:'http://apis.data.go.kr/1262000/TravelWarningService/getTravelWarningList?ServiceKey=Q9hNea6wU%2FrDw195MR0DR0VX1fEv101W5OSLA3XU9fYM8bpRB0430OSLRAS3QekArkrJKyqyXXgie2vHDDd58A%3D%3D',
		dataType: 'xml',
		type : 'get',
		success : function(data) {
			console.log(data);
			//console.log(data..main);
			//$('.rr').html(changeCode[data.weather[0].main]);
			//$('.weather').html(changeCode[data.weather[0].main]);
		//	$('.temper').text(changeTemp);
		},
		error : function() {
			console.log(error);
		}
	});
	
}

