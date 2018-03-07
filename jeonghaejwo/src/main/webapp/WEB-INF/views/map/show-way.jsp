<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="map" style="width: 500px; height: 500px"></div>
	<div id="right-panel"></div>
	<input type="submit" id="submit">
	<div id="directions-panel"></div>
</body>

<script>
	var nLat, nLng, waypoint;
	var routeSegment = 0, ways;
	var waypts = [];

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
	getLocation();

	//api에서 경유지를 받아옴
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
		var directionsService = new google.maps.DirectionsService;
		var directionsDisplay = new google.maps.DirectionsRenderer;
		var map = new google.maps.Map(document.getElementById('map'), {
			zoom : 16, 
			center : {
				lat : 37.566535,
				lng : 126.97796919999999
			}
		});
		directionsDisplay.setMap(map);

		document.getElementById('submit').addEventListener('click', function() {
			var nowP=nLat+", "+nLng;
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
			for(var v=0;v<waypts.length;v++){ 
				calculateAndDisplayRoute(directionsService, directionsDisplay,v,1);
			}
		});
	}
	function calculateAndDisplayRoute(directionsService, directionsDisplay, startP,onsoff) {
		directionsService.route({  
			origin : waypts[startP].location, 
			destination : waypts[startP+1].location,
			optimizeWaypoints : true,
			travelMode : 'TRANSIT'  
		}, function(response, status) {
			if (status === 'OK') {
				directionsDisplay.setDirections(response);
				var route = response.routes[0];
				var summaryPanel = document.getElementById('directions-panel');
				//summaryPanel.innerHTML = '';
				// For each route, display summary information.
				if(onsoff==1){
					ways='';
					for (var i = 0; i < route.legs.length; i++) {
						routeSegment++;
						ways += '<b>Route Segment: ' + routeSegment + '</b><br>';
						ways += route.legs[i].start_address + ' to ';
						ways += route.legs[i].end_address + '<br>';
						ways += route.legs[i].distance.text + '<br>';
						ways += '<button id="button'+startP+'">길 보기</button><br>';
						summaryPanel.innerHTML+=ways;
						document.getElementById('button'+startP).addEventListener('click',function(){
							alert("3");
						});
					}
				}
				
			} else {
				window.alert('Directions request failed due to ' + status);
			}
		});
	}
</script>
<script async defer
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDFbONelL6n5CyJfPLkocOutqCZqwiFANA&callback=initMap"></script>
</html>