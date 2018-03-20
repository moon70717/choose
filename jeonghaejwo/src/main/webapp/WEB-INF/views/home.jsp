<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Home</title>
</head>
<style>
h1{
text-align:center;
color:white; 
}

.login_containers{
	display: grid;
	grid-template-columns: repeat(12, 1fr);
  	grid-template-areas: 
    	". contents1 contents1 . . . . . . contents3 contents3 ."
    	". contents1 contents1 . contents2 contents2 contents2 contents2 . contents3 contents3 ."
    	". . . . . . . . . . . ."
    	". . . . . logintxt logintxt . . . . ."
    	". . . . . loginface loginface . . . . ."
    	". . . . . logingoo logingoo . . . . ."
    	". . . . . logingit logingit . . . . ."
    	". . . . . . . . . . . .";
    grid-gap: 15px;
    padding: 0px;
    width: 92%;
}
.login_containers > div {
  /* background-color: rgba(255, 255, 255, 0.8); */
  text-align: center;
  padding: 20px 0;
  font-size: 30px;
}


.contents1{
  grid-area: contents1;
}
.contents2{
grid-area:contents2;
    height: 60px;
    overflow: hidden;
    display: grid;
	grid-template-columns: repeat(3, 1fr);
  	grid-template-areas: 
    	"main_msg1 main_msg2 main_msg3";
    padding: 0px;
}

.main_msg1{
	animation: mymove 8s infinite;
	display: inline-block;
	position: relative;
	grid-area: main_msg1;
	    width: 175px;
}

.main_msg2{
display: inline-block;
grid-area: main_msg2;
    width: 68px;
}
.main_msg3{
	animation: mymove 10s infinite;
	display: inline-block;
	position: relative;
	grid-area: main_msg3;
	    width: 127px;
}
@keyframes mymove {
    0%   {top: 0px; }
    12%  {top: -50px; }
    24%  {top: -100px; }
    36%  {top: -150px; }
    48%  {top: -200px; }
    60%  {top: -150px; }
    72%  {top: -100px; }
    84%  {top: -50px; }
    96%  {top: 0px; }
}
.contents3{
grid-area:contents3;
}
.logintxt{
grid-area:logintxt;
}
.loginface{
grid-area:loginface;
}
.loginface{
grid-area:loginface;
}
.logingoo{
grid-area:logingoo;
}
.logingit{
grid-area:logingit;
}

</style>
</head>
<body> 
<div class='login_containers'>
	<div class='contents1'>뭐넣을깡? <br> 날씨?</div>
	<div class='contents2'> 
	<div><span class='main_msg1'>갈까 말까,<br>살까 말까,<br>말할까 말까,<br>줄까 말까,<br>먹을까 말까,</span></div>
	<div><span class='main_msg2'>할 때는</span></div>
	<div><span class='main_msg3'>가라<br>사라<br>말해라<br>줘라<br>먹어라<br>먹지마라<br>주지마라<br>말하지마라<br>사지마라<br>가지마라</span></div>
	
	
	
	</div>
	<div class='contents3'>뭐넣지? <br>달력?</div>
	<div class='logintxt'>로그인을 하자</div>
	<div class='loginface'>페이스북로그인</div>
	<div class='logingoo'>구글로그인</div>
	<div class='logingit'>깃 로그인</div>
</div>
</body>
<script>
$(document).ready(function(){
	$(".default_container").fadeIn("slow");
});   
</script>
</html>
