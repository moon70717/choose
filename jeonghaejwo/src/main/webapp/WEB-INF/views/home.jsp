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
<script>
$(document).ready(function(){
	$(".default_container").fadeIn("slow");
});

var tickr=[
	'gogogo',
	'살까 말까 할 때는 <del>사지마라</del>사라',
	'말할까 말까 할 때는 말해라',
	'줄까 말까 할 때는 주지마라',
	'먹을까 말까 할 때는 <del>먹지마라</del>먹어라'
	];

	$('#main_msg').t(
	tickr.join(x='<ins>2</ins><del>*</del>')+x,
	{speed:30,repeat:true,pause_on_click:true}
	);
</script>
</head>
<body> 
<div class='login_containers'>
	<div class='contents1'>
	<div class='wrapTri'>
		<div class='section'>
		<div class='downTri'></div></div>
	</div>
	</div>
	<div class='contents2'> 
	<div><pre class='main_msg'></pre></div>
	
	
	</div>
	<div class='contents3'>뭐넣지? <br>달력?</div>
	<div class='logintxt'>로그인을 하자</div>
	<div class='loginface'>페이스북로그인</div>
	<div class='logingoo'>구글로그인</div>
	<div class='logingit'>깃 로그인</div>
</div>
</body>

</html>
