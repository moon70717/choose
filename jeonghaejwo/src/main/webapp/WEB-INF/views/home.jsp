<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home</title>
</head>
<!-- 구글 로그인용 -->
<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" type="text/css">
<script src="https://apis.google.com/js/api:client.js"></script>
<style>
h1 {
	text-align: center;
	color: white;
}

.login_containers {
	display: grid;
	grid-template-columns: repeat(12, 1fr);
	grid-template-areas:
		". contents1 contents1 . . . . . . contents3 contents3 ."
		". contents1 contents1 . contents2 contents2 contents2 contents2 . contents3 contents3 ."
		". . . . . . . . . . . ."
		". . . . login login login login . . . ."
		". . . . login login login login . . . ."
		". . . . login login login login . . . ."
		". . . . login login login login . . . ."
		". . . . . . . . . . . .";
	grid-gap: 15px;
	padding: 0px;
}

.login_containers>div {
	/* background-color: rgba(255, 255, 255, 0.8); */
	    text-align: center;
    padding: 20px 0;
    font-size: 30px;
    margin-top: 6rem;
}

.contents1 {
	grid-area: contents1;
}

.contents2 {
	grid-area: contents2;
}

#main_msg {
	font-family: 'hanna';
	font-size: 4rem;
	color: white;
	border: solid 3px white;
	background-color: black;
}

.msg_container {
	position: relative;
}

.msg_container>.msg_img1 {
	height: 25px;
	width: 25px;
	position: absolute;
	top: -15px;
	z-index: 200;
	left: 0;
}

.msg_container>.msg_img2 {
	height: 25px;
	width: 25px;
	position: absolute;
	bottom: -15px;
	z-index: 200;
	right: 0;
}

.contents3 {
	grid-area: contents3;
}

.contents4 {
	grid-area: login;
	display: grid;
	grid-template-columns: repeat(4, 1fr);
	grid-template-areas:
		"logintxt logintxt logintxt logintxt "
		"loginface loginface loginface loginface"
		"logingoo logingoo logingoo logingoo"
		"logingit logingit logingit logingit";
	grid-gap: 15px;
	padding: 0px;
}

.logintxt {
	grid-area: logintxt;
    padding-bottom: 4rem;
    top: -3vh;
    position: relative;
}

.loginface {
	grid-area: loginface;
    padding-bottom: 2rem;
}

.logingoo {
	grid-area: logingoo;
    padding-bottom: 2rem;
}

.logingit {
	grid-area: logingit;
    padding-bottom: 2rem;
}
.contents4>img{
	width: 75%;
    position: absolute;
    top: 2rem;
    left: 0;
    bottom: 0;
    right: 0;
    margin: auto;
    display: none;
}
/* 구글 로그인 부분 */
#customBtn {
	display: inline-block;
	background: white;
	color: #444;
	width: 250px;
	border-radius: 5px;
	border: thin solid #888;
	box-shadow: 1px 1px 1px grey;
	white-space: nowrap;
}

#customBtn:hover {
	cursor: pointer;
}

span.label {
	font-family: serif;
	font-weight: normal;
}

span.icon {
	background: url(/resources/imgs/login/google/google_login.png)
		transparent -5px 50% no-repeat;
	display: inline-block;
	vertical-align: middle;
	width: 50px;
	height: 42px;
	background-size: 60px;
	border-radius: 15px;
}

span.buttonText {
	display: inline-block;
	vertical-align: middle;
	padding-left: 5px;
	padding-right: 42px;
	font-size: 16px;
	font-weight: bold;
	/* Use the Roboto font that is loaded in the <head> */
	font-family: 'Roboto', sans-serif;
}

@media screen and (min-width: 800px) {
	div.example {
		display: none;
	}
}
</style>
<script>
	$(document).ready(
			function() {
				var tickr = [ 'Jeong Hae Jwo<ins>2</ins> .com',
						'갈까 말까 할 때는<ins>1</ins> 가라',
						'살까 말까 할 때는 <ins>1</ins><del>사지마라</del>사라',
						'말할까 말까 할 때는<ins>1</ins> 말하지마라', '줄까 말까 할 때는 줘라',
						'먹을까 말까 할 때는 <ins>1</ins><del>먹지마라</del>먹어라' ];

				$('#main_msg').t(
						tickr.join(x = '<ins>2</ins><del>*</del>') + x, {
							speed : 200,
							repeat : true,
							pause_on_click : true
						});
			})
</script>
</head>
<body>
<div class='mainContainers'>
	<div class='login_containers'>
		<div class='contents1'>
			<div class='wrapTri'>
				<div class='section'>
					<div class='downTri'></div>
				</div>
			</div>
		</div>
		<div class='contents2'>
			<div class=msg_container>
				<img class="msg_img1" src="${rPath}/imgs/left_quot.png" />
				<img class="msg_img2" src="${rPath}/imgs/right_quot.png" />
				<pre id='main_msg'></pre>
			</div>


		</div>
		<div class='contents3'>
		
		</div>
		<div class='contents4'>
		<img class='mainLogo' src='${rPath}/imgs/mainlogo.jpg'/>
		<div class='logintxt'>Sign in or Sign up</div>
		<div class='loginface'>
			<div class="fb-login-button" data-max-rows="1" data-size="large" 
			data-button-type="continue_with" data-show-faces="false" data-auto-logout-link="true" 
			data-use-continue-as="false" onlogin="checkLoginState();"></div>
			<!-- <div id="fb-root"></div>
			<div id="status"></div> -->
		</div>
		<div class='logingoo'>
			<div id="gSignInWrapper">
				<div id="customBtn" class="customGPlusSignIn">
					<span class="icon"></span> <span class="buttonText">Sign up with Google</span>
				</div>
			</div>
		</div>
		<div class='logingit'>깃 로그인</div>
		</div>
		
	</div>
	</div>
</body>
<script>
	startApp();
</script>
</html>
