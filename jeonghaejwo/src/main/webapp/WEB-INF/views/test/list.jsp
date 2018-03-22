<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
#container {
	background-color: blue;
	width: 40%;
	height: 40%;
}
</style>
<body>
	<div id="container"></div>
	<button onclick='next()'>next</button>

	<script>
	//$("#container").children()[0].attributes.save.value
		$.ajax({
			url : "/list/all",
			type : 'get',
			success : function(res) {
				console.log(res);
				for(a of res){
					var temp="<div save='"+a.userNo+"'>";
					temp +=JSON.stringify(a);
					temp +="</div>";
					$("#container").append(temp);	
				}
				
			}
		});
	
	function next(){
		console.log($("#container").children().last()[0].attributes.save.value);
	}
	</script>
</body>
</html>