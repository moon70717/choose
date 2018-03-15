<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Now Do</title>
</head>

<script src="${root}/resources/js/haejwo.js" charset="utf-8"></script>
<script src="${root}/resources/js/clock.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css"
	href="${root}/resources/css/clock.css${ver}" />
<link rel="stylesheet" type="text/css"
	href="${root}/resources/css/haejwo.css${ver}" />
<style>
#time_div {
	margin: 2%;
}
.time_set {
	background-color: #d1d3d4;
	color: white;
}
.time_set:hover {
	color: c0c0c0;
}

/*  */
 
 
    .md-input button {
        border: 0;
        background: none;
        /** belows styles are working good */
        padding: 2px 5px;
        margin-top: 2px;
        position: relative;
        left: -28px;
        /* IE7-8 doesn't have border-radius, so don't indent the padding */
        margin-bottom: 0;
        -webkit-border-radius: 3px;
        -moz-border-radius: 3px;
        border-radius: 3px;
        color:#D9230F;
    }
 
    .search-query:focus + button {
        z-index: 3;   
    }
</style>
<body>

	<!-- 메인 컨테이너 -->
	<div class='jhj_container'>
		<!-- 지도 -->
		<div class='map' id='map'>지도</div>
		<!-- 시계 -->
		<div class="time_container">
			<div id="clock" class="center clock"></div>
			<div id='sec' class='center sec'></div>
			<div id="month" class="center month"></div>
			<div id="dates">
				<div id="date" class="date"></div>
				<div id="year" class="year"></div>
				<div id="day" class="day"></div>
			</div>
		</div>
		<!-- 사용자 입력란 -->
		<div class='input_container'>
		
			<div class='user_setting'>
				<div class="md-input">
					<input class="md-form-control" id="loInput" required="text" type="text">
                                    
					<span class="highlight"></span> <span class="bar"></span>
					<label>My Location</label>	
					<!-- 테스트용 버튼 -->
					<button onclick="getLatLng($('#loInput')[0].value)">찾기</button> 
				</div>  
				<div class="md-input">
					<input class="md-form-control" id="desInput" required="text" type="text">
					<span class="highlight"></span> <span class="bar"></span>
					<label>Destination</label>
					<button onclick="getLatLng($('#desInput')[0].value)">찾기</button>
				</div>
				<!-- 목적지 선택 박스 -->
				<div id="network-popUp" class="" style="display: block;">
					<div
						class="form-item form-item-node-type form-type-select select-group">
						<select class="form-control form-select select_destination"
							id="edit-node-type" name="node_type">
							<option value="-1" selected="selected">Select element</option>
							<option value="1">내위치로 돌아오기</option>
							<option value="2">Ramdom Box</option>
						</select>
					</div>
				</div>
			</div>
			<!-- 시간 -->
			<div id="time_div">
				<button class="time_set" onclick="minus()">
					<span class="glyphicon glyphicon-menu-left"></span>
				</button>
				<input type="text" size="25" value="시간을 설정하세요" id="time_count"
					style="color: black; text-align: center">
				<button class="time_set" onclick="plus()">
					<span class="glyphicon glyphicon-menu-right"></span>
				</button>
			</div>
			<!--  -->
			<div class="funkyradio">
				<div class="funkyradio-info">
					<input type="radio" name="radio" id="radio1" disabled=true
						value=0.4 /> <label for="radio1">반경 1km 내에서</label>
				</div>
				<div class="funkyradio-primary">
					<input type="radio" name="radio" id="radio2" disabled=true
						value=0.4 /> <label for="radio2">반경 3km 내에서</label>
				</div>
				<div class="funkyradio-success">
					<input type="radio" name="radio" id="radio3" disabled=true
						value=1.1 /> <label for="radio3">반경 5km 내에서</label>
				</div>
				<div class="funkyradio-warning">
					<input type="radio" name="radio" id="radio4" disabled=true
						value=1.4 /> <label for="radio4">반경 10km 내에서</label>
				</div>
			</div>
			<div class='summit_btn'>
				<button id='test' class="btn loding_button" 
				onclick="sendVariable($('#loInput')[0].value, $('#desInput')[0].value)">
					<!-- "window.location.href='${root}/path/map/show-way'" -->
					<span class="ladda-label"> Save snippet </span>
				</button>
			</div>
		</div>
	</div>
</body>
<script>

/* 시간 설정 */
var count = 0;
var countEl = document.getElementById("time_count");

//변수 값 
var mapX, mapY, times, radius, code, dMapX, dMapY;
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
	times=Math.floor(hour-disKm);
	radius=disKm
	
}
//현위치와 목적지 xy좌표 구하는 공통 함수
function getXYaddress(place, x, y){
	var geocoder = new google.maps.Geocoder();
	geocoder.geocode({
		address : place,  
		region : 'ko'
	},function(results, status){
		if(status == google.maps.GeocoderStatus.OK){
			var bounds = new google.maps.LatLngBounds();
			for(var r of results) {
				if(r.geometry) {
					x = r.geometry.location.lat();
					y = r.geometry.location.lng();
				} 
			} 
		}
	});
}

function sendVariable(loInput, desInput){
	getXYaddress(loInput, mapX, mapY);
	getXYaddress(desInput, dMapX, dMapY);
	getTimes();
	alert(mapX);
	
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
		alert(latlng);
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
					$('#loInput')[0].value = address;
				}
			}
		})
	}
	

	
	//입력 주소를 검색하는부분(버튼)
	function getLatLng(place){
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
						alert(latlng);
						console.log(latlng);
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