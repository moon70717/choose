<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Now Do</title>
</head>

<script src="${root}/resources/js/haejwo.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${root}/resources/css/haejwo.css${ver}" />
<script>

</script>
<body>

	<!-- 메인 컨테이너 -->
	<div class='jhj_container'>
		<!-- 지도 -->
		<div class='map' id='map'>지도</div>
		
		
		<!-- 사용자 입력란 -->
		<div class='input_container'>
			<div class='user_setting'>
				<div class="location_input">
					<input class="location_input_text" id="loInput" type="text">
					<span class="highlight"></span> <span class="bar"></span>
					<span><button class="loBtn" onclick="getLatLng($('#loInput')[0].value, $('#loInput')[0].id)">
					<i class="glyphicon glyphicon-search"></i>
					</button></span>
					<label>My Location</label>
				</div>  
				<div class="location_input">
					<input class="location_input_text" id="desInput" type="text">
					<span class="highlight"></span> <span class="bar"></span>
					<span>
					<button class="deBtn" onclick="getLatLng($('#desInput')[0].value, $('#desInput')[0].id)">
					<i class="glyphicon glyphicon-search"></i>
					</button>
					</span>
					<label>Destination</label>
				</div>
				<!-- 목적지 선택 박스 -->
				<div id="network-popUp" class="destination_selectBox" style="display: block;">
					<div class="form-item form-item-node-type form-type-select select-group">
						<select class="form-control form-select select_destination"
							id="deSelectBox" name="node_type" onchange="deSelectBox()" >
							<option value="-1" selected="selected">Select element</option>
							<option value="0">내위치로 돌아오기</option>
							<option value="1">Ramdom Box</option>
						</select>
					</div>
				</div>
			</div>
			<!-- 시간 -->
			<div id="time_div" class="time_div">
				<button class="time_set" onclick="minus()">
					<span class="glyphicon glyphicon-menu-left"></span>
				</button>
				<input type="text" size="25" value="시간을 설정하세요" id="time_count"
					style="color: black; text-align: center" class="time_count">
				<button class="time_set" onclick="plus()">
					<span class="glyphicon glyphicon-menu-right"></span>
				</button>
			</div>
			<!-- 반경 거리 -->
			<div class="funkyradio">
				<div class="funkyradio-info">
					<input type="radio" name="radio" id="radio1" disabled=true
						value=0.4 data-value='1000' /> <label for="radio1">반경 1km 내에서</label>
				</div>
				<div class="funkyradio-primary">
					<input type="radio" name="radio" id="radio2" disabled=true
						value=0.4 data-value='3000' /> <label for="radio2">반경 3km 내에서</label>
				</div>
				<div class="funkyradio-success">
					<input type="radio" name="radio" id="radio3" disabled=true
						value=1.1 data-value='5000' /> <label for="radio3">반경 5km 내에서</label>
				</div>
				<div class="funkyradio-warning">
					<input type="radio" name="radio" id="radio4" disabled=true
						value=1.4 data-value='10000' /> <label for="radio4">반경 10km 내에서</label>
				</div>
			</div>
			<div class='summit_btn'>
				<button id='test' class="btn loding_button" 
				onclick="sendVariable($('#loInput')[0].value, $('#desInput')[0].value)">
					<!-- "window.location.href='${root}/path/map/show-way'" -->
					<span class="ladda-label"> Jeong Hae Jwo </span>
				</button>
			</div>
		</div>
	</div>
</body>
<script>

$(function(){
	  $('#loInput').keypress(function(key){
		  if (key.keyCode == 13) {
		  getLatLng($('#loInput')[0].value, $('#loInput')[0].id);
		  }
	  });
	});
/* 목적지 셀랙트 박스  */
 function deSelectBox(){
	 var selectBoxValue = document.getElementById("deSelectBox").value;
	 if(selectBoxValue==0){
		$("#desInput")[0].value = $('#loInput')[0].value;
	 }else if(selectBoxValue==1){
		 $("#desInput")[0].value = "랜덤으로 갑니다";
		 
	 }
	 
}
/* 시간 설정 */
var count = 0;
var countEl = document.getElementById("time_count");

//변수 값 
var mapX, mapY, times, radius, code, dMapX, dMapY;
var nLat, nLng, waypoint;
/* 횟수 구하기 */
function getTimes(){
	var hour;
	var disKm;
	hour = $('#time_count')[0].value;
	hour = Number(hour.replace(" 시간", ""));
	if(hour==1){
		hour=1.4;
	}else if(hour==2){
		hour=2.5;
	}else if(hour==3){
		hour=3.4;
	}else if(hour==4){
		hour=4.4;
	}else if(hour==5){
		hour=5.4;
	}
	disKm = Number($("input[type=radio][name=radio]:checked").val());
	if(hour==NaN||disKm==NaN){
		alert("시간 또는 거리를 설정하세요");
	}
	ramdomNum = Number(document.getElementById("deSelectBox").value);
	times=Math.floor(hour-disKm+ramdomNum);
	radius=Number($("input[type=radio][name=radio]:checked")[0].getAttribute("data-value"));
	
}
//현위치와 목적지 xy좌표 구하는 공통 함수
function getXYaddress(place,func){
	var geocoder = new google.maps.Geocoder();
	geocoder.geocode({
		address : place,  
		region : 'ko'
	},function(results, status){
		if(status == google.maps.GeocoderStatus.OK){
			var bounds = new google.maps.LatLngBounds();
			for(var r of results) {
				if(r.geometry) {
					var result = r.geometry.location;
					func(result);
				} 
			} 
		}
	});
}
function loFunc(result){
	mapX = result.lat();
	mapY = result.lng();
}
function deFunc(result){
	dMapX = result.lat();
	dMapY = result.lng();
}

function sendVariable(loInput, desInput){
	lodingSt();
	getXYaddress(loInput, loFunc);
	getXYaddress(desInput, deFunc);
	getTimes();
	//setTimeout은 데이터 흐름을 queue에 넣으므로 순서를 정할 수 있다
	setTimeout(function(){	
		var data={
				'mapX':mapX,
				'mapY':mapY,
				'times':times,
				'radius':radius,
				'dMapX':dMapX,
				'dMapY':dMapY
			}
		$.ajax({
			url : "/api/show-way",
			type : "post",
			data : data,
			success : function(res) {
				//console.log(res.json);
				lodingEnd();
				waypoint = JSON.parse(res.json);
				waypoint = waypoint.response.body.items.item;
				console.log(waypoint);
			}
		});
	},1000);
}


/*  */
/* 길찾기 부분 */
/*  */
 	var nLat, nLng, waypoint;
	var routeSegment = 0, ways;
	var waypts = [];
	var directionsService;
	var directionsDisplay;
	
	//현재 위치를 받아오는 부분 
	function getLocation() {
		if (navigator.geolocation) {
			navigator.geolocation.getCurrentPosition(showPosition);
		} else {
			alert("Geolocation is not supported by this browser.");
		}
	}
	function showPosition(position) {
		nLat = position.coords.latitude;
		nLng = position.coords.longitude;
	}
	//이걸로 현재위치를 받아오는걸 호출
	getLocation();
	//api에서 경유지를 받아옴
	//현재 되어있는 url은 테스트용 url이므로/api/tour_api 로 변경할것
	//ajax 필요 데이터 : 현재위치, 횟수, 범위, 컨텐츠id
	//현재위치: mapX, mapY ,횟수:times, 범위: radius , 컨텐츠id: code, 
	
	$.ajax({
		url : "/map/api",
		type : "get",
		success : function(res) {
			//console.log(res.json);
			waypoint = JSON.parse(res.json);
			waypoint = waypoint.response.body.items.item;
			console.log(waypoint);
		}
	});
	
	//지도를 현재위치로 이동시키고 길찾기 서비스를 호출시킴
	function initMap() {
		directionsService = new google.maps.DirectionsService;
		directionsDisplay = new google.maps.DirectionsRenderer;
		//center부분이 현재위치인데 geoloation으로 받아온 위치로 변경해놔야됨
		var map = new google.maps.Map(document.getElementById('map'), {
																		zoom : 16, 
																		center : {
																					lat : 37.566535,
																					lng : 126.97796919999999
																					}
																		});
		directionsDisplay.setMap(map);
		
		//맵 클릭시 이벤트적용
		google.maps.event.addListener(map, 'click', function(mouseEvent) {
			getAddress(mouseEvent.latLng);
		});
		
		//submit버튼에 이벤트 적용
		$("#submit").click(function() {
			//nLat이랑 nLng이 위의getLocation을 이용해 받아온 현재위치
			//하지만 학원에서는 않먹힘 
			var nowP=nLat+", "+nLng;
			
			//출발지점이랑 도착지점은 그냥 현재위치로 잡혀있음
			waypts.push({
				location : nowP,
				stopover : true
			});
			
			for(var v of waypoint){
				waypts.push({
					location : v.addr1,
					stopover : true
				});
			}
			waypts.push({
				location : nowP,
				stopover : true
			});
			calculateAndDisplayRoute(1);
		});
	}
	
	//클릭한곳 좌표와 주소를 가져와주는놈(맵 클릭)
	function getAddress(latlng){
		var geocoder = new google.maps.Geocoder();
		console.log("클릭했을 때 "+latlng);
		geocoder.geocode({
			latLng : latlng
		},function(result, status){
			if(status == google.maps.GeocoderStatus.OK){
				if(result[0].geometry){    
					var address = result[0].formatted_address;
					/* var marker = new google.maps.Marker({
						position : latlng,
						map : map
					}); */
					var latlng = result[0].geometry.location;
					console.log(latlng.lat()+","+latlng.lng());
					$('#loInput')[0].value = address;
				}
			}
		})
	}
	

	
	//입력 주소를 검색하는부분(버튼)
	function getLatLng(place, id){
		var geocoder = new google.maps.Geocoder();
		geocoder.geocode({
			address : place,  
			region : 'ko'
		},function(results, status){
			if(status == google.maps.GeocoderStatus.OK){
				var bounds = new google.maps.LatLngBounds();
				for (var r of results) {
					console.log(r);
					if (r.geometry) {
						var latlng = r.geometry.location;
						var address = r.formatted_address;
						console.log(latlng.lat()+","+latlng.lng());
						$( "#"+id)[0].value = address;
					}
				}
			}
		});
	}
	
	//경로를 구하는 부분
	function calculateAndDisplayRoute(onsoff,idx) {
		if(!idx){
			idx = 0;
		}
		if(idx==waypts.length-1&&onsoff==1){
			calculateAndDisplayRoute(0,0);
		}  
		directionsService.route({
			origin : waypts[idx].location, 
			destination : waypts[idx+1].location,
			optimizeWaypoints : true,
			travelMode : 'TRANSIT'  
		}, function(response, status) {
			if (status === 'OK') {
				directionsDisplay.setDirections(response);
				var route = response.routes[0];
				//onsoff가 1일때만 경로를 웹에 찍어주도록
				if(onsoff==1){
					for (var i = 0; i < route.legs.length; i++) {
						routeSegment++;
						ways = '<b>Route Segment: ' + routeSegment + '</b><br>';
						ways += route.legs[i].start_address + ' to ';
						ways += route.legs[i].end_address + '<br>';
						ways += route.legs[i].distance.text + '<br>';
						ways += '<button id="button'+routeSegment+'" value="'+routeSegment+'">길 보기</button><br>';
						$(ways).appendTo('#directions-panel');
						$("#button"+routeSegment).click(function(){
							calculateAndDisplayRoute(0,this.value-1);
						});
					}
					calculateAndDisplayRoute(1,idx+1);
				}
				
				if(waypts.length==idx)return;
				
			} else {
				window.alert('Directions request failed due to ' + status);
			}
		});
	}
</script>

<script async defer
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDFbONelL6n5CyJfPLkocOutqCZqwiFANA&callback=initMap"></script>

</html>