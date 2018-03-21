<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
.box {
	width: 150px;
	height: 150px;
	background-color: #3f8d3f;
	position: absolute;
	left: 50px;
	top: 0;
}
</style>
<body>
	<button id="btn">btn</button>
	<div class="box"></div>
</body>
<script>
	/* $("#btn").click(function(e) {
		$(".box").stop().animate({left:"150px"},1000);
	}); */
	var le=10;
	$(".box").hover(function(){
		$(this).stop().animate({left:le},100);
		le+=10;
	})
</script>
</html>