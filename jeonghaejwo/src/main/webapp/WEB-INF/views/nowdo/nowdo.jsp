<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Now Do</title>
</head>

<script src="${root}/resources/js/spin.js" charset="utf-8"></script>
<script src="${root}/resources/js/clock.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${root}/resources/css/clock.css${ver}"/>
<link rel="stylesheet" type="text/css" href="${root}/resources/css/haejwo.css${ver}"/>
<style>
#time_div{
margin:2%;
}
.time_set{
	background-color: #d1d3d4;
	color: white;
}
.time_set:hover{
	color: c0c0c0;
}
			
</style>
<body>

	<!-- 메인 컨테이너 -->
	<div class='jhj_container'>
		<!-- 지도 -->
		<div class='map' id='map'>지도</div>
		<!-- 시계 -->
		<div class="time_container">
			<div id="clock" class="center clock">
				
			</div>
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
					<input class="md-form-control" required="text" type="text"> <span
						class="highlight"></span> <span class="bar"></span> <label>My
						Location</label>
				</div>
				<div class="md-input">
					<input class="md-form-control" required="text" type="text"> <span
						class="highlight"></span> <span class="bar"></span> <label>Destination</label>
				</div>
				<!-- 목적지 선택 박스 -->
				<div id="network-popUp" class="" style="display: block;">
					<div class="form-item form-item-node-type form-type-select select-group">
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
			<span class="glyphicon glyphicon-menu-left"></span></button>
				<input type="text" size="25" value="시간을 설정하세요" id="time_count" 
					style="color:black;text-align:center">
				<button class="time_set" onclick="plus()">
			<span class="glyphicon glyphicon-menu-right"></span></button>
			</div>
			<!--  -->
			<div class="funkyradio">
				<div class="funkyradio-info">
					<input type="radio" name="radio" id="radio1" disabled = true value=0.4 />
					<label for="radio1">반경 1km 내에서</label>
				</div>
				<div class="funkyradio-primary">
					<input type="radio" name="radio" id="radio2" disabled = true value=0.4 />
					<label for="radio2">반경 3km 내에서</label>
				</div>
				<div class="funkyradio-success">
					<input type="radio" name="radio" id="radio3" disabled = true value=1.1 />
					<label for="radio3">반경 5km 내에서</label>
				</div>
				<div class="funkyradio-warning">
					<input type="radio" name="radio" id="radio4" disabled = true value=1.4 />
					<label for="radio4">반경 10km 내에서</label>
				</div>
			</div>
			<div class='summit_btn'>
				<button id='test' class="btn loding_button"
					 onclick='getTimes()'><!-- "window.location.href='${root}/path/map/show-way'" -->
					<span class="ladda-label"> Save snippet </span>
				</button>
			</div>
		</div>
	</div>

	<div id='nowdo_container' class='nowdo_container'></div>
	<div id='loding' class='loding'></div>
</body>
<script>
/* 라디오 버튼 활성 비활성 조정 */
function radioAble(){
	if(count<2){
		document.getElementById("radio1").disabled = false;
		 document.getElementById("radio2").disabled = false;
		document.getElementById("radio3").disabled = true;
		 document.getElementById("radio4").disabled = true;
	}else{
		document.getElementById("radio3").disabled = false;
		 document.getElementById("radio4").disabled = false;
	}
}
//변수 값 
var mapX, mapY, times, radius, code;
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
	if(hour==NaN||disKm==Nan){
		alert("시간 또는 거리를 설정하세요");
	}
	times=Math.floor(hour-disKm);
	radius=disKm

	
}

/* 시간 설정 */
var count = 0;
var countEl = document.getElementById("time_count");
function plus(){
	if(count<6){
	    count++;
	    countEl.value = count+" 시간";
	    radioAble();
	   
	}
}
function minus(){
  if (count > 1) {
    count--;
    countEl.value = count+" 시간";
    radioAble();
  }  
}

/*  */
	var spinner;
	var lodingST = false;
	var opts = {
		lines : 13, // The number of lines to draw
		length : 38, // The length of each line
		width : 17, // The line thickness
		radius : 45, // The radius of the inner circle
		scale : 1, // Scales overall size of the spinner
		corners : 1, // Corner roundness (0..1)
		color : 'red', // CSS color or array of colors
		fadeColor : 'transparent', // CSS color or array of colors
		opacity : 0.25, // Opacity of the lines
		rotate : 0, // The rotation offset
		direction : 1, // 1: clockwise, -1: counterclockwise
		speed : 1, // Rounds per second
		trail : 60, // Afterglow percentage
		fps : 20, // Frames per second when using setTimeout() as a fallback in IE 9
		zIndex : 209, // The z-index (defaults to 2000000000)
		className : 'spinner', // The CSS class to assign to the spinner
		top : '50%', // Top position relative to parent
		left : '50%', // Left position relative to parent
		shadow : '#424242', // Box-shadow for the lines
		position : 'absolute' // Element positioning 
	};

	function loding() {
		if (lodingST == false) {
			lodingST = true
			jQuery(function() {
				spinner = new Spinner(opts).spin().el;
				$('#loding').append(spinner);
				$('#loding').css("z-index", "1500");
				var nowDo = document.getElementById('nowdo_container');
				nowDo.style.backgroundColor = "black";
				nowDo.style.zIndex = "1000";
			});
		}
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

		document.getElementById('submit').addEventListener('click', function() {
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
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDFbONelL6n5CyJfPLkocOutqCZqwiFANA&callback=initMap"></script>
</html>