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
<style>
/*  */
.nowdo_container {
	position: absolute;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	opacity: 0.5;
	z-index: -150;
}

.loding {
	width: 100%;
	height: 100%;
	z-index: 9150;
}

.header {
	background-color: #f1f1f1;
	padding: 20px;
	text-align: center;
}

.footer {
	background-color: #F1F1F1;
	text-align: center;
	padding: 10px;
}

.jhj_container {
	width: 93%;
	border: solid #ff3102 1px;
}

.input_container {
	border: solid pink 1px;
	text-align: center;
}

.map {
	display: -webkit-flex;
	display: flex;
	-webkit-align-items: center;
	align-items: center;
	-webkit-justify-content: center;
	justify-content: center;
	width: 100%;
	border: solid #FDC72F 1px;
	    height: 320px;
}

.input_container {
	border: solid pink 3px;
	text-align: center;
}

.time {
	border: solid gray 3px;
	width: 30%;
	min-width: 100px;
	height: 100px;
}

.user_setting1 {
	border: solid green 3px;
	display: table;
	margin: auto;
}

#network-popUp {
	top: 45vh;
	left: 35vw;
	z-index: 234;
	width: 490px;
}
.select_destination{
	display: block;
    width: 50%;
    padding: 0.375rem 0.75rem;
    font-size: 1rem;
    line-height: 1.5;
    color: #8e8e8e;
    float: right;
    background-color: #fff;
    background-clip: padding-box;
    border: 1px solid #ced4da;
    border-radius: 0.25rem;
    transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
}

.funkyradio {
	border: solid blue 3px;
	clear: both;
	content: "";
	display: table;
	margin: auto;
}

.funkyradio div {
	overflow: hidden;
	float: left;
	margin: 3px;
}

.funkyradio label {
	width: 100%;
	border-radius: 5px;
	border: px solid #D1D3D4;
	font-weight: normal;
}

.funkyradio input[type="radio"]:empty, .funkyradio input[type="checkbox"]:empty
	{
	display: none;
}

.funkyradio input[type="radio"]:empty ~ label, .funkyradio input[type="checkbox"]:empty 
	 ~ label {
	position: relative;
	color: #fff;
	background-color: black;
	width: 200px;
	line-height: 2.5em;
	text-indent: 3.25em;
	margin-top: 1em;
	cursor: pointer;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

.funkyradio input[type="radio"]:empty ~ label:before, .funkyradio input[type="checkbox"]:empty 
	 ~ label:before {
	position: absolute;
	display: block;
	top: 0;
	bottom: 0;
	left: 0;
	content: '';
	width: 2.5em;
	background: #D1D3D4;
	border-radius: 3px 0 0 3px;
}

.funkyradio input[type="radio"]:hover:not (:checked ) ~ label,
	.funkyradio input[type="checkbox"]:hover:not (:checked ) ~ label {
	color: #888;
}

.funkyradio input[type="radio"]:hover:not (:checked ) ~ label:before,
	.funkyradio input[type="checkbox"]:hover:not (:checked ) ~ label:before
	{
	content: '\2714';
	text-indent: .1em;
	color: #C2C2C2;
}

.funkyradio input[type="radio"]:checked ~ label, .funkyradio input[type="checkbox"]:checked 
	 ~ label {
	color: #777;
}

.funkyradio input[type="radio"]:checked ~ label:before, .funkyradio input[type="checkbox"]:checked 
	 ~ label:before {
	content: '\2714';
	text-indent: .1em;
	color: #333;
	background-color: #ccc;
}

.funkyradio input[type="radio"]:focus ~ label:before, .funkyradio input[type="checkbox"]:focus 
	 ~ label:before {
	box-shadow: 0 0 0 3px #999;
}

.funkyradio-primary input[type="radio"]:checked ~ label:before,
	.funkyradio-primary input[type="checkbox"]:checked ~ label:before {
	color: #fff;
	background-color: #337ab7;
}

.funkyradio-success input[type="radio"]:checked ~ label:before,
	.funkyradio-success input[type="checkbox"]:checked ~ label:before {
	color: #fff;
	background-color: #5cb85c;
}

.funkyradio-warning input[type="radio"]:checked ~ label:before,
	.funkyradio-warning input[type="checkbox"]:checked ~ label:before {
	color: #fff;
	background-color: #f0ad4e;
}

.funkyradio-info input[type="radio"]:checked ~ label:before,
	.funkyradio-info input[type="checkbox"]:checked ~ label:before {
	color: #fff;
	background-color: #5bc0de;
}

.summit_btn {
	clear: left;
}

.md-input {
	position: relative;
	margin-bottom: 30px;
}

.md-input .md-form-control {
	font-size: 16px;
	padding: 10px 10px 10px 5px;
	display: block;
	border: none;
	border-bottom: 2px solid #CACACA;
	box-shadow: none;
	width: 100%;
}

.md-input label {
	color: rgba(0, 0, 0, 0.5);
	font-size: 16px;
	font-weight: normal;
	position: absolute;
	pointer-events: none;
	left: 5px;
	top: 10px;
	transition: 0.2s ease all;
	-moz-transition: 0.2s ease all;
	-webkit-transition: 0.2s ease all;
}

.md-input .bar:before {
	left: 50%;
}

.md-input .bar:after {
	right: 50%;
}

.md-input .highlight {
	position: absolute;
	height: 60%;
	width: 100px;
	top: 25%;
	left: 0;
	pointer-events: none;
	opacity: 0.5;
}

.md-input .md-form-control:focus ~ label, .md-input .md-form-control:valid 
	 ~ label {
	top: -15px;
	font-size: 14px;
	color: #183D5D;
}

.md-input .bar:before, .md-input .bar:after {
	content: '';
	height: 2px;
	width: 0;
	bottom: 0px;
	position: absolute;
	background: #03A9F4;
	transition: 0.2s ease all;
	-moz-transition: 0.2s ease all;
	-webkit-transition: 0.2s ease all;
}

.md-input .md-form-control:focus ~ .bar:before, .md-input .md-form-control:focus 
	 ~ .bar:after {
	width: 50%;
}
/*로딩버튼*/
.loding_button {
	width: 80%;
}
</style>
<body>
	<!-- 윗부분 공백 -->

	<div class="header">
		<h1>Header</h1>
	</div>
	<!-- 메인 컨테이너 -->
	<div class='jhj_container'>
		<!-- 지도 -->
		<div class='map'>지도</div>
		<!-- 시계 -->

		<div class="wrapper">
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
			<div class='user_setting1'>
				<div class="md-input">
					<input class="md-form-control" required="" type="text"> <span
						class="highlight"></span> <span class="bar"></span> <label>My
						Location</label>
				</div>
				<div class="md-input">
					<input class="md-form-control" required="" type="text"> <span
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
			사용할 시간(목적지 도착까지 총 시간) : <br> <select>
				<option value="one">1시간</option>
				<option value="two">2시간</option>
				<option value="three">3시간</option>
				<option value="four">4시간</option>
			</select>
			<!--  -->
			<div class="funkyradio">
				<div class="funkyradio-info">
					<input type="radio" name="radio" id="radio1" /> <label
						for="radio1">반경 1km 내에서</label>
				</div>
				<div class="funkyradio-primary">
					<input type="radio" name="radio" id="radio2" /> <label
						for="radio2">반경 3km 내에서</label>
				</div>
				<div class="funkyradio-success">
					<input type="radio" name="radio" id="radio3" /> <label
						for="radio3">반경 5km 내에서</label>
				</div>
				<div class="funkyradio-warning">
					<input type="radio" name="radio" id="radio4" /> <label
						for="radio4">반경 10km 내에서</label>
				</div>
			</div>
			<div class='summit_btn'>
				<button id='test' class="btn btn-primary loding_button"
					onclick="loding()">
					<span class="ladda-label"> Save snippet </span>
				</button>
			</div>
		</div>
	</div>




	<div class="footer">
		<p>Footer</p>
	</div>


	<div id='nowdo_container' class='nowdo_container'></div>
	<div id='loding' class='loding'></div>
</body>
<script>
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

</script>


</html>